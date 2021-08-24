function mu = crosssectfrac(varargin)
%CROSSSECTFRAC computes x-ray cross sections give fractions of materials
%
%
kev=varargin{1};
masslinear=varargin{2};
type=varargin{3};
for i=4:2:length(varargin)
    mat{i/2-1}=varargin{i};
    frac(i/2-1)=varargin{i+1};
end;
mu=zeros(length(kev),1);
s=sum(frac);
for i=1:length(mat)
    f=frac(i)/s;
    mu=mu+crosssect(mat{i},kev,masslinear,type)*f;
end;