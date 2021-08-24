 function zr =z2(flag,e)

za = [8.000000e-001,1.247239e+002,1.243207e+002,3.959837e-001,...
 6.646214e-003,0.000000e+000,0.000000e+000,...
 6.038839e+001,6.067656e+001,2.763157e-005,0.000000e+000,...
 1.243347e+002,1.243347e+002,1.533263e-005,0.000000e+000;...
1.000000e+000,6.107193e+001,6.067628e+001,3.851221e-001,...
 1.019430e-002,0.000000e+000,0.000000e+000,...
 6.038839e+001,6.067656e+001,2.763157e-005,0.000000e+000,...
 6.068347e+001,6.068347e+001,2.760896e-005,0.000000e+000;...
1.100000e+000,4.503371e+001,4.464106e+001,3.797815e-001,...
 1.216113e-002,0.000000e+000,0.000000e+000,...
 4.444867e+001,4.464139e+001,3.580469e-005,0.000000e+000,...
 4.464528e+001,4.464528e+001,3.688057e-005,0.000000e+000;...
1.250000e+000,2.996430e+001,2.957768e+001,3.717030e-001,...
 1.540789e-002,0.000000e+000,0.000000e+000,...
 2.946598e+001,2.957832e+001,5.068450e-005,0.000000e+000,...
 2.958028e+001,2.958028e+001,5.272381e-005,0.000000e+000;...
1.395600e+000,2.115012e+001,2.076801e+001,3.636846e-001,...
 1.879727e-002,0.000000e+000,0.000000e+000,...
 2.067358e+001,2.074411e+001,6.838608e-005,0.000000e+000,...
 2.076996e+001,2.076996e+001,7.179828e-005,0.000000e+000;...
1.400000e+000,2.091694e+001,2.053483e+001,3.634289e-001,...
 1.889656e-002,0.000000e+000,0.000000e+000,...
 2.046532e+001,2.053492e+001,6.897384e-005,0.000000e+000,...
 2.053662e+001,2.053662e+001,7.245298e-005,0.000000e+000;...
1.560300e+000,1.496545e+001,1.458860e+001,3.540114e-001,...
 2.284857e-002,0.000000e+000,0.000000e+000,...
 1.444026e+001,1.448426e+001,9.201690e-005,0.000000e+000,...
 1.458995e+001,1.458995e+001,9.859844e-005,0.000000e+000;...
1.600000e+000,1.373396e+001,1.335862e+001,3.515894e-001,...
 2.382642e-002,0.000000e+000,0.000000e+000,...
 1.331903e+001,1.335859e+001,9.824953e-005,0.000000e+000,...
 1.335994e+001,1.335994e+001,1.052976e-004,0.000000e+000;...
1.800000e+000,9.510860e+000,9.142136e+000,3.394791e-001,...
 2.923016e-002,0.000000e+000,0.000000e+000,...
 9.118213e+000,9.142203e+000,1.335852e-004,0.000000e+000,...
 9.143168e+000,9.142857e+000,1.424837e-004,0.000000e+000;...
2.000000e+000,6.825838e+000,6.464184e+000,3.267821e-001,...
 3.488815e-002,0.000000e+000,0.000000e+000,...
 6.448971e+000,6.464147e+000,1.758384e-004,0.000000e+000,...
 6.464985e+000,6.464706e+000,1.864061e-004,0.000000e+000;...
2.200000e+000,5.064205e+000,4.709621e+000,3.138895e-001,...
 4.063489e-002,0.000000e+000,0.000000e+000,...
 4.699661e+000,4.709607e+000,2.222615e-004,0.000000e+000,...
 4.710211e+000,4.709957e+000,2.379399e-004,0.000000e+000;...
2.432100e+000,3.746215e+000,3.399755e+000,2.989811e-001,...
 4.747833e-002,0.000000e+000,0.000000e+000,...
 3.368596e+000,3.374903e+000,2.836782e-004,0.000000e+000,...
 3.400365e+000,3.400135e+000,3.042408e-004,0.000000e+000;...
2.500000e+000,3.423675e+000,3.079773e+000,2.944679e-001,...
 4.939191e-002,0.000000e+000,0.000000e+000,...
 3.074299e+000,3.079847e+000,3.033309e-004,0.000000e+000,...
 3.080336e+000,3.080112e+000,3.253333e-004,0.000000e+000;...
2.800000e+000,2.447030e+000,2.113508e+000,2.753623e-001,...
 5.817148e-002,0.000000e+000,0.000000e+000,...
 2.110312e+000,2.113503e+000,3.944025e-004,0.000000e+000,...
 2.114046e+000,2.113646e+000,4.229492e-004,0.000000e+000;...
3.132800e+000,1.786154e+000,1.463825e+000,2.548425e-001,...
 6.745203e-002,0.000000e+000,0.000000e+000,...
 1.452152e+000,1.453849e+000,5.073032e-004,0.000000e+000,...
 1.464508e+000,1.463954e+000,5.448987e-004,0.000000e+000;...
3.200000e+000,1.674228e+000,1.354201e+000,2.506904e-001,...
 6.931596e-002,0.000000e+000,0.000000e+000,...
 1.352727e+000,1.354205e+000,5.320201e-004,0.000000e+000,...
 1.354902e+000,1.354324e+000,5.700280e-004,0.000000e+000;...
3.500000e+000,1.313808e+000,1.003439e+000,2.332245e-001,...
 7.714777e-002,0.000000e+000,0.000000e+000,...
 1.002717e+000,1.003435e+000,6.433584e-004,0.000000e+000,...
 1.004226e+000,1.003537e+000,6.897479e-004,0.000000e+000;...
3.982100e+000,9.495365e-001,6.530377e-001,2.072137e-001,...
 8.929116e-002,0.000000e+000,0.000000e+000,...
 6.516891e-001,6.516303e-001,8.359866e-004,0.000000e+000,...
 6.539910e-001,6.531047e-001,8.902302e-004,0.000000e+000;...
4.000000e+000,9.379377e-001,6.419203e-001,2.062810e-001,...
 8.974247e-002,0.000000e+000,0.000000e+000,...
 6.420074e-001,6.419260e-001,8.436315e-004,0.000000e+000,...
 6.428711e-001,6.419747e-001,8.977310e-004,0.000000e+000;...
4.500000e+000,7.161315e-001,4.328712e-001,1.823914e-001,...
 1.008659e-001,0.000000e+000,0.000000e+000,...
 4.334644e-001,4.328738e-001,1.047381e-003,0.000000e+000,...
 4.340243e-001,4.329163e-001,1.115792e-003,0.000000e+000;...
5.000000e+000,5.758778e-001,3.042916e-001,1.614654e-001,...
 1.101163e-001,0.000000e+000,0.000000e+000,...
 3.052623e-001,3.042887e-001,1.262670e-003,0.000000e+000,...
 3.056583e-001,3.043249e-001,1.341513e-003,0.000000e+000;...
5.500000e+000,4.837645e-001,2.212195e-001,1.434580e-001,...
 1.190915e-001,0.000000e+000,0.000000e+000,...
 2.225028e-001,2.212138e-001,1.479997e-003,0.000000e+000,...
 2.228062e-001,2.212376e-001,1.562109e-003,0.000000e+000;...
6.300000e+000,3.895751e-001,1.400701e-001,1.195293e-001,...
 1.299697e-001,0.000000e+000,0.000000e+000,...
 1.417994e-001,1.400708e-001,1.834208e-003,0.000000e+000,...
 1.420035e-001,1.400827e-001,1.918456e-003,0.000000e+000;...
7.000000e+000,3.389676e-001,9.789472e-002,1.028622e-001,...
 1.382092e-001,0.000000e+000,0.000000e+000,...
 9.997550e-002,9.789544e-002,2.146475e-003,0.000000e+000,...
 1.001200e-001,9.790315e-002,2.219608e-003,0.000000e+000;...
8.000000e+000,2.933848e-001,6.217014e-002,8.418076e-002,...
 1.470309e-001,0.000000e+000,0.000000e+000,...
 6.470358e-002,6.216951e-002,2.570971e-003,0.000000e+000,...
 6.481232e-002,6.217577e-002,2.636695e-003,0.000000e+000;...
9.000000e+000,2.656741e-001,4.165336e-002,6.999894e-002,...
 1.540187e-001,0.000000e+000,0.000000e+000,...
 4.461901e-002,4.165317e-002,2.987825e-003,0.000000e+000,...
 4.469156e-002,4.165702e-002,3.034111e-003,0.000000e+000;...
1.000000e+001,2.476365e-001,2.911132e-002,5.902598e-002,...
 1.594947e-001,0.000000e+000,0.000000e+000,...
 3.250858e-002,2.911139e-002,3.411016e-003,0.000000e+000,...
 3.251988e-002,2.911372e-002,3.405658e-003,0.000000e+000;...
1.088700e+001,2.356616e-001,2.196550e-002,5.129044e-002,...
 1.623981e-001,0.000000e+000,0.000000e+000,...
 2.551744e-002,2.180555e-002,3.721403e-003,0.000000e+000,...
 2.573470e-002,2.196745e-002,3.767092e-003,0.000000e+000;...
1.100000e+001,2.342325e-001,2.105384e-002,5.040586e-002,...
 1.627742e-001,0.000000e+000,0.000000e+000,...
 2.480515e-002,2.105325e-002,3.760990e-003,0.000000e+000,...
 2.486682e-002,2.105577e-002,3.810899e-003,0.000000e+000;...
1.232600e+001,2.226938e-001,1.437393e-002,4.157062e-002,...
 1.667458e-001,0.000000e+000,0.000000e+000,...
 1.851418e-002,1.429711e-002,4.222586e-003,0.000000e+000,...
 1.864838e-002,1.437512e-002,4.273356e-003,0.000000e+000;...
1.250000e+001,2.214903e-001,1.363167e-002,4.058073e-002,...
 1.672723e-001,0.000000e+000,0.000000e+000,...
 1.790855e-002,1.363165e-002,4.282081e-003,0.000000e+000,...
 1.796213e-002,1.363272e-002,4.329411e-003,0.000000e+000;...
1.400000e+001,2.129605e-001,9.272566e-003,3.333863e-002,...
 1.703563e-001,0.000000e+000,0.000000e+000,...
 1.405632e-002,9.272494e-003,4.786976e-003,0.000000e+000,...
 1.412885e-002,9.273308e-003,4.855142e-003,0.000000e+000;...
1.535000e+001,2.069429e-001,6.825236e-003,2.834258e-002,...
 1.717705e-001,0.000000e+000,0.000000e+000,...
 1.197781e-002,6.777971e-003,5.201933e-003,0.000000e+000,...
 1.217128e-002,6.825974e-003,5.345304e-003,0.000000e+000;...
1.600000e+001,2.046563e-001,5.882740e-003,2.631768e-002,...
 1.724625e-001,0.000000e+000,0.000000e+000,...
 1.128142e-002,5.882696e-003,5.400467e-003,0.000000e+000,...
 1.144013e-002,5.883403e-003,5.556723e-003,0.000000e+000;...
1.800000e+001,1.995414e-001,3.934112e-003,2.127950e-002,...
 1.743279e-001,0.000000e+000,0.000000e+000,...
 9.939720e-003,3.934167e-003,6.006591e-003,0.000000e+000,...
 1.005571e-002,3.934329e-003,6.121071e-003,0.000000e+000;...
1.937400e+001,1.967432e-001,3.075260e-003,1.860471e-002,...
 1.750651e-001,0.000000e+000,0.000000e+000,...
 9.472347e-003,3.060067e-003,6.413030e-003,0.000000e+000,...
 9.547868e-003,3.075536e-003,6.472332e-003,0.000000e+000;...
2.000000e+001,1.956901e-001,2.745048e-003,1.754562e-002,...
 1.753960e-001,0.000000e+000,0.000000e+000,...
 9.326828e-003,2.745092e-003,6.582388e-003,0.000000e+000,...
 9.451821e-003,2.745294e-003,6.706442e-003,0.000000e+000;...
2.191900e+001,1.923504e-001,2.013316e-003,1.480614e-002,...
 1.755314e-001,0.000000e+000,0.000000e+000,...
 9.102752e-003,2.007438e-003,7.095750e-003,0.000000e+000,...
 9.326162e-003,2.013499e-003,7.312638e-003,0.000000e+000;...
2.200000e+001,1.922150e-001,1.982326e-003,1.470369e-002,...
 1.755314e-001,0.000000e+000,0.000000e+000,...
 9.099094e-003,1.982304e-003,7.117218e-003,0.000000e+000,...
 9.318563e-003,1.982506e-003,7.335880e-003,0.000000e+000;...
2.500000e+001,1.885744e-001,1.280967e-003,1.156660e-002,...
 1.757270e-001,0.000000e+000,0.000000e+000,...
 9.183476e-003,1.280966e-003,7.902754e-003,0.000000e+000,...
 9.375013e-003,1.281076e-003,8.094117e-003,0.000000e+000;...
2.800000e+001,1.851294e-001,8.698042e-004,9.327476e-003,...
 1.749297e-001,0.000000e+000,0.000000e+000,...
 9.494806e-003,8.698048e-004,8.625149e-003,0.000000e+000,...
 9.919567e-003,8.698879e-004,9.049619e-003,0.000000e+000;...
3.000000e+001,1.830533e-001,6.871872e-004,8.174366e-003,...
 1.741925e-001,0.000000e+000,0.000000e+000,...
 9.768979e-003,6.871871e-004,9.081900e-003,0.000000e+000,...
 1.036041e-002,6.872455e-004,9.673202e-003,0.000000e+000;...
3.200000e+001,1.812330e-001,5.509803e-004,7.220588e-003,...
 1.734554e-001,0.000000e+000,0.000000e+000,...
 1.008162e-002,5.509829e-004,9.530717e-003,0.000000e+000,...
 1.076033e-002,5.510329e-004,1.020938e-002,0.000000e+000;...
3.500000e+001,1.789464e-001,4.054463e-004,6.072292e-003,...
 1.724625e-001,0.000000e+000,0.000000e+000,...
 1.056371e-002,4.054421e-004,1.015832e-002,0.000000e+000,...
 1.129380e-002,4.054902e-004,1.088835e-002,0.000000e+000;...
4.000000e+001,1.759526e-001,2.567079e-004,4.684198e-003,...
 1.710183e-001,0.000000e+000,0.000000e+000,...
 1.142767e-002,2.567047e-004,1.117100e-002,0.000000e+000,...
 1.202857e-002,2.567367e-004,1.177185e-002,0.000000e+000;...
4.500000e+001,1.728235e-001,1.715298e-004,3.720490e-003,...
 1.689272e-001,0.000000e+000,0.000000e+000,...
 1.231924e-002,1.715332e-004,1.214772e-002,0.000000e+000,...
 1.306567e-002,1.715406e-004,1.289387e-002,0.000000e+000;...
5.000000e+001,1.697095e-001,1.196000e-004,3.025164e-003,...
 1.665653e-001,0.000000e+000,0.000000e+000,...
 1.321317e-002,1.195995e-004,1.309358e-002,0.000000e+000,...
 1.413557e-002,1.196078e-004,1.401568e-002,0.000000e+000;...
5.500000e+001,1.670467e-001,8.630796e-005,2.507205e-003,...
 1.644592e-001,0.000000e+000,0.000000e+000,...
 1.409880e-002,8.630784e-005,1.401250e-002,0.000000e+000,...
 1.497734e-002,8.631626e-005,1.489076e-002,0.000000e+000;...
6.300000e+001,1.634813e-001,5.429319e-005,1.917186e-003,...
 1.615106e-001,0.000000e+000,0.000000e+000,...
 1.536790e-002,5.429389e-005,1.531361e-002,0.000000e+000,...
 1.599040e-002,5.429816e-005,1.593615e-002,0.000000e+000;...
7.000000e+001,1.600814e-001,3.796311e-005,1.555983e-003,...
 1.584868e-001,0.000000e+000,0.000000e+000,...
 1.642427e-002,3.796339e-005,1.638631e-002,0.000000e+000,...
 1.720048e-002,3.796639e-005,1.716206e-002,0.000000e+000;...
8.000000e+001,1.556134e-001,2.412278e-005,1.193758e-003,...
 1.543948e-001,0.000000e+000,0.000000e+000,...
 1.786586e-002,2.412305e-005,1.784174e-002,0.000000e+000,...
 1.868347e-002,2.412535e-005,1.865966e-002,0.000000e+000;...
9.000000e+001,1.518374e-001,1.617061e-005,9.445420e-004,...
 1.508746e-001,0.000000e+000,0.000000e+000,...
 1.919933e-002,1.617057e-005,1.918316e-002,0.000000e+000,...
 1.972362e-002,1.617180e-005,1.970744e-002,0.000000e+000;...
1.000000e+002,1.485744e-001,1.130679e-005,7.658363e-004,...
 1.477966e-001,0.000000e+000,0.000000e+000,...
 2.047966e-002,1.130678e-005,2.046835e-002,0.000000e+000,...
 2.047283e-002,1.130756e-005,2.046162e-002,0.000000e+000;...
1.100000e+002,1.449985e-001,8.180384e-006,6.333904e-004,...
 1.443576e-001,0.000000e+000,0.000000e+000,...
 2.106838e-002,8.180403e-006,2.106020e-002,0.000000e+000,...
 2.157321e-002,8.181309e-006,2.156506e-002,0.000000e+000;...
1.250000e+002,1.403665e-001,5.308366e-006,4.908952e-004,...
 1.398700e-001,0.000000e+000,0.000000e+000,...
 2.188626e-002,5.308341e-006,2.188095e-002,0.000000e+000,...
 2.273703e-002,5.308683e-006,2.273165e-002,0.000000e+000;...
1.400000e+002,1.361587e-001,3.645722e-006,3.915608e-004,...
 1.357630e-001,0.000000e+000,0.000000e+000,...
 2.263894e-002,3.645692e-006,2.263529e-002,0.000000e+000,...
 2.372949e-002,3.646058e-006,2.372589e-002,0.000000e+000;...
1.600000e+002,1.310107e-001,2.341572e-006,2.999439e-004,...
 1.307083e-001,0.000000e+000,0.000000e+000,...
 2.355990e-002,2.341593e-006,2.355756e-002,0.000000e+000,...
 2.488095e-002,2.341772e-006,2.487850e-002,0.000000e+000;...
1.800000e+002,1.263817e-001,1.584567e-006,2.370757e-004,...
 1.261425e-001,0.000000e+000,0.000000e+000,...
 2.425071e-002,1.584597e-006,2.424912e-002,0.000000e+000,...
 2.587084e-002,1.584718e-006,2.586928e-002,0.000000e+000;...
2.000000e+002,1.220566e-001,1.117411e-006,1.920796e-004,...
 1.218641e-001,0.000000e+000,0.000000e+000,...
 2.487649e-002,1.117411e-006,2.487537e-002,0.000000e+000,...
 2.682269e-002,1.117507e-006,2.682185e-002,0.000000e+000;...
2.200000e+002,1.182776e-001,8.255151e-007,1.587726e-004,...
 1.181181e-001,0.000000e+000,0.000000e+000,...
 2.545643e-002,8.255215e-007,2.545561e-002,0.000000e+000,...
 2.744843e-002,8.255920e-007,2.744843e-002,0.000000e+000;...
2.500000e+002,1.133989e-001,5.500175e-007,1.229788e-004,...
 1.132755e-001,0.000000e+000,0.000000e+000,...
 2.616202e-002,5.500193e-007,2.616147e-002,0.000000e+000,...
 2.799327e-002,5.500728e-007,2.799327e-002,0.000000e+000;...
2.800000e+002,1.089730e-001,3.837380e-007,9.805118e-005,...
 1.088752e-001,0.000000e+000,0.000000e+000,...
 2.680400e-002,3.837393e-007,2.680361e-002,0.000000e+000,...
 2.854341e-002,3.837735e-007,2.854341e-002,0.000000e+000;...
3.200000e+002,1.035858e-001,2.540903e-007,7.508075e-005,...
 1.035106e-001,0.000000e+000,0.000000e+000,...
 2.752474e-002,2.540871e-007,2.752449e-002,0.000000e+000,...
 2.927346e-002,2.541141e-007,2.927346e-002,0.000000e+000;...
3.500000e+002,1.001227e-001,1.943212e-007,6.276587e-005,...
 1.000595e-001,0.000000e+000,0.000000e+000,...
 2.797848e-002,1.943217e-007,2.797829e-002,0.000000e+000,...
 2.953501e-002,1.943337e-007,2.953501e-002,0.000000e+000;...
4.000000e+002,9.517780e-002,1.303112e-007,4.805902e-005,...
 9.512967e-002,0.000000e+000,0.000000e+000,...
 2.866855e-002,1.303112e-007,2.866841e-002,0.000000e+000,...
 2.964986e-002,1.303235e-007,2.964986e-002,0.000000e+000;...
4.500000e+002,9.084217e-002,9.368095e-008,3.797514e-005,...
 9.080457e-002,0.000000e+000,0.000000e+000,...
 2.922976e-002,9.368075e-008,2.922967e-002,0.000000e+000,...
 2.972175e-002,9.368938e-008,2.972175e-002,0.000000e+000;...
5.000000e+002,8.693830e-002,6.973267e-008,3.076012e-005,...
 8.690821e-002,0.000000e+000,0.000000e+000,...
 2.968216e-002,6.973266e-008,2.968209e-002,0.000000e+000,...
 2.980056e-002,6.973893e-008,2.980056e-002,0.000000e+000;...
5.500000e+002,8.355194e-002,5.450832e-008,2.542257e-005,...
 8.352636e-002,0.000000e+000,0.000000e+000,...
 2.950192e-002,5.450822e-008,2.950187e-002,0.000000e+000,...
 2.970511e-002,5.451286e-008,2.970511e-002,0.000000e+000;...
6.300000e+002,7.871985e-002,3.837381e-008,1.937646e-005,...
 7.870030e-002,0.000000e+000,0.000000e+000,...
 2.923976e-002,3.837435e-008,2.923973e-002,0.000000e+000,...
 2.958250e-002,3.837713e-008,2.958250e-002,0.000000e+000;...
7.000000e+002,7.511234e-002,2.980785e-008,1.569523e-005,...
 7.509730e-002,0.000000e+000,0.000000e+000,...
 2.899920e-002,2.980796e-008,2.899917e-002,0.000000e+000,...
 2.934134e-002,2.981032e-008,2.934134e-002,0.000000e+000;...
8.000000e+002,7.065486e-002,2.179400e-008,1.201716e-005,...
 7.064282e-002,0.000000e+000,0.000000e+000,...
 2.865313e-002,2.179400e-008,2.865311e-002,0.000000e+000,...
 2.893417e-002,2.179622e-008,2.893417e-002,0.000000e+000;...
9.000000e+002,6.681417e-002,1.697847e-008,9.495214e-006,...
 6.680514e-002,0.000000e+000,0.000000e+000,...
 2.830672e-002,1.697906e-008,2.830671e-002,0.000000e+000,...
 2.849424e-002,1.697977e-008,2.849424e-002,0.000000e+000;...
1.022000e+003,6.288171e-002,1.299381e-008,7.363654e-006,...
 6.287418e-002,0.000000e+000,0.000000e+000,...
 2.785368e-002,1.247735e-008,2.785367e-002,0.000000e+000,...
 2.785936e-002,1.299479e-008,2.785936e-002,0.000000e+000;...
1.100000e+003,6.051381e-002,1.120013e-008,6.356470e-006,...
 6.050779e-002,2.754225e-007,0.000000e+000,...
 2.734203e-002,1.029349e-008,2.734200e-002,1.953105e-008,...
 2.754061e-002,1.120092e-008,2.754061e-002,1.953196e-008;...
1.250000e+003,5.661445e-002,8.702856e-009,4.922492e-006,...
 5.660542e-002,4.704206e-006,0.000000e+000,...
 2.647573e-002,8.517816e-009,2.647486e-002,8.580608e-007,...
 2.684011e-002,8.703640e-009,2.683922e-002,8.581288e-007;...
1.400000e+003,5.337551e-002,7.068795e-009,3.924183e-006,...
 5.335595e-002,1.563957e-005,0.000000e+000,...
 2.573336e-002,7.011505e-009,2.572913e-002,4.222624e-006,...
 2.609844e-002,7.069628e-009,2.609404e-002,4.222889e-006;...
1.600000e+003,4.981012e-002,5.614508e-009,3.004403e-006,...
 4.976800e-002,3.919670e-005,0.000000e+000,...
 2.489158e-002,5.614565e-009,2.487742e-002,1.415980e-005,...
 2.512710e-002,5.615196e-009,2.511274e-002,1.416106e-005;...
1.800000e+003,4.678782e-002,4.646437e-009,2.373917e-006,...
 4.671561e-002,7.016442e-005,0.000000e+000,...
 2.413513e-002,4.646370e-009,2.410480e-002,3.032687e-005,...
 2.423716e-002,4.646747e-009,2.420697e-002,3.032929e-005;...
2.044000e+003,4.361207e-002,3.834673e-009,1.840914e-006,...
 4.349623e-002,1.140924e-004,0.000000e+000,...
 2.324465e-002,3.834672e-009,2.318760e-002,5.704641e-005,...
 2.326273e-002,3.834959e-009,2.320572e-002,5.705021e-005;...
2.200000e+003,4.177973e-002,3.460533e-009,1.589080e-006,...
 4.163380e-002,1.437739e-004,6.485847e-007,...
 2.259206e-002,3.460533e-009,2.251507e-002,7.699392e-005,...
 2.269595e-002,3.460911e-009,2.261879e-002,7.699261e-005;...
2.500000e+003,3.879202e-002,2.895035e-009,1.230646e-006,...
 3.858592e-002,2.028510e-004,2.271619e-006,...
 2.151345e-002,2.895015e-009,2.139217e-002,1.212725e-004,...
 2.167888e-002,2.895238e-009,2.155765e-002,1.199372e-004;...
2.800000e+003,3.634138e-002,2.471401e-009,9.810533e-007,...
 3.607059e-002,2.627706e-004,7.350115e-006,...
 2.061523e-002,2.471445e-009,2.044370e-002,1.715282e-004,...
 2.076031e-002,2.471588e-009,2.058824e-002,1.668747e-004;...
3.200000e+003,3.358686e-002,2.066872e-009,7.511234e-007,...
 3.322580e-002,3.417056e-004,1.792322e-005,...
 1.957100e-002,2.066843e-009,1.932620e-002,2.447942e-004,...
 1.969012e-002,2.067052e-009,1.944503e-002,2.325980e-004;...
3.500000e+003,3.177708e-002,1.843170e-009,6.278843e-007,...
 3.134833e-002,4.003464e-004,2.837567e-005,...
 1.885888e-002,1.843195e-009,1.855532e-002,3.035593e-004,...
 1.897879e-002,1.843297e-009,1.867627e-002,2.834734e-004;...
4.000000e+003,2.929034e-002,1.554028e-009,4.807256e-007,...
 2.874726e-002,4.935881e-004,4.956942e-005,...
 1.786771e-002,1.554028e-009,1.746333e-002,4.043812e-004,...
 1.793417e-002,1.554202e-009,1.752941e-002,3.675070e-004;...
4.500000e+003,2.728349e-002,1.347010e-009,3.798266e-007,...
 2.663209e-002,5.783902e-004,7.315665e-005,...
 1.696004e-002,1.347008e-009,1.645651e-002,5.035287e-004,...
 1.703330e-002,1.347152e-009,1.653034e-002,4.470713e-004;...
5.000000e+003,2.563469e-002,1.185303e-009,3.076614e-007,...
 2.487347e-002,6.626807e-004,9.876275e-005,...
 1.620884e-002,1.185303e-009,1.560518e-002,6.036568e-004,...
 1.626218e-002,1.185434e-009,1.565602e-002,5.272829e-004;...
5.500000e+003,2.424464e-002,1.059838e-009,2.542708e-007,...
 2.338112e-002,7.384866e-004,1.249992e-004,...
 1.557595e-002,1.059842e-009,1.487302e-002,7.029232e-004,...
 1.558645e-002,1.059944e-009,1.488363e-002,6.013140e-004;...
6.300000e+003,2.227239e-002,9.048564e-010,1.937946e-007,...
 2.124941e-002,8.559338e-004,1.670166e-004,...
 1.461989e-002,9.048493e-010,1.376286e-002,8.570308e-004,...
 1.466453e-002,9.049841e-010,1.380730e-002,7.171490e-004;...
7.000000e+003,2.088385e-002,8.018362e-010,1.569673e-007,...
 1.972848e-002,9.509205e-004,2.045961e-004,...
 1.391545e-002,8.018361e-010,1.292864e-002,9.868117e-004,...
 1.398639e-002,8.019208e-010,1.299960e-002,8.121649e-004;...
8.000000e+003,1.928619e-002,6.897596e-010,1.201807e-007,...
 1.795632e-002,1.073678e-003,2.558956e-004,...
 1.310330e-002,6.897596e-010,1.194357e-002,1.159721e-003,...
 1.317647e-002,6.898249e-010,1.201611e-002,9.366246e-004;...
9.000000e+003,1.801649e-002,6.050629e-010,9.495666e-008,...
 1.652565e-002,1.185153e-003,3.050889e-004,...
 1.245316e-002,6.050628e-010,1.113719e-002,1.315970e-003,...
 1.251229e-002,6.051167e-010,1.119141e-002,1.050669e-003;...
1.000000e+004,1.698148e-002,5.387196e-010,7.691610e-008,...
 1.534320e-002,1.286548e-003,3.518752e-004,...
 1.193308e-002,5.387195e-010,1.046210e-002,1.470977e-003,...
 1.195966e-002,5.387675e-010,1.048851e-002,1.155182e-003;...
1.250000e+004,1.494229e-002,4.228821e-010,4.922642e-008,...
 1.297982e-002,1.504052e-003,4.584307e-004,...
 1.086315e-002,4.228792e-010,9.064027e-003,1.799122e-003,...
 1.089120e-002,4.229199e-010,9.089075e-003,1.381199e-003;...
1.600000e+004,1.312529e-002,3.247963e-010,3.004554e-008,...
 1.078733e-002,1.751102e-003,5.868598e-004,...
 9.870359e-003,3.247963e-010,7.690652e-003,2.179707e-003,...
 9.899859e-003,3.248249e-010,7.710784e-003,1.639391e-003;...
2.000000e+004,1.177150e-002,2.567982e-010,1.922903e-008,...
 9.081961e-003,1.979768e-003,7.097680e-004,...
 9.143862e-003,2.567982e-010,6.601182e-003,2.542680e-003,...
 9.165546e-003,2.568207e-010,6.613165e-003,1.878767e-003;...
2.500000e+004,1.066262e-002,2.034227e-010,1.230645e-008,...
 7.612931e-003,2.211894e-003,8.377759e-004,...
 8.531620e-003,2.034212e-010,5.610831e-003,2.920788e-003,...
 8.567619e-003,2.034420e-010,5.642353e-003,2.121658e-003;...
3.200000e+004,9.711997e-003,1.575390e-010,7.511234e-009,...
 6.262897e-003,2.467188e-003,9.818807e-004,...
 8.010915e-003,1.575420e-010,4.687377e-003,3.323538e-003,...
 8.052345e-003,1.575543e-010,4.713060e-003,2.388655e-003;...
4.000000e+004,9.073536e-003,1.252700e-010,4.807256e-009,...
 5.249846e-003,2.704881e-003,1.118810e-003,...
 7.698829e-003,1.252700e-010,3.984151e-003,3.714678e-003,...
 7.719607e-003,1.252815e-010,3.993277e-003,2.635994e-003;...
5.000000e+004,8.565958e-003,9.972555e-011,3.076614e-009,...
 4.374144e-003,2.936556e-003,1.255257e-003,...
 7.448283e-003,9.972555e-011,3.365996e-003,4.082287e-003,...
 7.478431e-003,9.973445e-011,3.371877e-003,2.876751e-003;...
6.300000e+004,8.178729e-003,7.883268e-011,1.937946e-009,...
 3.613829e-003,3.169585e-003,1.395240e-003,...
 7.448283e-003,9.972555e-011,3.365996e-003,4.082287e-003,...
 7.311369e-003,7.883953e-011,2.820150e-003,3.118491e-003;...
8.000000e+004,7.915913e-003,6.187528e-011,1.201807e-009,...
 2.966493e-003,3.407428e-003,1.541993e-003,...
 7.448283e-003,9.972555e-011,3.365996e-003,4.082287e-003,...
 7.224790e-003,6.188095e-011,2.338025e-003,3.364216e-003;...
1.000000e+005,7.759457e-003,4.937385e-011,7.691460e-010,...
 2.465533e-003,3.616537e-003,1.677387e-003,...
 7.448283e-003,9.972555e-011,3.365996e-003,4.082287e-003,...
 7.197759e-003,4.937815e-011,1.957423e-003,3.579888e-003;...
1.250000e+005,7.647531e-003,3.942988e-011,4.922642e-010,...
 2.042651e-003,3.802178e-003,1.802702e-003,...
 7.448283e-003,9.972555e-011,3.365996e-003,4.082287e-003,...
 7.195518e-003,3.943350e-011,1.635765e-003,3.771518e-003;...
 ];
zr = interp1q(za(:,1),za(:,flag),e);
