function mu = crossect_targetHU(value, energies)
% Returns mu for a material that will have an attenuation equivalent to
% 'value' in Hounsfield units for each energy in energies.

air_mu = crosssect('Air, Dry (near sea level)', energies, 'linear');
water_mu = crosssect('Water', energies, 'linear');

mu = water_mu + value/1000.*(water_mu - air_mu);