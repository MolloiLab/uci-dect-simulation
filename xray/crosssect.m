function mu = crosssect(z,e,lin,cr)
%CROSSSECT Computes x-ray cross sections for elements, compound or mixtures
%   based on John Boone polynomial fitting method
%
%   U = crosssect(z,e,lin,cr) returns the cross sections of 
%   a material z at energy e based on different types
%
%   -- z is a column vector of cross sections, required
%   -- e is a column vector of energies, optional
%   -- lin is either 'linear' or 'mass', optional
%   -- cr is the type of cross sections, can take on the following values
%       'total atten'
%       'photo atten'
%       'rayleigh atten'
%       'compton atten'
%       'pair atten'
%       'triplet atten'
%       'total abs'
%       'photo abs'
%       'rayleigh abs'
%       'compton abs'
%       'pair abs'
%       'total en'
%       'photo en'
%       'rayleigh en'
%       'compton en'
%       'pair en'
%
%   if e is not specified then energies are from 1-200 keV
%   if lin is not specified, then 'mass' is assumed
%   if cr is not specified then 'total atten' is assumed
%
%Written by Huy Le, Molloi Laboratory, UCI Department of Radiological
%Sciences
%   Inquiries can be sent to qdefiant@yahoo.com

symbol; %load element symbols
mu=-1;
t=2; %default to computing total cross section attenuation
ismixture = false;
if not(exist('e'))
    e=(1:200)';
end;
if (strcmp(z,'Yaffe Fat')||strcmp(z,'Yaffe Fibrous')||strcmp(z,'Yaffe Carcinoma'))
    mu=yaffemu(z,e,lin);
    return;
end;
if ischar(z) 
    % check if z is symbol or atomic number
    for n=1:length(Symbol)
        if strcmp(Symbol(n,:),z)
            z=n;
        end;
    end;
    if ischar(z) % if we still have a char, check the mixtures array
        mixtures;
        for n=1:length(mix)
            if strcmp(mix{n}{1},z)
                z=n;
                ismixture=true;
            end
        end
    end
    % Section added by Travis
    if ~ischar(z)
        % if z is no longer of type 'char' then the material has been found
        % and we want to skip these checks so we just let this fall through
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'GlandAndAdip')
        clear mix;
        mix = { mixGlandAndAdip( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterAndLipid')
        clear mix;
        mix = { mixWaterAndLipid( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterAndCa')
        clear mix;
        mix = { mixWaterAndCa( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterAndProtein')
        clear mix;
        mix = { mixWaterAndProtein( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'LipidAndCa')
        clear mix;
        mix = { mixLipidAndCa( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'LipidAndProtein')
        clear mix;
        mix = { mixLipidAndProtein( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterAndIodine')
        clear mix;
        mix = { mixWaterAndIodine( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterLipidCalcium')
        clear mix;
        mix = { mixWaterLipidCalcium( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterLipidProteinCalcium')
        clear mix;
        mix = { mixWaterLipidProteinCalcium( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp(regexprep(z,'[0-9 .]', ''), 'WaterLipidProtein')
        clear mix;
        mix = { mixWaterLipidProtein( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterIodineCalcium')
        clear mix;
        mix = { mixWaterIodineCalcium( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterAndDelrin')
        clear mix;
        mix = { mixWaterAndDelrin( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterAndPolyethylene')
        clear mix;
        mix = { mixWaterAndPolyethylene( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'DelrinAndPolyethylene')
        clear mix;
        mix = { mixDelrinAndPolyethylene( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterDelrinPolyethyleneCalcium')
        clear mix;
        mix = { mixWaterDelrinPolyethyleneCalcium( z ) };
        z = 1;
        ismixture = true;
    elseif strcmp( regexprep(z,'[0-9 .]', ''), 'WaterDelrinPolyethylene')
        clear mix;
        mix = { mixWaterDelrinPolyethylene( z ) };
        z = 1;
        ismixture = true;
    elseif strncmp( z, 'HU_', 3)
        % Generate a material with the target HU value at all energies
        HUvalue = str2double(z(4:end));
        mu = crossect_targetHU(HUvalue, e);
        return
    end
    % End Travis
    if ischar(z) %z is not recognizable
        disp('unrecognized symbol');
        return
    end;
end;
dens=1;
if exist('lin')&&strcmp(lin,'linear') %linear or mass mu
    if ismixture
        dens=mix{z}{2}; %set density if linear mu
    else
        density;
        dens=element_density(z);
    end;
end;
if exist('cr')
    switch cr
        case 'total atten'
            t=2;
        case 'photo atten'
            t=3;
        case 'rayleigh atten'
            t=4;
        case'compton atten'
            t=5;
        case'pair atten'
            t=6;
        case 'triplet atten'
            t=7;
        case 'total abs'
            t=8;
        case 'photo abs'
            t=9;
        case 'rayleigh abs'
            t=1;
        case 'compton abs'
            t=10;
        case 'pair abs'
            t=11;
        case 'total en'
            t=12;
        case 'photo en'
            t=13;
        case 'rayleigh en'
            t=1;
        case 'compton en'
            t=14;
        case 'pair en'
            t=15;
        otherwise
            t=-1;
    end;
end;
if t==-1
    disp('wrong type');
    return;
end;
if ismixture
    for n=1:length(mix{z}{3})
        exp=sprintf('z%d(t,e)',mix{z}{3}(n));% z expression
        mus(:,n)=eval(exp)*mix{z}{4}(n);% compute coefficients
    end;
    mu=sum(mus,2)*dens;
else
    exp = sprintf('z%d(t,e)',z);
    mu = eval(exp)*dens;
end;