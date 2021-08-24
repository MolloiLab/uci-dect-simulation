%% Perform the forward projection
sino_array = FP.generateSinograms(phantom, XRS.energies);


imtool3D(sino_array);

%% Filter the sinogram with the detector

real_sinogram = Detector.filterSinogramArray(XRS, sino_array);

imtool(real_sinogram, [])

%% Forward Projection based on the individual materials
Material_FP = MaterialForwardProjectorAdapter(FP);

sino_array = Material_FP.generateSinograms(phantom, XRS.energies);

%% Reconstruct with the back projector

BP = AstraFilteredBackProjector(Geoms.ProjectionGeometry, Geoms.ReconGeometry);
% BP.useGPU = false;

I = BP.reconstruct(circshift(real_sinogram, 180));

figure
imshow(I,[])