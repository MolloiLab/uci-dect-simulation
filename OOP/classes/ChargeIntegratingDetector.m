classdef ChargeIntegratingDetector < Detector_Base...
                                   & Detector_Incrementable
%CHARGEINTEGRATINGDETECTOR Models a charge integrating detector with energy
%dependent gain factors.
%
% The integration function defaults to @(E)E, but can be set to a different
% univarite funtion of the energy by setting the integration_func property.
%

    properties
        % the detector material, used for DQE calculations
		detector_material
        % the detector thickness, used for DQE calculations
		detector_thickness
		
        % energy dependent gain function, default is @(E) E
		integration_func
        % determines the amount of focal spot blurring to apply
        focal_spot_blur
        
        % method to use for generating noise, can be 'none' 'poisson' 'normal' or 'hybrid'
        noise_type;
    end
        
    methods
        function this = ChargeIntegratingDetector(ProjectionGeometry)
			% Constructor for a ChargeIntegratingDetector object. Takes
			% only a ProjectionGeometry
            
            if ~isa(ProjectionGeometry, 'ProjectionGeometry')
                error([mfilename ':CtorInput'],...
                    'A projection geometry is expected as input.');
            end
			this.ProjectionGeometry = ProjectionGeometry;
            
			% integration function defaults to the identity function
			this.integration_func = @(E) E;
            % default to not apply the focal spot blurring
            this.focal_spot_blur = 0;
            % default is to not add noise
            this.noise_type = 'none';
        end
        
% % % % % % % Getters and Setters
		function set.integration_func(this, func)
			if ~isa(func, 'function_handle')
				error([mfilename, ':SetFunc'],...
					'integration_func must be set to a function handle, eg. ''@(E) E''.');
			end
			this.integration_func = func;
        end
        
        
        function set.noise_type(this, new_noise)
            allowed_types = {'poisson', 'gaussian', 'normal', 'hybrid', 'none'};
            
            check = cellfun(@(X) strcmpi(new_noise, X), allowed_types);
            if any(check)
                this.noise_type = new_noise;
            else
                error([mfilename, ':SetNoise'],...
                    'Invalide noise type. Must be one of: ''poisson'' ''gaussian'' ''hybrid'' ''none''.');
            end
        end
        
% % % % % % % Implementation of abstract methods from Detector_Base

        function [new_sinogram, sinogram_noNoise, sinogram_Noise] = filterSinogramArray(this, XRaySource, sinogram_array)
			% Filters an array of ideal sinograms to produce a single output
			% sinogram suitable to pass to the back projector
			
			% First construct some variables and aliases
			dimensionality = this.ProjectionGeometry.dimensionality;
			energies = XRaySource.energies;
			Io 		 = XRaySource.spectrum;
			% A 'hack' to make this detector work for any dimensionality of
			% the sinogram_array with the same code. This array is passed
			% into permute to reshape vectors of energy depenedent
			% parameters to be the in the energy dimension of the sinogram
			% array (ie the last dimension) so that they can be applied to
			% both 2D and 3D sinograms with bsxfun.
			permuter = circshift((1:dimensionality+1)', -1)';
			
			% Convert ut sinograms to count sinograms
			%   I = Io*exp(-u t)
			Io = permute(Io, permuter);
            sinogram_array = bsxfun(@times, exp(-sinogram_array), Io);
%             imtool3D(sinogram_array);
%             % consistency check to make sure that most pixels have adequate
%             % signal to produce reliable results. If the counts are too
%             % low, the noise addition can cause problems (zero or negative
%             % counts...)
%             percent_low_counts = sum( sinogram_array(:) < 10 ) / numel(sinogram_array);
%             if percent_low_counts > .25
%                 warning([mfilename, ':CountCheck'],...
%                     '%d%% pixels have low counts which may cause erroneous results.', percent_low_counts);
%             end
%             
            % Apply noise to the count sinograms
            sinogram_array_noise = this.addNoise(sinogram_array);
            
            
            
            %% W/ NOISE
			% Optionally Modify counts according to the quantum detection
			% efficiency of the detector.
            reduction_factor = this.quantumDetectionEfficieny(energies);
            % A reduction_factor of 1 indicates that nothing should change,
            % we only need to do this operation if any value is not unity
			if any(reduction_factor ~= 1)
				% reshape the reduction_factor for to use with bsxfun
				reduction_factor = permute(reduction_factor(:), permuter);
				sinogram_array_noise = bsxfun(@times, sinogram_array_noise, reduction_factor);
			end
			
			% Integrate the sinograms into a single detected sinogram
			%  generate the weighting factors
			weights = this.integration_func(energies);
			weights = permute(weights(:), permuter);
			%  multiply sinograms by the weighting factors
			sinogram_array_noise = bsxfun(@times, sinogram_array_noise, weights);
			%  sum the sinograms
			new_sinogram_noise = sum(sinogram_array_noise, dimensionality+1);
            
            %% W/O NOISE
			% Optionally Modify counts according to the quantum detection
			% efficiency of the detector.
            reduction_factor = this.quantumDetectionEfficieny(energies);
            % A reduction_factor of 1 indicates that nothing should change,
            % we only need to do this operation if any value is not unity
			if any(reduction_factor ~= 1)
				% reshape the reduction_factor for to use with bsxfun
				reduction_factor = permute(reduction_factor(:), permuter);
				sinogram_array = bsxfun(@times, sinogram_array, reduction_factor);
			end
			
			% Integrate the sinograms into a single detected sinogram
			%  generate the weighting factors
			weights = this.integration_func(energies);
			weights = permute(weights(:), permuter);
			%  multiply sinograms by the weighting factors
			sinogram_array = bsxfun(@times, sinogram_array, weights);
			%  sum the sinograms
			new_sinogram = sum(sinogram_array, dimensionality+1);
            
            
            %% 
			new_sinogram = this.doFocalSpotBlurring(new_sinogram);      
            % GET NEW_SINOGRAM STD HERE and SAVE TO FILE
            sinogram_noNoise = new_sinogram;
%             new_sinogram = this.addNoise(new_sinogram);  % TEMPORARILY MOVED HERE
            % Focal spot blurring
            
            % GET NEW_SINOGRAM STD HERE and SAVE TO FILE
            sinogram_Noise = new_sinogram;
            % Convert the final count sinogram into effective ut values
            %  ut = -log(I/Ieff)
            % Ieff is the ideal count sinogram if there was no object in
            % the beam path, including the effect of the weights.
            Ieff = sum(Io(:) .* weights(:));
            new_sinogram = -log(new_sinogram / Ieff);
        end
        
        function bool = validate(this)
            bool = true;
        end
        
% % % % % % % Implementation of abstract methods from Detector_Incrementable

        function addSinogram(this, Io, energy, sinogram)
            % Adds another sinogram to the detector
            
            % Convert ut sinograms to count sinograms
			%   I = Io*exp(-u t)
            sinogram = Io .* exp(-sinogram);
            
            % Apply noise to the count sinograms
            sinogram = this.addNoise(sinogram);
            
			% Modify counts according to the quantum detection efficiency
			% and the energy dependent gain of the detector
            reduction_factor = this.quantumDetectionEfficieny(energy);
            weight = this.integration_func(energy);
            
            sinogram = sinogram .* (reduction_factor * weight);
            
            % Check if the summed_sinogram array needs to be allocated
            if isempty(this.summed_sinogram)
                this.summed_sinogram = sinogram;
            else % just add to it
                this.summed_sinogram = this.summed_sinogram + sinogram;
            end
        end
        
        function result = computeResultingSinogram(this, XRaySource)
            % Computes the 'real' output sinogram after integration. 
            %
            % The XRaySource must be the same one that was used to generate
            % sinograms added by addSinogram(). It is assumed that all of
            % the unmasked energies have been added.
            %
            % For example, it is expected that the conversion from counts
            % sinogram to mu*t sinogram will occur within this function.
            
            % some local aliases
            energies = XRaySource.energies;
			Io 		 = XRaySource.spectrum;
            weights  = this.integration_func(energies);
            
            result = this.summed_sinogram;
            
            % Focal spot blurring
            result = this.doFocalSpotBlurring(result);
            
            % Convert the final count sinogram into effective ut values
            %  ut = -log(I/Ieff)
            % Ieff is the ideal count sinogram if there was no object in
            % the beam path, including the effect of the weights.
            Ieff = sum(Io(:) .* weights(:));
            result = -log(result / Ieff);
        end
    end % methods
    
    methods (Access = private)
        
        function N = addNoise(this, S)
            % Adds noise to the sinogram S
            
            % if noise_type is 'none', we just return the input sinogram
            if strcmpi(this.noise_type, 'none')
                N = S;
                return;
            end
            
            % Apply noise to the count sinograms
            if strcmpi(this.noise_type, 'poisson')
                % Generate Poisson noise in the count sinograms
                N = poissrnd(S);
%                 N = S;
                
            elseif strcmpi(this.noise_type, 'gaussian') || strcmpi(this.noise_type, 'normal')
                % Additive Gaussian noise instead (valid if the counts are
                % high enough)
                % Mean and variance are both equal to lambda
                noise = sqrt(S) .* randn(size(S));
                N = S + noise;
                
            elseif strcmpi(this.noise_type, 'hybrid')
                % Generates Poisson noise for low counts (<100) and uses
                % additive Gaussian noise for higher counts
                N = zeros(size(S));
                
                low_counts = S(:) < 100;
                high_counts = ~low_counts;
                N(low_counts) = poissrnd(S(low_counts));
                
                noise = sqrt(S(high_counts)) .* randn(sum(high_counts), 1);
                N(high_counts) = S(high_counts) + noise;
                
            else
                % Input checking on noise_type occurs in the set.noise_type
                % function
                error([mfilename, ':NoiseType'],...
                    'That should not have happened.');
            end
        end
        
        function blurred = doFocalSpotBlurring(this, sinogram)
            % Applies Gaussian blurring to the inputted sinogram
            
            % local aliases
            dimensionality = this.ProjectionGeometry.dimensionality;
            FS_sigma = this.focal_spot_blur / this.ProjectionGeometry.detector_element_size(1);
            if FS_sigma > 0
                if dimensionality == 2
                    % Apply a 1D Gaussian filter along the scan direction
                    % of the sinogram_array
					FS = fspecial('Gaussian', [1, ceil(3*FS_sigma)], FS_sigma/2);  %FS_sigma is used as STD to make Gaussian blur.  Halved because of this;
					blurred = imfilter( sinogram, FS, 'replicate');
                elseif dimensionality == 3
                    % 2D Gaussian filtering
                    filter_size = ceil(3*FS_sigma);
                    FS = fspecial('Gaussian', [filter_size, filter_size],...
                                             FS_sigma);
					blurred = imfilter( sinogram, FS, 'replicate');
                end
            else
                blurred = sinogram;
            end
        end
        
        function reduction = quantumDetectionEfficieny(this, energies)
            % Determines the multiplicative reduction factor of the counts
            % to model the quantum detection efficiency of the detector.
            % Essentially, this is the ratio of the number of detected
            % photons to the total number of photons that hit the detector.
            %   I_d = I*(1 - exp(-ud td) )
            
            % If the material and thickness are not inputted, we assume
            % that all photons are detected
            if isempty(this.detector_material) || isempty(this.detector_thickness)
                reduction = 1;
                return;
            end
            
            detector_lmu = crosssect(this.detector_material, energies(:), 'linear');
            reduction = 1 - exp(-this.detector_thickness .* detector_lmu);
%             fprintf('DETECTOR REDUCTION: %d  ENERGY: %d\n',reduction, energies(:));
%             fprintf('MATERIAL: %s\n',this.detector_material);
%             fprintf('THICK: %s\n',this.detector_thickness);
        end
    end % methods (Private)
    
end % classdef