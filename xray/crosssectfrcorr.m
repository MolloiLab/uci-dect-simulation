function [mu effden]=crosssectfrcorr(mats,fracs,kev,ml,type)
%mats in the form: {'matteral 1' 'material 2' ...}
%fracs is the array of mass fractions, must be the same size as mats
%kev: either scalar or  vector
%ml: either 'linear' or 'mass'
%type: type of crossection, default to total 
mu=zeros(length(kev),1);
s=sum(fracs);
for i=1:length(fracs)
    f=fracs(i)/s;
    mu=mu+f*crosssect(mats{i},kev,'mass',type);
end;
effden=0;
if strcmp(ml,'linear')
    %only linear mu affected by the densit difference
    mixtures;
    sm=size(mats);
    mden=zeros(sm(2),1);
    tvol=0;
    tmass=sum(fracs);
    for m=1:sm(2)
        %determine density of individual materials
        mden(m)=crosssect(mats{m},50,'linear')/crosssect(mats{m},50,'mass');
        tvol=tvol+fracs(m)/mden(m);
    end;
    effden=tmass/tvol;
    
    mu=mu*effden;
end;
