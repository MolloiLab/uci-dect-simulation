 
function zr =z11(flag,e)

za = [9.961300e-001,6.570552e+002,6.562955e+002,7.427102e-001,...
 1.265101e-002,0.000000e+000,0.000000e+000,...
 6.457600e+002,6.488418e+002,3.277651e-005,0.000000e+000,...
 6.562988e+002,6.562988e+002,3.247583e-005,0.000000e+000;...
1.000000e+000,6.490397e+002,6.483063e+002,7.190568e-001,...
 1.271388e-002,0.000000e+000,0.000000e+000,...
 6.457600e+002,6.488418e+002,3.277651e-005,0.000000e+000,...
 6.483007e+002,6.483007e+002,3.274047e-005,0.000000e+000;...
1.024200e+000,6.127870e+002,6.121845e+002,5.891075e-001,...
 1.308636e-002,0.000000e+000,0.000000e+000,...
 6.063373e+002,6.091623e+002,3.449458e-005,0.000000e+000,...
 6.121680e+002,6.121680e+002,3.453501e-005,0.000000e+000;...
1.039100e+000,5.905481e+002,5.900766e+002,4.572197e-001,...
 1.331425e-002,0.000000e+000,0.000000e+000,...
 5.837000e+002,5.863802e+002,3.557565e-005,0.000000e+000,...
 5.900099e+002,5.900099e+002,3.563450e-005,0.000000e+000;...
1.045500e+000,5.808563e+002,5.804633e+002,3.723243e-001,...
 1.341352e-002,0.000000e+000,0.000000e+000,...
 5.743338e+002,5.769549e+002,3.604543e-005,0.000000e+000,...
 5.804682e+002,5.804682e+002,3.611771e-005,0.000000e+000;...
1.049400e+000,5.749626e+002,5.746221e+002,3.132564e-001,...
 1.347377e-002,0.000000e+000,0.000000e+000,...
 5.687278e+002,5.713135e+002,3.633333e-005,0.000000e+000,...
 5.746210e+002,5.746210e+002,3.641039e-005,0.000000e+000;...
1.053400e+000,5.689117e+002,5.686498e+002,2.584634e-001,...
 1.353506e-002,0.000000e+000,0.000000e+000,...
 5.630559e+002,5.656061e+002,3.662992e-005,0.000000e+000,...
 5.686359e+002,5.686359e+002,3.670817e-005,0.000000e+000;...
1.059600e+000,5.596390e+002,5.594032e+002,2.298095e-001,...
 1.363041e-002,0.000000e+000,0.000000e+000,...
 5.544177e+002,5.569141e+002,3.709205e-005,0.000000e+000,...
 5.593992e+002,5.593992e+002,3.717082e-005,0.000000e+000;...
1.063000e+000,5.546620e+002,5.543739e+002,2.681762e-001,...
 1.368254e-002,0.000000e+000,0.000000e+000,...
 5.497586e+002,5.522260e+002,3.734684e-005,0.000000e+000,...
 5.543741e+002,5.543741e+002,3.742396e-005,0.000000e+000;...
1.064000e+000,5.531952e+002,5.528809e+002,2.829497e-001,...
 1.369773e-002,0.000000e+000,0.000000e+000,...
 5.483971e+002,5.508560e+002,3.742196e-005,0.000000e+000,...
 5.528852e+002,5.528852e+002,3.749720e-005,0.000000e+000;...
1.064000e+000,6.530736e+003,6.530475e+003,2.829497e-001,...
 1.369773e-002,0.000000e+000,0.000000e+000,...
 6.498152e+003,6.527287e+003,3.742947e-005,0.000000e+000,...
 6.414982e+003,6.414982e+003,3.749720e-005,0.000000e+000;...
1.071000e+000,6.446653e+003,6.446129e+003,4.671473e-001,...
 1.380539e-002,0.000000e+000,0.000000e+000,...
 6.413708e+003,6.442279e+003,3.794990e-005,0.000000e+000,...
 6.332859e+003,6.332859e+003,3.802043e-005,0.000000e+000;...
1.071700e+000,6.438533e+003,6.438009e+003,4.879455e-001,...
 1.381613e-002,0.000000e+000,0.000000e+000,...
 6.405205e+003,6.433719e+003,3.800291e-005,0.000000e+000,...
 6.325071e+003,6.325071e+003,3.807343e-005,0.000000e+000;...
1.079100e+000,6.350521e+003,6.349735e+003,7.035499e-001,...
 1.393007e-002,0.000000e+000,0.000000e+000,...
 6.316333e+003,6.344257e+003,3.856578e-005,0.000000e+000,...
 6.239036e+003,6.239036e+003,3.862833e-005,0.000000e+000;...
1.089600e+000,6.226098e+003,6.225050e+003,8.951080e-001,...
 1.409117e-002,0.000000e+000,0.000000e+000,...
 6.193355e+003,6.220470e+003,3.937202e-005,0.000000e+000,...
 6.117665e+003,6.117665e+003,3.941298e-005,0.000000e+000;...
1.100000e+000,6.102200e+003,6.101152e+003,9.973701e-001,...
 1.425121e-002,0.000000e+000,0.000000e+000,...
 6.075034e+003,6.101379e+003,4.017927e-005,0.000000e+000,...
 5.996911e+003,5.996911e+003,4.019567e-005,0.000000e+000;...
1.117100e+000,5.942153e+003,5.941105e+003,1.122919e+000,...
 1.451735e-002,0.000000e+000,0.000000e+000,...
 5.887691e+003,5.912832e+003,4.152564e-005,0.000000e+000,...
 5.840395e+003,5.840395e+003,4.148966e-005,0.000000e+000;...
1.154800e+000,5.589317e+003,5.588007e+003,1.301380e+000,...
 1.510541e-002,0.000000e+000,0.000000e+000,...
 5.505090e+003,5.527826e+003,4.453534e-005,0.000000e+000,...
 5.496424e+003,5.496424e+003,4.436236e-005,0.000000e+000;...
1.193200e+000,5.232291e+003,5.230719e+003,1.421847e+000,...
 1.561855e-002,0.000000e+000,0.000000e+000,...
 5.152328e+003,5.172919e+003,4.752792e-005,0.000000e+000,...
 5.147863e+003,5.147863e+003,4.813580e-005,0.000000e+000;...
1.250000e+000,4.707097e+003,4.705525e+003,1.543021e+000,...
 1.637740e-002,0.000000e+000,0.000000e+000,...
 4.689343e+003,4.707229e+003,5.206213e-005,0.000000e+000,...
 4.634397e+003,4.634397e+003,5.372029e-005,0.000000e+000;...
1.318200e+000,4.259176e+003,4.257604e+003,1.654530e+000,...
 1.729026e-002,0.000000e+000,0.000000e+000,...
 4.211106e+003,4.226335e+003,5.777325e-005,0.000000e+000,...
 4.196107e+003,4.196107e+003,6.043569e-005,0.000000e+000;...
1.364900e+000,3.954800e+003,3.953228e+003,1.703828e+000,...
 1.791552e-002,0.000000e+000,0.000000e+000,...
 3.924453e+003,3.938157e+003,6.185168e-005,0.000000e+000,...
 3.897782e+003,3.897782e+003,6.504251e-005,0.000000e+000;...
1.400000e+000,3.726386e+003,3.724552e+003,1.739111e+000,...
 1.838544e-002,0.000000e+000,0.000000e+000,...
 3.712006e+003,3.724643e+003,6.500666e-005,0.000000e+000,...
 3.673679e+003,3.673679e+003,6.850522e-005,0.000000e+000;...
1.496700e+000,3.236293e+003,3.234459e+003,1.806797e+000,...
 1.968258e-002,0.000000e+000,0.000000e+000,...
 3.169866e+003,3.179957e+003,7.409568e-005,0.000000e+000,...
 3.193225e+003,3.193225e+003,7.805706e-005,0.000000e+000;...
1.546700e+000,2.984828e+003,2.982995e+003,1.832074e+000,...
 2.035420e-002,0.000000e+000,0.000000e+000,...
 2.932936e+003,2.941970e+003,7.902338e-005,0.000000e+000,...
 2.946241e+003,2.946241e+003,8.301785e-005,0.000000e+000;...
1.600000e+000,2.717124e+003,2.715290e+003,1.850017e+000,...
 2.106930e-002,0.000000e+000,0.000000e+000,...
 2.707176e+003,2.715236e+003,8.444726e-005,0.000000e+000,...
 2.682801e+003,2.682801e+003,8.829172e-005,0.000000e+000;...
1.655900e+000,2.506025e+003,2.504139e+003,1.856278e+000,...
 2.182160e-002,0.000000e+000,0.000000e+000,...
 2.495616e+003,2.502795e+003,9.032497e-005,0.000000e+000,...
 2.475249e+003,2.475249e+003,9.384413e-005,0.000000e+000;...
1.703300e+000,2.339325e+003,2.337439e+003,1.861595e+000,...
 2.245943e-002,0.000000e+000,0.000000e+000,...
 2.313340e+003,2.319809e+003,9.545177e-005,0.000000e+000,...
 2.311198e+003,2.311198e+003,9.854863e-005,0.000000e+000;...
1.795500e+000,2.017162e+003,2.015250e+003,1.871942e+000,...
 2.369920e-002,0.000000e+000,0.000000e+000,...
 2.007751e+003,2.013076e+003,1.058087e-004,0.000000e+000,...
 1.993713e+003,1.993713e+003,1.077015e-004,0.000000e+000;...
1.800000e+000,2.001341e+003,1.999429e+003,1.872440e+000,...
 2.375997e-002,0.000000e+000,0.000000e+000,...
 1.994286e+003,1.999562e+003,1.063275e-004,0.000000e+000,...
 1.978087e+003,1.978087e+003,1.081531e-004,0.000000e+000;...
1.981000e+000,1.554442e+003,1.552582e+003,1.845198e+000,...
 2.619943e-002,0.000000e+000,0.000000e+000,...
 1.541407e+003,1.545111e+003,1.282210e-004,0.000000e+000,...
 1.537521e+003,1.537521e+003,1.261729e-004,0.000000e+000;...
2.000000e+000,1.507554e+003,1.505695e+003,1.842316e+000,...
 2.645090e-002,0.000000e+000,0.000000e+000,...
 1.502352e+003,1.505928e+003,1.306351e-004,0.000000e+000,...
 1.491246e+003,1.491246e+003,1.303244e-004,0.000000e+000;...
2.200000e+000,1.166925e+003,1.165092e+003,1.796791e+000,...
 2.908865e-002,0.000000e+000,0.000000e+000,...
 1.162727e+003,1.165242e+003,1.572263e-004,0.000000e+000,...
 1.154901e+003,1.154901e+003,1.739069e-004,0.000000e+000;...
2.345200e+000,9.831467e+002,9.813655e+002,1.759516e+000,...
 3.100345e-002,0.000000e+000,0.000000e+000,...
 9.791315e+002,9.811183e+002,1.779406e-004,0.000000e+000,...
 9.733052e+002,9.733052e+002,2.055560e-004,0.000000e+000;...
2.388200e+000,9.396643e+002,9.378831e+002,1.748436e+000,...
 3.157186e-002,0.000000e+000,0.000000e+000,...
 9.324445e+002,9.343024e+002,1.843126e-004,0.000000e+000,...
 9.303379e+002,9.303379e+002,2.149299e-004,0.000000e+000;...
2.500000e+000,8.276580e+002,8.259030e+002,1.718496e+000,...
 3.304660e-002,0.000000e+000,0.000000e+000,...
 8.243618e+002,8.259307e+002,2.013867e-004,0.000000e+000,...
 8.195674e+002,8.195674e+002,2.392832e-004,0.000000e+000;...
2.636500e+000,7.285391e+002,7.268365e+002,1.680043e+000,...
 3.484352e-002,0.000000e+000,0.000000e+000,...
 7.144041e+002,7.156932e+002,2.232228e-004,0.000000e+000,...
 7.215118e+002,7.215118e+002,2.689800e-004,0.000000e+000;...
2.645800e+000,7.218072e+002,7.200784e+002,1.677424e+000,...
 3.496663e-002,0.000000e+000,0.000000e+000,...
 7.076616e+002,7.089340e+002,2.247501e-004,0.000000e+000,...
 7.148107e+002,7.148107e+002,2.710045e-004,0.000000e+000;...
2.780400e+000,6.244172e+002,6.227408e+002,1.639573e+000,...
 3.674259e-002,0.000000e+000,0.000000e+000,...
 6.191415e+002,6.202007e+002,2.474176e-004,0.000000e+000,...
 6.184234e+002,6.184234e+002,3.003332e-004,0.000000e+000;...
2.800000e+000,6.102462e+002,6.085697e+002,1.634046e+000,...
 3.699930e-002,0.000000e+000,0.000000e+000,...
 6.075410e+002,6.085731e+002,2.508062e-004,0.000000e+000,...
 6.043843e+002,6.043843e+002,3.045939e-004,0.000000e+000;...
2.993300e+000,5.103939e+002,5.087698e+002,1.580793e+000,...
 3.954799e-002,0.000000e+000,0.000000e+000,...
 5.075877e+002,5.083941e+002,2.854169e-004,0.000000e+000,...
 5.054887e+002,5.054887e+002,3.466719e-004,0.000000e+000;...
3.006200e+000,5.043168e+002,5.027190e+002,1.577231e+000,...
 3.971826e-002,0.000000e+000,0.000000e+000,...
 5.015921e+002,5.023855e+002,2.878035e-004,0.000000e+000,...
 4.994826e+002,4.994826e+002,3.495008e-004,0.000000e+000;...
3.200000e+000,4.222242e+002,4.206788e+002,1.523402e+000,...
 4.227219e-002,0.000000e+000,0.000000e+000,...
 4.200607e+002,4.206848e+002,3.248143e-004,0.000000e+000,...
 4.181257e+002,4.181257e+002,3.916709e-004,0.000000e+000;...
3.408900e+000,3.563196e+002,3.548004e+002,1.468289e+000,...
 4.502520e-002,0.000000e+000,0.000000e+000,...
 3.510166e+002,3.515060e+002,3.671282e-004,0.000000e+000,...
 3.528052e+002,3.528052e+002,4.371243e-004,0.000000e+000;...
3.500000e+000,3.275846e+002,3.260915e+002,1.442619e+000,...
 4.622490e-002,0.000000e+000,0.000000e+000,...
 3.256898e+002,3.261320e+002,3.863643e-004,0.000000e+000,...
 3.242901e+002,3.242901e+002,4.569369e-004,0.000000e+000;...
3.741700e+000,2.711885e+002,2.697740e+002,1.378993e+000,...
 4.940749e-002,0.000000e+000,0.000000e+000,...
 2.694344e+002,2.697764e+002,4.396985e-004,0.000000e+000,...
 2.683729e+002,2.683729e+002,5.094695e-004,0.000000e+000;...
4.000000e+000,2.245392e+002,2.231745e+002,1.311962e+000,...
 5.281011e-002,0.000000e+000,0.000000e+000,...
 2.229090e+002,2.231735e+002,5.000783e-004,0.000000e+000,...
 2.220958e+002,2.220958e+002,5.656797e-004,0.000000e+000;...
4.224900e+000,1.958330e+002,1.945207e+002,1.257898e+000,...
 5.577268e-002,0.000000e+000,0.000000e+000,...
 1.907748e+002,1.909890e+002,5.554214e-004,0.000000e+000,...
 1.936340e+002,1.936340e+002,6.145947e-004,0.000000e+000;...
4.242600e+000,1.935751e+002,1.922654e+002,1.253680e+000,...
 5.600581e-002,0.000000e+000,0.000000e+000,...
 1.885185e+002,1.887292e+002,5.598950e-004,0.000000e+000,...
 1.913940e+002,1.913940e+002,6.184391e-004,0.000000e+000;...
4.486900e+000,1.625035e+002,1.612488e+002,1.195451e+000,...
 5.922246e-002,0.000000e+000,0.000000e+000,...
 1.607527e+002,1.609224e+002,6.233928e-004,0.000000e+000,...
 1.605544e+002,1.605544e+002,6.715281e-004,0.000000e+000;...
4.500000e+000,1.608376e+002,1.595855e+002,1.192307e+000,...
 5.939533e-002,0.000000e+000,0.000000e+000,...
 1.594245e+002,1.595923e+002,6.268898e-004,0.000000e+000,...
 1.589015e+002,1.588992e+002,6.743793e-004,0.000000e+000;...
4.888600e+000,1.286056e+002,1.274321e+002,1.106731e+000,...
 6.451106e-002,0.000000e+000,0.000000e+000,...
 1.259448e+002,1.260665e+002,7.348788e-004,0.000000e+000,...
 1.269331e+002,1.269310e+002,7.588431e-004,0.000000e+000;...
5.000000e+000,1.193827e+002,1.182327e+002,1.082920e+000,...
 6.586269e-002,0.000000e+000,0.000000e+000,...
 1.181220e+002,1.182335e+002,7.673483e-004,0.000000e+000,...
 1.177775e+002,1.177755e+002,7.910402e-004,0.000000e+000;...
5.244000e+000,1.051618e+002,1.040591e+002,1.034016e+000,...
 6.869166e-002,0.000000e+000,0.000000e+000,...
 1.026215e+002,1.027137e+002,8.387350e-004,0.000000e+000,...
 1.036779e+002,1.036779e+002,8.695730e-004,0.000000e+000;...
5.500000e+000,9.028091e+001,8.922529e+001,9.838277e-001,...
 7.165684e-002,0.000000e+000,0.000000e+000,...
 8.915044e+001,8.922658e+001,9.131544e-004,0.000000e+000,...
 8.891115e+001,8.891115e+001,9.514090e-004,0.000000e+000;...
6.300000e+000,6.067623e+001,5.974633e+001,8.476965e-001,...
 8.080385e-002,0.000000e+000,0.000000e+000,...
 5.970430e+001,5.974817e+001,1.163413e-003,0.000000e+000,...
 5.956549e+001,5.956386e+001,1.202818e-003,0.000000e+000;...
7.000000e+000,4.460609e+001,4.377050e+001,7.469537e-001,...
 8.753052e-002,0.000000e+000,0.000000e+000,...
 4.374248e+001,4.377077e+001,1.401523e-003,0.000000e+000,...
 4.365161e+001,4.365014e+001,1.446874e-003,0.000000e+000;...
7.963901e+000,3.066031e+001,2.993210e+001,6.330875e-001,...
 9.642607e-002,0.000000e+000,0.000000e+000,...
 2.986402e+001,2.988011e+001,1.726706e-003,0.000000e+000,...
 2.986054e+001,2.985925e+001,1.770735e-003,0.000000e+000;...
8.000000e+000,3.020977e+001,2.948157e+001,6.291583e-001,...
 9.669062e-002,0.000000e+000,0.000000e+000,...
 2.946711e+001,2.948288e+001,1.739382e-003,0.000000e+000,...
 2.941298e+001,2.941169e+001,1.784243e-003,0.000000e+000;...
9.000000e+000,2.121206e+001,2.057187e+001,5.365881e-001,...
 1.037971e-001,0.000000e+000,0.000000e+000,...
 2.056370e+001,2.057245e+001,2.104399e-003,0.000000e+000,...
 2.052981e+001,2.052752e+001,2.141435e-003,0.000000e+000;...
1.000000e+001,1.548339e+001,1.491000e+001,4.626419e-001,...
 1.105945e-001,0.000000e+000,0.000000e+000,...
 1.490565e+001,1.491026e+001,2.477107e-003,0.000000e+000,...
 1.488363e+001,1.488157e+001,2.474459e-003,0.000000e+000;...
1.100000e+001,1.166296e+001,1.114380e+001,4.034430e-001,...
 1.155531e-001,0.000000e+000,0.000000e+000,...
 1.114201e+001,1.114404e+001,2.785207e-003,0.000000e+000,...
 1.112724e+001,1.112443e+001,2.825765e-003,0.000000e+000;...
1.172600e+001,9.657800e+000,9.170849e+000,3.680284e-001,...
 1.189531e-001,0.000000e+000,0.000000e+000,...
 9.166837e+000,9.167537e+000,3.012995e-003,0.000000e+000,...
 9.158659e+000,9.156024e+000,3.062196e-003,0.000000e+000;...
1.250000e+001,7.996302e+000,7.539474e+000,3.344475e-001,...
 1.223924e-001,0.000000e+000,0.000000e+000,...
 7.540009e+000,7.539615e+000,3.259441e-003,0.000000e+000,...
 7.531370e+000,7.528074e+000,3.310155e-003,0.000000e+000;...
1.322900e+001,6.890907e+000,6.458440e+000,3.077294e-001,...
 1.247891e-001,0.000000e+000,0.000000e+000,...
 6.340232e+000,6.339014e+000,3.494798e-003,0.000000e+000,...
 6.452213e+000,6.448710e+000,3.555058e-003,0.000000e+000;...
1.400000e+001,5.740196e+000,5.330257e+000,2.826354e-001,...
 1.273247e-001,0.000000e+000,0.000000e+000,...
 5.332109e+000,5.330200e+000,3.718202e-003,0.000000e+000,...
 5.326688e+000,5.322863e+000,3.801235e-003,0.000000e+000;...
1.496700e+001,4.735910e+000,4.349284e+000,2.565145e-001,...
 1.300961e-001,0.000000e+000,0.000000e+000,...
 4.347557e+000,4.344941e+000,3.995223e-003,0.000000e+000,...
 4.347497e+000,4.343438e+000,4.080588e-003,0.000000e+000;...
1.549100e+001,4.301349e+000,3.925986e+000,2.437239e-001,...
 1.315970e-001,0.000000e+000,0.000000e+000,...
 3.902259e+000,3.899309e+000,4.145909e-003,0.000000e+000,...
 3.925205e+000,3.920950e+000,4.256417e-003,0.000000e+000;...
1.600000e+001,3.885909e+000,3.521809e+000,2.314152e-001,...
 1.327915e-001,0.000000e+000,0.000000e+000,...
 3.524955e+000,3.521708e+000,4.292654e-003,0.000000e+000,...
 3.521884e+000,3.517508e+000,4.415036e-003,0.000000e+000;...
1.765300e+001,2.932440e+000,2.596997e+000,1.995054e-001,...
 1.358876e-001,0.000000e+000,0.000000e+000,...
 2.587725e+000,2.583649e+000,4.771608e-003,0.000000e+000,...
 2.599138e+000,2.594180e+000,4.954594e-003,0.000000e+000;...
1.800000e+001,2.760082e+000,2.429904e+000,1.936982e-001,...
 1.365372e-001,0.000000e+000,0.000000e+000,...
 2.434194e+000,2.429963e+000,4.872594e-003,0.000000e+000,...
 2.432430e+000,2.427337e+000,5.089312e-003,0.000000e+000;...
1.994700e+001,2.066722e+000,1.761795e+000,1.656966e-001,...
 1.392117e-001,0.000000e+000,0.000000e+000,...
 1.763215e+000,1.758219e+000,5.414119e-003,0.000000e+000,...
 1.765854e+000,1.760123e+000,5.750563e-003,0.000000e+000;...
2.000000e+001,2.047888e+000,1.743590e+000,1.650234e-001,...
 1.392850e-001,0.000000e+000,0.000000e+000,...
 1.748597e+000,1.743582e+000,5.428333e-003,0.000000e+000,...
 1.747683e+000,1.741916e+000,5.767250e-003,0.000000e+000;...
2.200000e+001,1.575109e+000,1.290719e+000,1.425671e-001,...
 1.418154e-001,0.000000e+000,0.000000e+000,...
 1.296445e+000,1.290759e+000,5.964408e-003,0.000000e+000,...
 1.295946e+000,1.289626e+000,6.351933e-003,0.000000e+000;...
2.500000e+001,1.124386e+000,8.623129e-001,1.167763e-001,...
 1.452861e-001,0.000000e+000,0.000000e+000,...
 8.689366e-001,8.623497e-001,6.750714e-003,0.000000e+000,...
 8.687539e-001,8.616684e-001,7.097013e-003,0.000000e+000;...
2.800000e+001,8.481680e-001,6.030951e-001,9.750265e-002,...
 1.475676e-001,0.000000e+000,0.000000e+000,...
 6.105332e-001,6.031103e-001,7.525225e-003,0.000000e+000,...
 6.106002e-001,6.026923e-001,7.903119e-003,0.000000e+000;...
2.800800e+001,8.476965e-001,6.026498e-001,9.746074e-002,...
 1.475729e-001,0.000000e+000,0.000000e+000,...
 6.099919e-001,6.025668e-001,7.527280e-003,0.000000e+000,...
 6.101316e-001,6.022260e-001,7.905641e-003,0.000000e+000;...
2.993300e+001,7.250815e-001,4.890194e-001,8.769292e-002,...
 1.483665e-001,0.000000e+000,0.000000e+000,...
 4.964710e-001,4.885664e-001,7.982035e-003,0.000000e+000,...
 4.971625e-001,4.886987e-001,8.457955e-003,0.000000e+000;...
3.197100e+001,6.230813e-001,3.953228e-001,7.854330e-002,...
 1.492100e-001,0.000000e+000,0.000000e+000,...
 4.035492e-001,3.951481e-001,8.459754e-003,0.000000e+000,...
 4.040737e-001,3.950864e-001,8.981170e-003,0.000000e+000;...
3.200000e+001,6.216406e-001,3.939869e-001,7.842541e-002,...
 1.492205e-001,0.000000e+000,0.000000e+000,...
 4.024027e-001,3.939947e-001,8.466525e-003,0.000000e+000,...
 4.027420e-001,3.937629e-001,8.988157e-003,0.000000e+000;...
3.500000e+001,5.130919e-001,2.951300e-001,6.762293e-002,...
 1.503390e-001,0.000000e+000,0.000000e+000,...
 3.042424e-001,2.951285e-001,9.153970e-003,0.000000e+000,...
 3.046344e-001,2.949831e-001,9.658084e-003,0.000000e+000;...
3.898600e+001,4.172735e-001,2.099674e-001,5.637515e-002,...
 1.509205e-001,0.000000e+000,0.000000e+000,...
 2.184321e-001,2.084436e-001,1.001386e-002,0.000000e+000,...
 2.204256e-001,2.098643e-001,1.056124e-002,0.000000e+000;...
4.000000e+001,3.968682e-001,1.918803e-001,5.391813e-002,...
 1.510698e-001,0.000000e+000,0.000000e+000,...
 2.020896e-001,1.918822e-001,1.023021e-002,0.000000e+000,...
 2.026004e-001,1.917894e-001,1.081282e-002,0.000000e+000;...
4.500000e+001,3.262225e-001,1.311936e-001,4.388313e-002,...
 1.511484e-001,0.000000e+000,0.000000e+000,...
 1.424228e-001,1.311963e-001,1.124038e-002,0.000000e+000,...
 1.429866e-001,1.311386e-001,1.184918e-002,0.000000e+000;...
4.762300e+001,3.019143e-001,1.113489e-001,3.971826e-002,...
 1.508471e-001,0.000000e+000,0.000000e+000,...
 1.210055e-001,1.092705e-001,1.174592e-002,0.000000e+000,...
 1.236086e-001,1.113037e-001,1.230550e-002,0.000000e+000;...
5.000000e+001,2.803827e-001,9.337182e-002,3.644398e-002,...
 1.505747e-001,0.000000e+000,0.000000e+000,...
 1.055633e-001,9.337344e-002,1.219870e-002,0.000000e+000,...
 1.062286e-001,9.333470e-002,1.289413e-002,0.000000e+000;...
5.346400e+001,2.584214e-001,7.624345e-002,3.234459e-002,...
 1.498334e-001,0.000000e+000,0.000000e+000,...
 8.802196e-002,7.521775e-002,1.281088e-002,0.000000e+000,...
 8.983398e-002,7.621326e-002,1.362015e-002,0.000000e+000;...
5.500000e+001,2.488789e-001,6.864451e-002,3.073103e-002,...
 1.495034e-001,0.000000e+000,0.000000e+000,...
 8.171628e-002,6.864578e-002,1.307643e-002,0.000000e+000,...
 8.252785e-002,6.861904e-002,1.390787e-002,0.000000e+000;...
6.000000e+001,2.266531e-001,5.185403e-002,2.623873e-002,...
 1.485604e-001,0.000000e+000,0.000000e+000,...
 6.575973e-002,5.183674e-002,1.392709e-002,0.000000e+000,...
 6.657398e-002,5.183832e-002,1.473515e-002,0.000000e+000;...
6.300000e+001,2.162174e-001,4.422890e-002,2.399231e-002,...
 1.479946e-001,0.000000e+000,0.000000e+000,...
 5.865311e-002,4.423088e-002,1.442557e-002,0.000000e+000,...
 5.937259e-002,4.421559e-002,1.515669e-002,0.000000e+000;...
6.925500e+001,1.996941e-001,3.276632e-002,2.015591e-002,...
 1.467739e-001,0.000000e+000,0.000000e+000,...
 4.795256e-002,3.251066e-002,1.544413e-002,0.000000e+000,...
 4.868498e-002,3.275555e-002,1.592943e-002,0.000000e+000;...
7.000000e+001,1.977871e-001,3.139898e-002,1.976064e-002,...
 1.466272e-001,0.000000e+000,0.000000e+000,...
 4.694715e-002,3.139880e-002,1.555047e-002,0.000000e+000,...
 4.746653e-002,3.139032e-002,1.607768e-002,0.000000e+000;...
7.887000e+001,1.811721e-001,2.141716e-002,1.583858e-002,...
 1.439161e-001,0.000000e+000,0.000000e+000,...
 3.808696e-002,2.130119e-002,1.678706e-002,0.000000e+000,...
 3.887559e-002,2.141213e-002,1.746346e-002,0.000000e+000;...
8.000000e+001,1.793307e-001,2.033796e-002,1.542340e-002,...
 1.435704e-001,0.000000e+000,0.000000e+000,...
 3.727785e-002,2.033814e-002,1.694092e-002,0.000000e+000,...
 3.794155e-002,2.033342e-002,1.760814e-002,0.000000e+000;...
8.945400e+001,1.677633e-001,1.417708e-002,1.251559e-002,...
 1.410715e-001,0.000000e+000,0.000000e+000,...
 3.234193e-002,1.414364e-002,1.819904e-002,0.000000e+000,...
 3.283335e-002,1.417341e-002,1.865879e-002,0.000000e+000;...
9.000000e+001,1.671661e-001,1.386642e-002,1.237309e-002,...
 1.409274e-001,0.000000e+000,0.000000e+000,...
 3.213599e-002,1.386651e-002,1.827021e-002,0.000000e+000,...
 3.257352e-002,1.386314e-002,1.871038e-002,0.000000e+000;...
1.000000e+002,1.585954e-001,9.844040e-003,1.014658e-002,...
 1.386040e-001,0.000000e+000,0.000000e+000,...
 2.939086e-002,9.843900e-003,1.954743e-002,0.000000e+000,...
 2.936457e-002,9.842019e-003,1.952214e-002,0.000000e+000;...
1.090000e+002,1.520966e-001,7.482110e-003,8.617366e-003,...
 1.359976e-001,0.000000e+000,0.000000e+000,...
 2.754828e-002,7.438051e-003,2.011055e-002,0.000000e+000,...
 2.796795e-002,7.480701e-003,2.048678e-002,0.000000e+000;...
1.100000e+002,1.513998e-001,7.220429e-003,8.468845e-003,...
 1.357095e-001,0.000000e+000,0.000000e+000,...
 2.739126e-002,7.220395e-003,2.017118e-002,0.000000e+000,...
 2.779609e-002,7.218987e-003,2.057672e-002,0.000000e+000;...
1.172600e+002,1.472402e-001,5.865404e-003,7.500708e-003,...
 1.338733e-001,0.000000e+000,0.000000e+000,...
 2.646452e-002,5.865420e-003,2.059934e-002,0.000000e+000,...
 2.705616e-002,5.864334e-003,2.119192e-002,0.000000e+000;...
1.250000e+002,1.433163e-001,4.764724e-003,6.632370e-003,...
 1.319192e-001,0.000000e+000,0.000000e+000,...
 2.578294e-002,4.764620e-003,2.101850e-002,0.000000e+000,...
 2.647168e-002,4.763913e-003,2.170710e-002,0.000000e+000;...
1.400000e+002,1.369956e-001,3.302564e-003,5.331828e-003,...
 1.283620e-001,0.000000e+000,0.000000e+000,...
 2.508506e-002,3.302424e-003,2.178275e-002,0.000000e+000,...
 2.597396e-002,3.301971e-003,2.267250e-002,0.000000e+000;...
1.496700e+002,1.335485e-001,2.668665e-003,4.688761e-003,...
 1.261905e-001,0.000000e+000,0.000000e+000,...
 2.484234e-002,2.668494e-003,2.217393e-002,0.000000e+000,...
 2.595962e-002,2.668349e-003,2.329120e-002,0.000000e+000;...
1.600000e+002,1.301380e-001,2.156594e-003,4.116156e-003,...
 1.238645e-001,0.000000e+000,0.000000e+000,...
 2.471093e-002,2.156594e-003,2.255440e-002,0.000000e+000,...
 2.593911e-002,2.156282e-003,2.378283e-002,0.000000e+000;...
1.701200e+002,1.272226e-001,1.774814e-003,3.670854e-003,...
 1.217768e-001,0.000000e+000,0.000000e+000,...
 2.468297e-002,1.773247e-003,2.290978e-002,0.000000e+000,...
 2.593674e-002,1.774600e-003,2.416178e-002,0.000000e+000;...
1.800000e+002,1.244879e-001,1.480915e-003,3.271655e-003,...
 1.197363e-001,0.000000e+000,0.000000e+000,...
 2.472271e-002,1.480920e-003,2.324183e-002,0.000000e+000,...
 2.621581e-002,1.480776e-003,2.473509e-002,0.000000e+000;...
2.000000e+002,1.195136e-001,1.058612e-003,2.661854e-003,...
 1.157941e-001,0.000000e+000,0.000000e+000,...
 2.493311e-002,1.058625e-003,2.387451e-002,0.000000e+000,...
 2.670082e-002,1.058496e-003,2.564264e-002,0.000000e+000;...
2.200000e+002,1.153278e-001,7.815562e-004,2.207411e-003,...
 1.123390e-001,0.000000e+000,0.000000e+000,...
 2.524320e-002,7.815586e-004,2.446166e-002,0.000000e+000,...
 2.702509e-002,7.814811e-004,2.624380e-002,0.000000e+000;...
2.376900e+002,1.122159e-001,6.196236e-004,1.895622e-003,...
 1.097013e-001,0.000000e+000,0.000000e+000,...
 2.547530e-002,6.135726e-004,2.486174e-002,0.000000e+000,...
 2.723995e-002,6.195488e-004,2.662036e-002,0.000000e+000;...
2.500000e+002,1.101099e-001,5.258223e-004,1.715824e-003,...
 1.078677e-001,0.000000e+000,0.000000e+000,...
 2.564556e-002,5.258257e-004,2.511975e-002,0.000000e+000,...
 2.729969e-002,5.257673e-004,2.677405e-002,0.000000e+000;...
2.800000e+002,1.055102e-001,3.718790e-004,1.371449e-003,...
 1.037657e-001,0.000000e+000,0.000000e+000,...
 2.608052e-002,3.718873e-004,2.570864e-002,0.000000e+000,...
 2.767508e-002,3.718552e-004,2.730322e-002,0.000000e+000;...
3.200000e+002,1.000120e-001,2.474356e-004,1.052640e-003,...
 9.871282e-002,0.000000e+000,0.000000e+000,...
 2.666766e-002,2.474350e-004,2.642023e-002,0.000000e+000,...
 2.824311e-002,2.474189e-004,2.799562e-002,0.000000e+000;...
3.500000e+002,9.653347e-002,1.909688e-004,8.811203e-004,...
 9.546212e-002,0.000000e+000,0.000000e+000,...
 2.703566e-002,1.909699e-004,2.684470e-002,0.000000e+000,...
 2.843666e-002,1.909578e-004,2.824570e-002,0.000000e+000;...
4.000000e+002,9.162205e-002,1.300594e-004,6.756792e-004,...
 9.081527e-002,0.000000e+000,0.000000e+000,...
 2.760321e-002,1.300599e-004,2.747315e-002,0.000000e+000,...
 2.848867e-002,1.300515e-004,2.835994e-002,0.000000e+000;...
4.500000e+002,8.735502e-002,9.322775e-005,5.344925e-004,...
 8.672636e-002,0.000000e+000,0.000000e+000,...
 2.810969e-002,9.322803e-005,2.801646e-002,0.000000e+000,...
 2.852500e-002,9.322348e-005,2.843346e-002,0.000000e+000;...
5.000000e+002,8.353066e-002,7.054358e-005,4.332782e-004,...
 8.302774e-002,0.000000e+000,0.000000e+000,...
 2.847878e-002,7.054437e-005,2.840824e-002,0.000000e+000,...
 2.857878e-002,7.054171e-005,2.850875e-002,0.000000e+000;...
5.500000e+002,8.023020e-002,5.482445e-005,3.583104e-004,...
 7.981633e-002,0.000000e+000,0.000000e+000,...
 2.831403e-002,5.482270e-005,2.825921e-002,0.000000e+000,...
 2.847486e-002,5.482071e-005,2.842056e-002,0.000000e+000;...
6.300000e+002,7.553620e-002,3.874645e-005,2.732578e-004,...
 7.522449e-002,0.000000e+000,0.000000e+000,...
 2.805695e-002,3.874630e-005,2.801821e-002,0.000000e+000,...
 2.834257e-002,3.874422e-005,2.830334e-002,0.000000e+000;...
7.000000e+002,7.204451e-002,3.004212e-005,2.214405e-004,...
 7.179304e-002,0.000000e+000,0.000000e+000,...
 2.781608e-002,3.004260e-005,2.778604e-002,0.000000e+000,...
 2.810358e-002,3.004119e-005,2.807268e-002,0.000000e+000;...
8.000000e+002,6.773557e-002,2.220298e-005,1.696100e-004,...
 6.754435e-002,0.000000e+000,0.000000e+000,...
 2.746705e-002,2.220288e-005,2.744484e-002,0.000000e+000,...
 2.770597e-002,2.220263e-005,2.768409e-002,0.000000e+000;...
9.000000e+002,6.403695e-002,1.720015e-005,1.340514e-004,...
 6.388502e-002,0.000000e+000,0.000000e+000,...
 2.711179e-002,1.720003e-005,2.709459e-002,0.000000e+000,...
 2.728001e-002,1.719991e-005,2.726284e-002,0.000000e+000;...
1.022000e+003,6.024927e-002,1.310627e-005,1.039831e-004,...
 6.013139e-002,0.000000e+000,0.000000e+000,...
 2.666935e-002,1.287183e-005,2.665648e-002,0.000000e+000,...
 2.666769e-002,1.310611e-005,2.665459e-002,0.000000e+000;...
1.100000e+003,5.797299e-002,1.131589e-005,8.977012e-005,...
 5.787084e-002,1.513527e-006,0.000000e+000,...
 2.617778e-002,1.092788e-005,2.616674e-002,1.073268e-007,...
 2.636176e-002,1.131636e-005,2.635053e-002,1.073214e-007;...
1.250000e+003,5.424818e-002,8.816442e-006,6.952987e-005,...
 5.414340e-002,2.585105e-005,0.000000e+000,...
 2.535035e-002,8.730525e-006,2.533690e-002,4.715307e-006,...
 2.569310e-002,8.816478e-006,2.567909e-002,4.715222e-006;...
1.400000e+003,5.118608e-002,7.174589e-006,5.543477e-005,...
 5.103939e-002,8.496087e-005,0.000000e+000,...
 2.465323e-002,7.147940e-006,2.462314e-002,2.293947e-005,...
 2.499706e-002,7.174489e-006,2.496690e-002,2.293953e-005;...
1.600000e+003,4.786727e-002,5.697761e-006,4.244769e-005,...
 4.760795e-002,2.103210e-004,0.000000e+000,...
 2.388967e-002,5.697746e-006,2.380799e-002,7.597867e-005,...
 2.410916e-002,5.697670e-006,2.402742e-002,7.597837e-005;...
1.800000e+003,4.510378e-002,4.704215e-006,3.354167e-005,...
 4.469253e-002,3.740531e-004,0.000000e+000,...
 2.323458e-002,4.704193e-006,2.306820e-002,1.616761e-004,...
 2.332819e-002,4.704200e-006,2.316169e-002,1.616718e-004;...
2.044000e+003,4.224862e-002,3.832210e-006,2.601319e-005,...
 4.161210e-002,6.079673e-004,0.000000e+000,...
 2.249757e-002,3.832210e-006,2.218975e-002,3.039847e-004,...
 2.251044e-002,3.832170e-006,2.220258e-002,3.039819e-004;...
2.200000e+003,4.062195e-002,3.445584e-006,2.245524e-005,...
 3.983089e-002,7.654467e-004,2.152534e-007,...
 2.195946e-002,3.445568e-006,2.154609e-002,4.099268e-004,...
 2.205411e-002,3.445464e-006,2.164076e-002,4.098586e-004;...
2.500000e+003,3.802349e-002,2.864073e-006,1.739006e-005,...
 3.691810e-002,1.081820e-003,2.175140e-006,...
 2.111484e-002,2.864060e-006,2.047146e-002,6.405170e-004,...
 2.127044e-002,2.864016e-006,2.062657e-002,6.395468e-004;...
2.800000e+003,3.593319e-002,2.431162e-006,1.386380e-005,...
 3.451347e-002,1.397696e-003,7.038118e-006,...
 2.045812e-002,2.431150e-006,1.956368e-002,8.920087e-004,...
 2.059548e-002,2.431146e-006,1.970097e-002,8.875239e-004;...
3.200000e+003,3.362549e-002,2.020410e-006,1.061467e-005,...
 3.178928e-002,1.806587e-003,1.716217e-005,...
 1.973737e-002,2.020397e-006,1.849404e-002,1.241310e-003,...
 1.984681e-002,2.020404e-006,1.860357e-002,1.229596e-003;...
3.500000e+003,3.214814e-002,1.794721e-006,8.873283e-006,...
 2.999497e-002,2.114238e-003,2.717124e-005,...
 1.927406e-002,1.794717e-006,1.775611e-002,1.516153e-003,...
 1.938708e-002,1.794704e-006,1.786906e-002,1.496866e-003;...
4.000000e+003,3.016523e-002,1.504333e-006,6.793726e-006,...
 2.750652e-002,2.604227e-003,4.746388e-005,...
 1.868643e-002,1.504333e-006,1.671074e-002,1.974186e-003,...
 1.874845e-002,1.504300e-006,1.677266e-002,1.938826e-003;...
4.500000e+003,2.860930e-002,1.298210e-006,5.367976e-006,...
 2.548302e-002,3.049790e-003,7.005113e-005,...
 1.815985e-002,1.298208e-006,1.574727e-002,2.411289e-003,...
 1.822886e-002,1.298203e-006,1.581645e-002,2.357020e-003;...
5.000000e+003,2.739127e-002,1.137876e-006,4.347974e-006,...
 2.379952e-002,3.491686e-003,9.458724e-005,...
 1.777728e-002,1.137876e-006,1.493269e-002,2.843454e-003,...
 1.783357e-002,1.137858e-006,1.497940e-002,2.777961e-003;...
5.500000e+003,2.638279e-002,1.014239e-006,3.593320e-006,...
 2.237272e-002,3.886171e-003,1.197494e-004,...
 1.749448e-002,1.014236e-006,1.423213e-002,3.261333e-003,...
 1.750323e-002,1.014231e-006,1.424080e-002,3.163936e-003;...
6.300000e+003,2.499424e-002,8.622081e-007,2.738865e-006,...
 2.033324e-002,4.497543e-003,1.599680e-004,...
 1.706957e-002,8.622095e-007,1.316974e-002,3.898969e-003,...
 1.711376e-002,8.621940e-007,1.321138e-002,3.767839e-003;...
7.000000e+003,2.406932e-002,7.617272e-007,2.218439e-006,...
 1.887789e-002,4.992613e-003,1.958540e-004,...
 1.678713e-002,7.617272e-007,1.237143e-002,4.414937e-003,...
 1.686921e-002,7.617331e-007,1.243799e-002,4.263646e-003;...
8.000000e+003,2.306111e-002,6.530212e-007,1.698484e-006,...
 1.718208e-002,5.631752e-003,2.449943e-004,...
 1.653855e-002,6.530212e-007,1.142882e-002,5.109068e-003,...
 1.662333e-002,6.530123e-007,1.149730e-002,4.912204e-003;...
9.000000e+003,2.231483e-002,5.712953e-007,1.342033e-006,...
 1.581291e-002,6.208024e-003,2.920653e-004,...
 1.641972e-002,5.712953e-007,1.065718e-002,5.761970e-003,...
 1.646985e-002,5.713011e-007,1.070752e-002,5.503032e-003;...
1.000000e+004,2.175402e-002,5.073815e-007,1.087033e-006,...
 1.468106e-002,6.734527e-003,3.368573e-004,...
 1.636038e-002,5.073842e-007,1.001118e-002,6.348691e-003,...
 1.638414e-002,5.073841e-007,1.003501e-002,6.046241e-003;...
1.250000e+004,2.071332e-002,3.966587e-007,6.957178e-007,...
 1.242024e-002,7.853020e-003,4.388575e-004,...
 1.627652e-002,3.966442e-007,8.673289e-003,7.602833e-003,...
 1.631061e-002,3.966468e-007,8.696189e-003,7.210875e-003;...
1.600000e+004,2.000005e-002,3.035907e-007,4.246341e-007,...
 1.032235e-002,9.115580e-003,5.613416e-004,...
 1.638420e-002,3.035907e-007,7.359106e-003,9.024793e-003,...
 1.643666e-002,3.035917e-007,7.377703e-003,8.533084e-003;...
2.000000e+004,1.963726e-002,2.392080e-007,2.717648e-007,...
 8.690448e-003,1.026812e-002,6.781677e-004,...
 1.666590e-002,2.392054e-007,6.316589e-003,1.034907e-002,...
 1.671473e-002,2.392070e-007,6.327497e-003,9.743563e-003;...
2.500000e+004,1.949922e-002,1.890985e-007,1.739268e-007,...
 7.284606e-003,1.141517e-002,7.991849e-004,...
 1.706687e-002,1.890974e-007,5.368946e-003,1.169773e-002,...
 1.711349e-002,1.890958e-007,5.398558e-003,1.094830e-002;...
3.200000e+004,1.958514e-002,1.461976e-007,1.061572e-007,...
 5.992969e-003,1.265756e-002,9.344255e-004,...
 1.758257e-002,1.461983e-007,4.485315e-003,1.309711e-002,...
 1.766735e-002,1.461959e-007,4.509526e-003,1.225315e-002;...
4.000000e+004,1.987406e-002,1.160403e-007,6.793988e-008,...
 5.023523e-003,1.378862e-002,1.061651e-003,...
 1.824259e-002,1.160403e-007,3.812412e-003,1.443006e-002,...
 1.829171e-002,1.160402e-007,3.820803e-003,1.343615e-002;...
5.000000e+004,2.024811e-002,9.228215e-008,4.348236e-008,...
 4.185570e-003,1.487568e-002,1.186597e-003,...
 1.887077e-002,9.228215e-008,3.220906e-003,1.564977e-002,...
 1.896025e-002,9.228219e-008,3.226158e-003,1.457157e-002;...
6.300000e+004,2.072039e-002,7.288273e-008,2.738865e-008,...
 3.457895e-003,1.594991e-002,1.312591e-003,...
 1.887077e-002,9.228215e-008,3.220906e-003,1.564977e-002,...
 1.968025e-002,7.288182e-008,2.698249e-003,1.569107e-002;...
8.000000e+004,2.131317e-002,5.715573e-008,1.698510e-008,...
 2.838665e-003,1.703146e-002,1.443038e-003,...
 1.887077e-002,9.228215e-008,3.220906e-003,1.564977e-002,...
 2.047503e-002,5.715499e-008,2.237127e-003,1.681385e-002;...
1.000000e+005,2.188420e-002,4.557790e-008,1.087059e-008,...
 2.361092e-003,1.796398e-002,1.559078e-003,...
 1.887077e-002,9.228215e-008,3.220906e-003,1.564977e-002,...
 2.119773e-002,4.557672e-008,1.874356e-003,1.778064e-002;...
1.250000e+005,2.239970e-002,3.637588e-008,6.957178e-009,...
 1.956130e-003,1.877914e-002,1.664432e-003,...
 1.887077e-002,9.228215e-008,3.220906e-003,1.564977e-002,...
 2.184305e-002,3.637405e-008,1.566303e-003,1.862575e-002;...
 ];
zr = interp1q(za(:,1),za(:,flag),e);