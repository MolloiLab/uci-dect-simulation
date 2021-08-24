function mu=crosssectfr(mats,fracs,kev,ml,type)
%
%
mu=zeros(length(kev),1);
s=sum(fracs);
for i=1:length(fracs)
    f=fracs(i)/s;
    mu=mu+f*crosssect(mats{i},kev,ml,type);
end;