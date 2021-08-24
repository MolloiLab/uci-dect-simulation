function yu = yaffemu(z,e,lm)
pmmalu = crosssect('Polymethyl Methacrylate Yaffe',e,'linear');
allu = crosssect('Al',e,'linear');
dfat=0.928;
dfibrous=1.035;
dcarcinoma=1.044;
density=1;
if strcmp(z,'Yaffe Fat')
    alu=0.8289;
    aal=-0.0075;
    density=dfat;
elseif strcmp(z,'Yaffe Fibrous');
    alu=0.8382;
    aal=0.0299;
    density=dfibrous;
elseif strcmp(z,'Yaffe Carcinoma')
    alu=0.8411;
    aal=0.0343;
    density=dcarcinoma;
else
    alu=0;
    aal=0;
end;
yu =alu*pmmalu+aal*allu;

if strcmp(lm,'mass')
     yu=yu./density;
end;