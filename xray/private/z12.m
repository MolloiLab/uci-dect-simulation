 
function zr =z12(flag,e)

za = [8.000000e-001,1.645907e+003,1.644371e+003,1.529166e+000,...
 1.103843e-002,0.000000e+000,0.000000e+000,...
 9.155924e+002,9.199620e+002,4.042846e-005,0.000000e+000,...
 1.644109e+003,1.644109e+003,2.355747e-005,0.000000e+000;...
1.000000e+000,9.212897e+002,9.199521e+002,1.304950e+000,...
 1.543781e-002,0.000000e+000,0.000000e+000,...
 9.155924e+002,9.199620e+002,4.042846e-005,0.000000e+000,...
 9.198275e+002,9.198275e+002,4.039597e-005,0.000000e+000;...
1.100000e+000,7.119102e+002,7.107460e+002,1.135648e+000,...
 1.749890e-002,0.000000e+000,0.000000e+000,...
 7.090017e+002,7.120763e+002,5.007129e-005,0.000000e+000,...
 7.107106e+002,7.107106e+002,5.042529e-005,0.000000e+000;...
1.172600e+000,6.049540e+002,6.039384e+002,9.738017e-001,...
 1.904628e-002,0.000000e+000,0.000000e+000,...
 5.972635e+002,5.996926e+002,5.779456e-005,0.000000e+000,...
 6.038747e+002,6.038747e+002,5.800549e-005,0.000000e+000;...
1.211900e+000,5.543739e+002,5.535070e+002,8.446766e-001,...
 1.988300e-002,0.000000e+000,0.000000e+000,...
 5.466967e+002,5.488477e+002,6.223283e-005,0.000000e+000,...
 5.534200e+002,5.534200e+002,6.215660e-005,0.000000e+000;...
1.245500e+000,5.110019e+002,5.103084e+002,6.750774e-001,...
 2.057260e-002,0.000000e+000,0.000000e+000,...
 5.080110e+002,5.099557e+002,6.607019e-005,0.000000e+000,...
 5.102507e+002,5.102507e+002,6.582317e-005,0.000000e+000;...
1.250000e+000,5.052306e+002,5.045618e+002,6.395079e-001,...
 2.065582e-002,0.000000e+000,0.000000e+000,...
 5.031179e+002,5.050368e+002,6.656203e-005,0.000000e+000,...
 5.045517e+002,5.045517e+002,6.633563e-005,0.000000e+000;...
1.265100e+000,4.911118e+002,4.905916e+002,5.125625e-001,...
 2.093869e-002,0.000000e+000,0.000000e+000,...
 4.871633e+002,4.889991e+002,6.822544e-005,0.000000e+000,...
 4.905341e+002,4.905341e+002,6.807876e-005,0.000000e+000;...
1.273000e+000,4.836560e+002,4.832102e+002,4.126656e-001,...
 2.108756e-002,0.000000e+000,0.000000e+000,...
 4.790919e+002,4.808861e+002,6.910408e-005,0.000000e+000,...
 4.831559e+002,4.831559e+002,6.900163e-005,0.000000e+000;...
1.278400e+000,4.786277e+002,4.782562e+002,3.384799e-001,...
 2.118763e-002,0.000000e+000,0.000000e+000,...
 4.736801e+002,4.754465e+002,6.970800e-005,0.000000e+000,...
 4.781929e+002,4.781929e+002,6.961378e-005,0.000000e+000;...
1.283900e+000,4.734508e+002,4.731536e+002,2.780415e-001,...
 2.129117e-002,0.000000e+000,0.000000e+000,...
 4.682538e+002,4.699925e+002,7.032584e-005,0.000000e+000,...
 4.731006e+002,4.731006e+002,7.025558e-005,0.000000e+000;...
1.289200e+000,4.685712e+002,4.682740e+002,2.666969e-001,...
 2.139000e-002,0.000000e+000,0.000000e+000,...
 4.631054e+002,4.648178e+002,7.092390e-005,0.000000e+000,...
 4.682134e+002,4.682134e+002,7.086725e-005,0.000000e+000;...
1.294100e+000,4.640383e+002,4.636915e+002,3.188870e-001,...
 2.148214e-002,0.000000e+000,0.000000e+000,...
 4.584142e+002,4.601028e+002,7.147916e-005,0.000000e+000,...
 4.636427e+002,4.636427e+002,7.143828e-005,0.000000e+000;...
1.294500e+000,4.636667e+002,4.633200e+002,3.277298e-001,...
 2.148982e-002,0.000000e+000,0.000000e+000,...
 4.580342e+002,4.597209e+002,7.152458e-005,0.000000e+000,...
 4.632774e+002,4.632774e+002,7.148724e-005,0.000000e+000;...
1.294500e+000,5.544235e+003,5.543987e+003,3.277298e-001,...
 2.148982e-002,0.000000e+000,0.000000e+000,...
 5.519188e+003,5.539512e+003,7.153594e-005,0.000000e+000,...
 5.409713e+003,5.409713e+003,7.148724e-005,0.000000e+000;...
1.304000e+000,5.463237e+003,5.462742e+003,5.645296e-001,...
 2.166792e-002,0.000000e+000,0.000000e+000,...
 5.430702e+003,5.450555e+003,7.260772e-005,0.000000e+000,...
 5.331517e+003,5.331517e+003,7.258831e-005,0.000000e+000;...
1.304500e+000,5.458531e+003,5.458036e+003,5.796144e-001,...
 2.167808e-002,0.000000e+000,0.000000e+000,...
 5.426057e+003,5.445886e+003,7.266496e-005,0.000000e+000,...
 5.326830e+003,5.326830e+003,7.265302e-005,0.000000e+000;...
1.308100e+000,5.428807e+003,5.428064e+003,6.844156e-001,...
 2.174446e-002,0.000000e+000,0.000000e+000,...
 5.392782e+003,5.412434e+003,7.307776e-005,0.000000e+000,...
 5.298112e+003,5.298112e+003,7.305937e-005,0.000000e+000;...
1.321400e+000,5.315114e+003,5.314123e+003,9.667423e-001,...
 2.199364e-002,0.000000e+000,0.000000e+000,...
 5.272375e+003,5.291394e+003,7.461329e-005,0.000000e+000,...
 5.188245e+003,5.188245e+003,7.460739e-005,0.000000e+000;...
1.322900e+000,5.302481e+003,5.301490e+003,9.829665e-001,...
 2.202188e-002,0.000000e+000,0.000000e+000,...
 5.259040e+003,5.277989e+003,7.478751e-005,0.000000e+000,...
 5.175846e+003,5.175846e+003,7.477911e-005,0.000000e+000;...
1.354900e+000,5.032737e+003,5.031499e+003,1.249837e+000,...
 2.262106e-002,0.000000e+000,0.000000e+000,...
 4.985811e+003,5.003350e+003,7.855366e-005,0.000000e+000,...
 4.914898e+003,4.914898e+003,7.850178e-005,0.000000e+000;...
1.394800e+000,4.695620e+003,4.694134e+003,1.435041e+000,...
 2.336985e-002,0.000000e+000,0.000000e+000,...
 4.673029e+003,4.688996e+003,8.338283e-005,0.000000e+000,...
 4.588471e+003,4.588471e+003,8.316604e-005,0.000000e+000;...
1.400000e+000,4.651529e+003,4.650043e+003,1.451389e+000,...
 2.346745e-002,0.000000e+000,0.000000e+000,...
 4.634371e+003,4.650146e+003,8.402310e-005,0.000000e+000,...
 4.545566e+003,4.545566e+003,8.377668e-005,0.000000e+000;...
1.465200e+000,4.239607e+003,4.238121e+003,1.627057e+000,...
 2.470396e-002,0.000000e+000,0.000000e+000,...
 4.185434e+003,4.199046e+003,9.226469e-005,0.000000e+000,...
 4.147172e+003,4.147172e+003,9.147863e-005,0.000000e+000;...
1.552400e+000,3.694918e+003,3.693184e+003,1.781819e+000,...
 2.620154e-002,0.000000e+000,0.000000e+000,...
 3.676656e+003,3.687939e+003,1.031762e-004,0.000000e+000,...
 3.617980e+003,3.617980e+003,1.023850e-004,0.000000e+000;...
1.600000e+000,3.417000e+003,3.415019e+003,1.829971e+000,...
 2.696198e-002,0.000000e+000,0.000000e+000,...
 3.405073e+003,3.415211e+003,1.092979e-004,0.000000e+000,...
 3.347845e+003,3.347845e+003,1.085417e-004,0.000000e+000;...
1.697100e+000,2.983528e+003,2.981546e+003,1.891252e+000,...
 2.851009e-002,0.000000e+000,0.000000e+000,...
 2.928706e+003,2.936925e+003,1.220836e-004,0.000000e+000,...
 2.926087e+003,2.926087e+003,1.210449e-004,0.000000e+000;...
1.800000e+000,2.527515e+003,2.525533e+003,1.924394e+000,...
 3.014986e-002,0.000000e+000,0.000000e+000,...
 2.519290e+003,2.525955e+003,1.359369e-004,0.000000e+000,...
 2.481226e+003,2.481226e+003,1.342656e-004,0.000000e+000;...
1.887100e+000,2.266540e+003,2.264558e+003,1.930661e+000,...
 3.153202e-002,0.000000e+000,0.000000e+000,...
 2.232426e+003,2.238059e+003,1.479607e-004,0.000000e+000,...
 2.226642e+003,2.226642e+003,1.454004e-004,0.000000e+000;...
1.897400e+000,2.235900e+003,2.233943e+003,1.931379e+000,...
 3.166825e-002,0.000000e+000,0.000000e+000,...
 2.201554e+003,2.207079e+003,1.494124e-004,0.000000e+000,...
 2.196715e+003,2.196715e+003,1.471857e-004,0.000000e+000;...
2.000000e+000,1.930611e+003,1.928630e+003,1.938736e+000,...
 3.303059e-002,0.000000e+000,0.000000e+000,...
 1.924052e+003,1.928632e+003,1.642133e-004,0.000000e+000,...
 1.898161e+003,1.898161e+003,1.649885e-004,0.000000e+000;...
2.200000e+000,1.496990e+003,1.495034e+003,1.912752e+000,...
 3.565124e-002,0.000000e+000,0.000000e+000,...
 1.491799e+003,1.495027e+003,1.942926e-004,0.000000e+000,...
 1.473485e+003,1.473485e+003,1.988845e-004,0.000000e+000;...
2.213400e+000,1.475218e+003,1.473286e+003,1.909532e+000,...
 3.582215e-002,0.000000e+000,0.000000e+000,...
 1.467809e+003,1.470965e+003,1.963443e-004,0.000000e+000,...
 1.452153e+003,1.452153e+003,2.010871e-004,0.000000e+000;...
2.345100e+000,1.262915e+003,1.261008e+003,1.877876e+000,...
 3.750650e-002,0.000000e+000,0.000000e+000,...
 1.257443e+003,1.259995e+003,2.169908e-004,0.000000e+000,...
 1.243949e+003,1.243949e+003,2.227731e-004,0.000000e+000;...
2.352300e+000,1.253503e+003,1.251596e+003,1.875895e+000,...
 3.760063e-002,0.000000e+000,0.000000e+000,...
 1.247168e+003,1.249691e+003,2.181445e-004,0.000000e+000,...
 1.234717e+003,1.234717e+003,2.239579e-004,0.000000e+000;...
2.500000e+000,1.063221e+003,1.061338e+003,1.835693e+000,...
 3.949057e-002,0.000000e+000,0.000000e+000,...
 1.059591e+003,1.061608e+003,2.423792e-004,0.000000e+000,...
 1.047885e+003,1.047885e+003,2.479540e-004,0.000000e+000;...
2.645800e+000,9.277794e+002,9.259464e+002,1.795740e+000,...
 4.131115e-002,0.000000e+000,0.000000e+000,...
 9.104326e+002,9.120696e+002,2.673386e-004,0.000000e+000,...
 9.148093e+002,9.148093e+002,2.710650e-004,0.000000e+000;...
2.800000e+000,7.852289e+002,7.834455e+002,1.752417e+000,...
 4.324072e-002,0.000000e+000,0.000000e+000,...
 7.823437e+002,7.836727e+002,2.948334e-004,0.000000e+000,...
 7.745690e+002,7.745690e+002,2.952791e-004,0.000000e+000;...
2.948400e+000,6.867687e+002,6.850101e+002,1.710407e+000,...
 4.505387e-002,0.000000e+000,0.000000e+000,...
 6.813353e+002,6.824343e+002,3.223568e-004,0.000000e+000,...
 6.776127e+002,6.776127e+002,3.180763e-004,0.000000e+000;...
3.112200e+000,5.952194e+002,5.935103e+002,1.665054e+000,...
 4.705775e-002,0.000000e+000,0.000000e+000,...
 5.895211e+002,5.904218e+002,3.539292e-004,0.000000e+000,...
 5.874360e+002,5.874360e+002,3.429957e-004,0.000000e+000;...
3.200000e+000,5.496181e+002,5.479338e+002,1.640730e+000,...
 4.811047e-002,0.000000e+000,0.000000e+000,...
 5.472062e+002,5.480192e+002,3.713616e-004,0.000000e+000,...
 5.424929e+002,5.424929e+002,3.674749e-004,0.000000e+000;...
3.386700e+000,4.732775e+002,4.716179e+002,1.590497e+000,...
 5.032738e-002,0.000000e+000,0.000000e+000,...
 4.701284e+002,4.707882e+002,4.095967e-004,0.000000e+000,...
 4.671927e+002,4.671927e+002,4.186933e-004,0.000000e+000;...
3.500000e+000,4.307476e+002,4.291376e+002,1.560773e+000,...
 5.166990e-002,0.000000e+000,0.000000e+000,...
 4.285548e+002,4.291367e+002,4.335652e-004,0.000000e+000,...
 4.252217e+002,4.252217e+002,4.494253e-004,0.000000e+000;...
3.688100e+000,3.729596e+002,3.713743e+002,1.512075e+000,...
 5.385212e-002,0.000000e+000,0.000000e+000,...
 3.693509e+002,3.698267e+002,4.745874e-004,0.000000e+000,...
 3.681770e+002,3.681770e+002,4.994629e-004,0.000000e+000;...
3.741700e+000,3.564876e+002,3.549271e+002,1.498501e+000,...
 5.447137e-002,0.000000e+000,0.000000e+000,...
 3.545213e+002,3.549714e+002,4.865540e-004,0.000000e+000,...
 3.519053e+002,3.519053e+002,5.135658e-004,0.000000e+000;...
4.000000e+000,2.950584e+002,2.935722e+002,1.433109e+000,...
 5.746852e-002,0.000000e+000,0.000000e+000,...
 2.932945e+002,2.936427e+002,5.459667e-004,0.000000e+000,...
 2.912500e+002,2.912356e+002,5.810919e-004,0.000000e+000;...
4.215500e+000,2.589440e+002,2.575073e+002,1.380399e+000,...
 5.990340e-002,0.000000e+000,0.000000e+000,...
 2.526844e+002,2.529688e+002,5.977193e-004,0.000000e+000,...
 2.555566e+002,2.555566e+002,6.360217e-004,0.000000e+000;...
4.242600e+000,2.544111e+002,2.529744e+002,1.373909e+000,...
 6.021054e-002,0.000000e+000,0.000000e+000,...
 2.481270e+002,2.484045e+002,6.043666e-004,0.000000e+000,...
 2.510660e+002,2.510660e+002,6.428909e-004,0.000000e+000;...
4.500000e+000,2.114453e+002,2.100681e+002,1.312876e+000,...
 6.311852e-002,0.000000e+000,0.000000e+000,...
 2.099032e+002,2.101243e+002,6.690355e-004,0.000000e+000,...
 2.085824e+002,2.085824e+002,7.076118e-004,0.000000e+000;...
4.722800e+000,1.871411e+002,1.858110e+002,1.264253e+000,...
 6.558064e-002,0.000000e+000,0.000000e+000,...
 1.829823e+002,1.831658e+002,7.272274e-004,0.000000e+000,...
 1.845535e+002,1.845535e+002,7.624300e-004,0.000000e+000;...
4.743400e+000,1.848970e+002,1.835718e+002,1.259819e+000,...
 6.580853e-002,0.000000e+000,0.000000e+000,...
 1.807341e+002,1.809145e+002,7.326531e-004,0.000000e+000,...
 1.823344e+002,1.823344e+002,7.674790e-004,0.000000e+000;...
5.000000e+000,1.570037e+002,1.557305e+002,1.204384e+000,...
 6.864468e-002,0.000000e+000,0.000000e+000,...
 1.556151e+002,1.557622e+002,8.016276e-004,0.000000e+000,...
 1.547356e+002,1.547356e+002,8.299311e-004,0.000000e+000;...
5.440600e+000,1.243744e+002,1.231829e+002,1.116872e+000,...
 7.341287e-002,0.000000e+000,0.000000e+000,...
 1.224225e+002,1.225286e+002,9.259940e-004,0.000000e+000,...
 1.224615e+002,1.224615e+002,9.346395e-004,0.000000e+000;...
5.500000e+000,1.199752e+002,1.187962e+002,1.105255e+000,...
 7.405689e-002,0.000000e+000,0.000000e+000,...
 1.187037e+002,1.188054e+002,9.433261e-004,0.000000e+000,...
 1.181087e+002,1.181087e+002,9.486625e-004,0.000000e+000;...
5.732700e+000,1.077612e+002,1.066218e+002,1.062849e+000,...
 7.639764e-002,0.000000e+000,0.000000e+000,...
 1.055212e+002,1.056076e+002,1.012502e-003,0.000000e+000,...
 1.060261e+002,1.060261e+002,1.020261e-003,0.000000e+000;...
6.000000e+000,9.390992e+001,9.281509e+001,1.015489e+000,...
 7.899847e-002,0.000000e+000,0.000000e+000,...
 9.267812e+001,9.275044e+001,1.094450e-003,0.000000e+000,...
 9.232184e+001,9.232088e+001,1.111494e-003,0.000000e+000;...
6.009600e+000,9.350369e+001,9.241135e+001,1.013805e+000,...
 7.909260e-002,0.000000e+000,0.000000e+000,...
 9.224041e+001,9.231227e+001,1.097330e-003,0.000000e+000,...
 9.192284e+001,9.192093e+001,1.114692e-003,0.000000e+000;...
6.300000e+000,8.130950e+001,8.026421e+001,9.633737e-001,...
 8.191884e-002,0.000000e+000,0.000000e+000,...
 8.021099e+001,8.027032e+001,1.185856e-003,0.000000e+000,...
 7.985860e+001,7.985769e+001,1.212370e-003,0.000000e+000;...
7.000000e+000,5.968790e+001,5.874169e+001,8.577054e-001,...
 8.852991e-002,0.000000e+000,0.000000e+000,...
 5.871390e+001,5.875235e+001,1.410128e-003,0.000000e+000,...
 5.847537e+001,5.847373e+001,1.439491e-003,0.000000e+000;...
8.000000e+000,4.037980e+001,3.955249e+001,7.293977e-001,...
 9.706064e-002,0.000000e+000,0.000000e+000,...
 3.953844e+001,3.956017e+001,1.756302e-003,0.000000e+000,...
 3.939655e+001,3.939511e+001,1.778735e-003,0.000000e+000;...
8.911700e+000,2.956034e+001,2.882467e+001,6.339099e-001,...
 1.040284e-001,0.000000e+000,0.000000e+000,...
 2.872244e+001,2.873568e+001,2.073792e-003,0.000000e+000,...
 2.872241e+001,2.871983e+001,2.092303e-003,0.000000e+000;...
9.000000e+000,2.863642e+001,2.790571e+001,6.254882e-001,...
 1.047021e-001,0.000000e+000,0.000000e+000,...
 2.789596e+001,2.790858e+001,2.105513e-003,0.000000e+000,...
 2.780843e+001,2.780651e+001,2.121967e-003,0.000000e+000;...
1.000000e+001,2.107939e+001,2.042670e+001,5.413698e-001,...
 1.112166e-001,0.000000e+000,0.000000e+000,...
 2.041948e+001,2.042670e+001,2.476338e-003,0.000000e+000,...
 2.036379e+001,2.036149e+001,2.473908e-003,0.000000e+000;...
1.088900e+001,1.641374e+001,1.581753e+001,4.801882e-001,...
 1.160170e-001,0.000000e+000,0.000000e+000,...
 1.572303e+001,1.572714e+001,2.749890e-003,0.000000e+000,...
 1.577359e+001,1.577095e+001,2.791544e-003,0.000000e+000;...
1.100000e+001,1.583363e+001,1.524361e+001,4.732279e-001,...
 1.166164e-001,0.000000e+000,0.000000e+000,...
 1.524122e+001,1.524502e+001,2.784416e-003,0.000000e+000,...
 1.520219e+001,1.519906e+001,2.829937e-003,0.000000e+000;...
1.172600e+001,1.307947e+001,1.252735e+001,4.321595e-001,...
 1.199752e-001,0.000000e+000,0.000000e+000,...
 1.252695e+001,1.252901e+001,3.012195e-003,0.000000e+000,...
 1.249605e+001,1.249311e+001,3.076815e-003,0.000000e+000;...
1.250000e+001,1.081129e+001,1.029509e+001,3.929736e-001,...
 1.231780e-001,0.000000e+000,0.000000e+000,...
 1.029601e+001,1.029667e+001,3.258634e-003,0.000000e+000,...
 1.027218e+001,1.026851e+001,3.365609e-003,0.000000e+000;...
1.322900e+001,9.149486e+000,8.661520e+000,3.622838e-001,...
 1.258506e-001,0.000000e+000,0.000000e+000,...
 8.652561e+000,8.652173e+000,3.493987e-003,0.000000e+000,...
 8.643931e+000,8.640456e+000,3.614794e-003,0.000000e+000;...
1.400000e+001,7.730669e+000,7.269950e+000,3.320646e-001,...
 1.286818e-001,0.000000e+000,0.000000e+000,...
 7.272431e+000,7.271152e+000,3.746167e-003,0.000000e+000,...
 7.256979e+000,7.253284e+000,3.866420e-003,0.000000e+000;...
1.496700e+001,6.355447e+000,5.922718e+000,3.011023e-001,...
 1.316864e-001,0.000000e+000,0.000000e+000,...
 5.925370e+000,5.923197e+000,4.052767e-003,0.000000e+000,...
 5.914160e+000,5.909936e+000,4.149742e-003,0.000000e+000;...
1.555600e+001,5.714404e+000,5.296784e+000,2.841844e-001,...
 1.335194e-001,0.000000e+000,0.000000e+000,...
 5.263896e+000,5.261279e+000,4.222594e-003,0.000000e+000,...
 5.290120e+000,5.285686e+000,4.370934e-003,0.000000e+000;...
1.600000e+001,5.231144e+000,4.825166e+000,2.715518e-001,...
 1.344705e-001,0.000000e+000,0.000000e+000,...
 4.828700e+000,4.825781e+000,4.350888e-003,0.000000e+000,...
 4.820042e+000,4.815373e+000,4.533045e-003,0.000000e+000;...
1.697100e+001,4.412500e+000,4.027329e+000,2.486397e-001,...
 1.364373e-001,0.000000e+000,0.000000e+000,...
 4.030775e+000,4.027269e+000,4.632233e-003,0.000000e+000,...
 4.024445e+000,4.019703e+000,4.865975e-003,0.000000e+000;...
1.800000e+001,3.726871e+000,3.361516e+000,2.270602e-001,...
 1.385278e-001,0.000000e+000,0.000000e+000,...
 3.365463e+000,3.361418e+000,4.931502e-003,0.000000e+000,...
 3.360473e+000,3.355364e+000,5.195722e-003,0.000000e+000;...
1.897400e+001,3.257235e+000,2.906741e+000,2.100706e-001,...
 1.403435e-001,0.000000e+000,0.000000e+000,...
 2.863477e+000,2.858977e+000,5.215779e-003,0.000000e+000,...
 2.907427e+000,2.901944e+000,5.482396e-003,0.000000e+000;...
2.000000e+001,2.767040e+000,2.431433e+000,1.933039e-001,...
 1.422607e-001,0.000000e+000,0.000000e+000,...
 2.436374e+000,2.431435e+000,5.516238e-003,0.000000e+000,...
 2.433305e+000,2.427529e+000,5.767528e-003,0.000000e+000;...
2.200000e+001,2.110341e+000,1.798192e+000,1.669240e-001,...
 1.452256e-001,0.000000e+000,0.000000e+000,...
 1.803963e+000,1.798263e+000,6.088063e-003,0.000000e+000,...
 1.801907e+000,1.795559e+000,6.348224e-003,0.000000e+000;...
2.345200e+001,1.766858e+000,1.468827e+000,1.513983e-001,...
 1.466375e-001,0.000000e+000,0.000000e+000,...
 1.475104e+000,1.468929e+000,6.472499e-003,0.000000e+000,...
 1.473614e+000,1.466801e+000,6.808477e-003,0.000000e+000;...
2.500000e+001,1.484705e+000,1.199777e+000,1.367642e-001,...
 1.481410e-001,0.000000e+000,0.000000e+000,...
 1.206536e+000,1.199883e+000,6.881258e-003,0.000000e+000,...
 1.205494e+000,1.198253e+000,7.256551e-003,0.000000e+000;...
2.645800e+001,1.277331e+000,1.002807e+000,1.251051e-001,...
 1.494216e-001,0.000000e+000,0.000000e+000,...
 1.009910e+000,1.002825e+000,7.265278e-003,0.000000e+000,...
 1.009233e+000,1.001587e+000,7.637131e-003,0.000000e+000;...
2.800000e+001,1.103150e+000,8.381621e-001,1.142212e-001,...
 1.507765e-001,0.000000e+000,0.000000e+000,...
 8.457562e-001,8.382279e-001,7.670457e-003,0.000000e+000,...
 8.451970e-001,8.371921e-001,8.009852e-003,0.000000e+000;...
2.993300e+001,9.328324e-001,6.785204e-001,1.027404e-001,...
 1.515692e-001,0.000000e+000,0.000000e+000,...
 6.866102e-001,6.785790e-001,8.138875e-003,0.000000e+000,...
 6.863797e-001,6.777781e-001,8.600433e-003,0.000000e+000;...
3.043100e+001,8.990215e-001,6.473600e-001,9.987697e-002,...
 1.517723e-001,0.000000e+000,0.000000e+000,...
 6.522055e-001,6.440482e-001,8.257766e-003,0.000000e+000,...
 6.554304e-001,6.466863e-001,8.748452e-003,0.000000e+000;...
3.200000e+001,7.936754e-001,5.492465e-001,9.200759e-002,...
 1.524138e-001,0.000000e+000,0.000000e+000,...
 5.578463e-001,5.492970e-001,8.630836e-003,0.000000e+000,...
 5.578843e-001,5.487068e-001,9.190014e-003,0.000000e+000;...
3.500000e+001,6.465178e-001,4.136316e-001,7.943690e-002,...
 1.534616e-001,0.000000e+000,0.000000e+000,...
 4.229113e-001,4.136361e-001,9.331340e-003,0.000000e+000,...
 4.231855e-001,4.132512e-001,9.930706e-003,0.000000e+000;...
3.741700e+001,5.600710e-001,3.348883e-001,7.116129e-002,...
 1.540338e-001,0.000000e+000,0.000000e+000,...
 3.446491e-001,3.348198e-001,9.871774e-003,0.000000e+000,...
 3.450242e-001,3.345796e-001,1.043613e-002,0.000000e+000;...
4.000000e+001,4.891054e-001,2.709574e-001,6.348512e-002,...
 1.546431e-001,0.000000e+000,0.000000e+000,...
 2.813809e-001,2.709697e-001,1.044331e-002,0.000000e+000,...
 2.817960e-001,2.707471e-001,1.104253e-002,0.000000e+000;...
4.500000e+001,3.916360e-001,1.852636e-001,5.175164e-002,...
 1.546183e-001,0.000000e+000,0.000000e+000,...
 1.967489e-001,1.852691e-001,1.149935e-002,0.000000e+000,...
 1.972925e-001,1.851341e-001,1.216628e-002,0.000000e+000;...
4.853500e+001,3.472980e-001,1.474970e-001,4.534864e-002,...
 1.544598e-001,0.000000e+000,0.000000e+000,...
 1.573244e-001,1.451406e-001,1.219800e-002,0.000000e+000,...
 1.602114e-001,1.473992e-001,1.280863e-002,0.000000e+000;...
5.000000e+001,3.292903e-001,1.318524e-001,4.303513e-002,...
 1.543954e-001,0.000000e+000,0.000000e+000,...
 1.443279e-001,1.318562e-001,1.248423e-002,0.000000e+000,...
 1.449080e-001,1.317701e-001,1.314368e-002,0.000000e+000;...
5.500000e+001,2.866119e-001,9.693184e-002,3.633489e-002,...
 1.533377e-001,0.000000e+000,0.000000e+000,...
 1.103382e-001,9.693643e-002,1.341010e-002,0.000000e+000,...
 1.111181e-001,9.687565e-002,1.424347e-002,0.000000e+000;...
6.000000e+001,2.570862e-001,7.364323e-002,3.104405e-002,...
 1.524039e-001,0.000000e+000,0.000000e+000,...
 8.748363e-002,7.319935e-002,1.429006e-002,0.000000e+000,...
 8.874714e-002,7.360441e-002,1.514272e-002,0.000000e+000;...
6.300000e+001,2.427693e-001,6.252900e-002,2.839615e-002,...
 1.518441e-001,0.000000e+000,0.000000e+000,...
 7.733044e-002,6.253266e-002,1.480249e-002,0.000000e+000,...
 7.809889e-002,6.249681e-002,1.560208e-002,0.000000e+000;...
6.701400e+001,2.287273e-001,5.219007e-002,2.535194e-002,...
 1.511852e-001,0.000000e+000,0.000000e+000,...
 6.668928e-002,5.122885e-002,1.546406e-002,0.000000e+000,...
 6.831305e-002,5.216529e-002,1.614777e-002,0.000000e+000;...
7.000000e+001,2.185939e-001,4.450151e-002,2.339661e-002,...
 1.506948e-001,0.000000e+000,0.000000e+000,...
 6.044975e-002,4.450407e-002,1.594870e-002,0.000000e+000,...
 6.098686e-002,4.448194e-002,1.650493e-002,0.000000e+000;...
7.483300e+001,2.057334e-001,3.587665e-002,2.070635e-002,...
 1.491516e-001,0.000000e+000,0.000000e+000,...
 5.257409e-002,3.587582e-002,1.670055e-002,0.000000e+000,...
 5.320429e-002,3.585992e-002,1.734437e-002,0.000000e+000;...
8.000000e+001,1.948049e-001,2.891880e-002,1.827073e-002,...
 1.476134e-001,0.000000e+000,0.000000e+000,...
 4.635642e-002,2.892003e-002,1.743810e-002,0.000000e+000,...
 4.701221e-002,2.890805e-002,1.810417e-002,0.000000e+000;...
9.000000e+001,1.793857e-001,1.978194e-002,1.466325e-002,...
 1.449408e-001,0.000000e+000,0.000000e+000,...
 3.860067e-002,1.978220e-002,1.881951e-002,0.000000e+000,...
 3.903384e-002,1.977458e-002,1.925926e-002,0.000000e+000;...
9.894100e+001,1.698022e-001,1.468778e-002,1.227618e-002,...
 1.428378e-001,0.000000e+000,0.000000e+000,...
 3.458513e-002,1.457646e-002,2.000937e-002,0.000000e+000,...
 3.471940e-002,1.468308e-002,2.003632e-002,0.000000e+000;...
1.000000e+002,1.687050e-001,1.408438e-002,1.203220e-002,...
 1.425876e-001,0.000000e+000,0.000000e+000,...
 3.423167e-002,1.408460e-002,2.014774e-002,0.000000e+000,...
 3.419310e-002,1.407988e-002,2.011322e-002,0.000000e+000;...
1.100000e+002,1.600578e-001,1.035801e-002,1.004789e-002,...
 1.396524e-001,0.000000e+000,0.000000e+000,...
 3.115251e-002,1.035827e-002,2.079469e-002,0.000000e+000,...
 3.156060e-002,1.035528e-002,2.120533e-002,0.000000e+000;...
1.206900e+002,1.530702e-001,7.734632e-003,8.422739e-003,...
 1.369129e-001,0.000000e+000,0.000000e+000,...
 2.911639e-002,7.681091e-003,2.143560e-002,0.000000e+000,...
 2.982705e-002,7.731882e-003,2.209470e-002,0.000000e+000;...
1.250000e+002,1.505412e-001,6.859513e-003,7.874582e-003,...
 1.358081e-001,0.000000e+000,0.000000e+000,...
 2.853683e-002,6.859470e-003,2.167762e-002,0.000000e+000,...
 2.923678e-002,6.857931e-003,2.237885e-002,0.000000e+000;...
1.394300e+002,1.435363e-001,4.829872e-003,6.384428e-003,...
 1.323230e-001,0.000000e+000,0.000000e+000,...
 2.727171e-002,4.823074e-003,2.244880e-002,0.000000e+000,...
 2.816434e-002,4.828773e-003,2.333557e-002,0.000000e+000;...
1.400000e+002,1.432812e-001,4.760021e-003,6.334888e-003,...
 1.321868e-001,0.000000e+000,0.000000e+000,...
 2.723351e-002,4.760057e-003,2.247361e-002,0.000000e+000,...
 2.813588e-002,4.759031e-003,2.337726e-002,0.000000e+000;...
1.496700e+002,1.393898e-001,3.838336e-003,5.585848e-003,...
 1.299649e-001,0.000000e+000,0.000000e+000,...
 2.672106e-002,3.837923e-003,2.288326e-002,0.000000e+000,...
 2.785093e-002,3.837254e-003,2.401375e-002,0.000000e+000;...
1.600000e+002,1.355802e-001,3.094992e-003,4.893531e-003,...
 1.275920e-001,0.000000e+000,0.000000e+000,...
 2.639493e-002,3.094950e-003,2.330007e-002,0.000000e+000,...
 2.761746e-002,3.094361e-003,2.452299e-002,0.000000e+000;...
1.771400e+002,1.302225e-001,2.240036e-003,4.015440e-003,...
 1.239681e-001,0.000000e+000,0.000000e+000,...
 2.617954e-002,2.229322e-003,2.395028e-002,0.000000e+000,...
 2.757414e-002,2.239640e-003,2.533453e-002,0.000000e+000;...
1.800000e+002,1.293754e-001,2.117128e-003,3.892086e-003,...
 1.233662e-001,0.000000e+000,0.000000e+000,...
 2.617133e-002,2.117135e-003,2.405425e-002,0.000000e+000,...
 2.762324e-002,2.116762e-003,2.550638e-002,0.000000e+000;...
2.000000e+002,1.240102e-001,1.520943e-003,3.168063e-003,...
 1.193213e-001,0.000000e+000,0.000000e+000,...
 2.617940e-002,1.520950e-003,2.465848e-002,0.000000e+000,...
 2.796437e-002,1.520718e-003,2.644368e-002,0.000000e+000;...
2.200000e+002,1.195368e-001,1.131957e-003,2.628081e-003,...
 1.157767e-001,0.000000e+000,0.000000e+000,...
 2.631101e-002,1.131958e-003,2.517908e-002,0.000000e+000,...
 2.819749e-002,1.131792e-003,2.706635e-002,0.000000e+000;...
2.474000e+002,1.144590e-001,7.896626e-004,2.086116e-003,...
 1.115832e-001,0.000000e+000,0.000000e+000,...
 2.662207e-002,7.867602e-004,2.583533e-002,0.000000e+000,...
 2.837789e-002,7.895678e-004,2.758807e-002,0.000000e+000;...
2.500000e+002,1.139933e-001,7.616728e-004,2.043636e-003,...
 1.111869e-001,0.000000e+000,0.000000e+000,...
 2.665626e-002,7.616779e-004,2.589459e-002,0.000000e+000,...
 2.837701e-002,7.615862e-004,2.761609e-002,0.000000e+000;...
2.800000e+002,1.091434e-001,5.360938e-004,1.633993e-003,...
 1.069735e-001,0.000000e+000,0.000000e+000,...
 2.708201e-002,5.360887e-004,2.654593e-002,0.000000e+000,...
 2.869868e-002,5.360222e-004,2.816297e-002,0.000000e+000;...
3.013600e+002,1.060397e-001,4.278248e-004,1.412872e-003,...
 1.041993e-001,0.000000e+000,0.000000e+000,...
 2.740437e-002,4.272010e-004,2.697717e-002,0.000000e+000,...
 2.907127e-002,4.277734e-004,2.864218e-002,0.000000e+000;...
3.200000e+002,1.033893e-001,3.584197e-004,1.254494e-003,...
 1.017768e-001,0.000000e+000,0.000000e+000,...
 2.762397e-002,3.584229e-004,2.726555e-002,0.000000e+000,...
 2.923850e-002,3.583872e-004,2.887931e-002,0.000000e+000;...
3.500000e+002,9.975808e-002,2.757875e-004,1.050217e-003,...
 9.843289e-002,0.000000e+000,0.000000e+000,...
 2.797766e-002,2.757802e-004,2.770189e-002,0.000000e+000,...
 2.941708e-002,2.757472e-004,2.914122e-002,0.000000e+000;...
4.000000e+002,9.464558e-002,1.866135e-004,8.055897e-004,...
 9.365232e-002,0.000000e+000,0.000000e+000,...
 2.855168e-002,1.866138e-004,2.836507e-002,0.000000e+000,...
 2.944540e-002,1.865948e-004,2.925862e-002,0.000000e+000;...
4.500000e+002,9.021921e-002,1.356149e-004,6.373282e-004,...
 8.944639e-002,0.000000e+000,0.000000e+000,...
 2.899015e-002,1.356152e-004,2.885454e-002,0.000000e+000,...
 2.947126e-002,1.356066e-004,2.933589e-002,0.000000e+000;...
5.000000e+002,8.626099e-002,1.019279e-004,5.166990e-004,...
 8.564174e-002,0.000000e+000,0.000000e+000,...
 2.939986e-002,1.019287e-004,2.929793e-002,0.000000e+000,...
 2.951954e-002,1.019218e-004,2.941724e-002,0.000000e+000;...
5.500000e+002,8.284275e-002,7.880031e-005,4.273046e-004,...
 8.233745e-002,0.000000e+000,0.000000e+000,...
 2.926268e-002,7.880079e-005,2.918388e-002,0.000000e+000,...
 2.940752e-002,7.879519e-005,2.932811e-002,0.000000e+000;...
6.300000e+002,7.799034e-002,5.617801e-005,3.259216e-004,...
 7.760888e-002,0.000000e+000,0.000000e+000,...
 2.896558e-002,5.617872e-005,2.890941e-002,0.000000e+000,...
 2.926747e-002,5.617497e-005,2.921182e-002,0.000000e+000;...
7.000000e+002,7.438137e-002,4.347356e-005,2.641456e-004,...
 7.407422e-002,0.000000e+000,0.000000e+000,...
 2.871524e-002,4.347259e-005,2.867177e-002,0.000000e+000,...
 2.901806e-002,4.347126e-005,2.897455e-002,0.000000e+000;...
8.000000e+002,6.993271e-002,3.207695e-005,2.023226e-004,...
 6.969739e-002,0.000000e+000,0.000000e+000,...
 2.832852e-002,3.207695e-005,2.829644e-002,0.000000e+000,...
 2.860704e-002,3.207615e-005,2.857471e-002,0.000000e+000;...
9.000000e+002,6.610824e-002,2.478471e-005,1.599117e-004,...
 6.592247e-002,0.000000e+000,0.000000e+000,...
 2.798878e-002,2.478502e-005,2.796400e-002,0.000000e+000,...
 2.816539e-002,2.478416e-005,2.814049e-002,0.000000e+000;...
1.022000e+003,6.219956e-002,1.898782e-005,1.240474e-004,...
 6.205590e-002,0.000000e+000,0.000000e+000,...
 2.753273e-002,1.867151e-005,2.751406e-002,0.000000e+000,...
 2.753447e-002,1.898745e-005,2.751591e-002,0.000000e+000;...
1.100000e+003,5.985138e-002,1.639442e-005,1.070924e-004,...
 5.972505e-002,1.718507e-006,0.000000e+000,...
 2.702505e-002,1.587149e-005,2.700906e-002,1.218629e-007,...
 2.721839e-002,1.639446e-005,2.720167e-002,1.218547e-007;...
1.250000e+003,5.600215e-002,1.277678e-005,8.294926e-005,...
 5.587829e-002,2.935227e-005,0.000000e+000,...
 2.617126e-002,1.265987e-005,2.615325e-002,5.353939e-006,...
 2.652644e-002,1.277655e-005,2.650851e-002,5.354023e-006;...
1.400000e+003,5.285142e-002,1.039962e-005,6.613549e-005,...
 5.267803e-002,9.624324e-005,0.000000e+000,...
 2.545348e-002,1.036358e-005,2.541713e-002,2.598605e-005,...
 2.581034e-002,1.039943e-005,2.577422e-002,2.598563e-005;...
1.600000e+003,4.943566e-002,8.257523e-006,5.064195e-005,...
 4.913842e-002,2.375726e-004,0.000000e+000,...
 2.467062e-002,8.257416e-006,2.457654e-002,8.582333e-005,...
 2.489834e-002,8.257543e-006,2.480424e-002,8.582255e-005;...
1.800000e+003,4.659703e-002,6.813194e-006,4.001569e-005,...
 4.612888e-002,4.222268e-004,0.000000e+000,...
 2.400270e-002,6.813183e-006,2.381339e-002,1.824943e-004,...
 2.409962e-002,6.813218e-006,2.391028e-002,1.824936e-004;...
2.044000e+003,4.367667e-002,5.545969e-006,3.103414e-005,...
 4.295339e-002,6.858771e-004,0.000000e+000,...
 2.325531e-002,5.545969e-006,2.290682e-002,3.429397e-004,...
 2.326883e-002,5.545809e-006,2.292018e-002,3.429437e-004;...
2.200000e+003,4.200966e-002,4.985427e-006,2.679107e-005,...
 4.111547e-002,8.631052e-004,2.220790e-007,...
 2.270962e-002,4.985267e-006,2.224241e-002,4.622253e-004,...
 2.280956e-002,4.985371e-006,2.234248e-002,4.621473e-004;...
2.500000e+003,3.934938e-002,4.142261e-006,2.074747e-005,...
 3.810841e-002,1.214168e-003,2.244099e-006,...
 2.185639e-002,4.142239e-006,2.113309e-002,7.191570e-004,...
 2.201816e-002,4.142069e-006,2.129471e-002,7.178161e-004;...
2.800000e+003,3.722165e-002,3.514841e-006,1.654056e-005,...
 3.562647e-002,1.568823e-003,7.261280e-006,...
 2.120032e-002,3.514876e-006,2.019599e-002,1.000815e-003,...
 2.134237e-002,3.514984e-006,2.033867e-002,9.962028e-004;...
3.200000e+003,3.488585e-002,2.919622e-006,1.266433e-005,...
 3.281757e-002,2.035239e-003,1.770648e-005,...
 2.049202e-002,2.919450e-006,1.909178e-002,1.397316e-003,...
 2.060704e-002,2.919540e-006,1.920797e-002,1.385219e-003;...
3.500000e+003,3.338728e-002,2.592164e-006,1.058638e-005,...
 3.096479e-002,2.381646e-003,2.803451e-005,...
 2.003864e-002,2.592186e-006,1.832996e-002,1.706092e-003,...
 2.015764e-002,2.592118e-006,1.844828e-002,1.686207e-003;...
4.000000e+003,3.138835e-002,2.171349e-006,8.105437e-006,...
 2.839615e-002,2.932750e-003,4.896999e-005,...
 1.947284e-002,2.171325e-006,1.725077e-002,2.219893e-003,...
 1.953736e-002,2.171264e-006,1.731609e-002,2.183477e-003;...
4.500000e+003,2.982042e-002,1.872972e-006,6.404492e-006,...
 2.630806e-002,3.432605e-003,7.226603e-005,...
 1.896708e-002,1.872975e-006,1.625632e-002,2.708887e-003,...
 1.904087e-002,1.872925e-006,1.632950e-002,2.653001e-003;...
5.000000e+003,2.860174e-002,1.641002e-006,5.187549e-006,...
 2.456921e-002,3.928498e-003,9.756842e-005,...
 1.860966e-002,1.641002e-006,1.541544e-002,3.192572e-003,...
 1.866897e-002,1.641034e-006,1.546437e-002,3.125517e-003;...
5.500000e+003,2.759856e-002,1.462214e-006,4.287413e-006,...
 2.309664e-002,4.373116e-003,1.235198e-004,...
 1.835440e-002,1.462194e-006,1.469226e-002,3.660678e-003,...
 1.836468e-002,1.462173e-006,1.470219e-002,3.560502e-003;...
6.300000e+003,2.622136e-002,1.242455e-006,3.267638e-006,...
 2.099121e-002,5.061470e-003,1.650217e-004,...
 1.797180e-002,1.242451e-006,1.359553e-002,4.375027e-003,...
 1.801861e-002,1.242474e-006,1.363893e-002,4.240375e-003;...
7.000000e+003,2.531231e-002,1.097304e-006,2.646906e-006,...
 1.948867e-002,5.617801e-003,2.020476e-004,...
 1.772427e-002,1.097304e-006,1.277152e-002,4.951649e-003,...
 1.781199e-002,1.097291e-006,1.284072e-002,4.797537e-003;...
8.000000e+003,2.432746e-002,9.402634e-007,2.026471e-006,...
 1.773818e-002,6.333650e-003,2.526524e-004,...
 1.752666e-002,9.402634e-007,1.179855e-002,5.727167e-003,...
 1.761566e-002,9.403017e-007,1.186997e-002,5.524497e-003;...
9.000000e+003,2.361111e-002,8.223590e-007,1.601172e-006,...
 1.632481e-002,6.982619e-003,3.012013e-004,...
 1.745958e-002,8.223590e-007,1.100205e-002,6.456705e-003,...
 1.751213e-002,8.223499e-007,1.105428e-002,6.189655e-003;...
1.000000e+004,2.307807e-002,7.304628e-007,1.296949e-006,...
 1.515642e-002,7.572142e-003,3.475210e-004,...
 1.744624e-002,7.304628e-007,1.033524e-002,7.110276e-003,...
 1.747126e-002,7.304598e-007,1.036035e-002,6.798276e-003;...
1.250000e+004,2.210362e-002,5.706229e-007,8.300376e-007,...
 1.282236e-002,8.827230e-003,4.525203e-004,...
 1.746332e-002,5.706406e-007,8.954164e-003,8.508586e-003,...
 1.749977e-002,5.706207e-007,8.978391e-003,8.105287e-003;...
1.600000e+004,2.148115e-002,4.364447e-007,5.066177e-007,...
 1.065648e-002,1.024481e-002,5.788713e-004,...
 1.769160e-002,4.364447e-007,7.597479e-003,1.009368e-002,...
 1.775000e-002,4.364583e-007,7.617457e-003,9.590517e-003;...
2.000000e+004,2.120720e-002,3.440532e-007,3.242373e-007,...
 8.971886e-003,1.153532e-002,6.992528e-004,...
 1.809017e-002,3.440532e-007,6.521220e-003,1.156861e-002,...
 1.814196e-002,3.440517e-007,6.532471e-003,1.094569e-002;...
2.500000e+004,2.116707e-002,2.717500e-007,2.075119e-007,...
 7.520621e-003,1.282211e-002,8.238699e-004,...
 1.861223e-002,2.717542e-007,5.542892e-003,1.306907e-002,...
 1.866161e-002,2.717701e-007,5.573333e-003,1.229793e-002;...
3.200000e+004,2.136399e-002,2.101350e-007,1.266557e-007,...
 6.187012e-003,1.421368e-002,9.629773e-004,...
 1.925624e-002,2.101365e-007,4.630643e-003,1.462539e-002,...
 1.934806e-002,2.101293e-007,4.655532e-003,1.375970e-002;...
4.000000e+004,2.176403e-002,1.667754e-007,8.105932e-008,...
 5.186311e-003,1.548363e-002,1.093836e-003,...
 2.004325e-002,1.667754e-007,3.935945e-003,1.610714e-002,...
 2.009914e-002,1.667672e-007,3.944540e-003,1.508764e-002;...
5.000000e+004,2.223862e-002,1.325930e-007,5.187797e-008,...
 4.321347e-003,1.669488e-002,1.222144e-003,...
 2.078445e-002,1.325930e-007,3.325276e-003,1.745904e-002,...
 2.088161e-002,1.325862e-007,3.330920e-003,1.635402e-002;...
6.300000e+004,2.281501e-002,1.046947e-007,3.267638e-008,...
 3.570078e-003,1.789324e-002,1.351443e-003,...
 2.078445e-002,1.325930e-007,3.325276e-003,1.745904e-002,...
 2.171775e-002,1.046980e-007,2.785714e-003,1.760263e-002;...
8.000000e+004,2.351798e-002,8.208727e-008,2.026495e-008,...
 2.930520e-003,1.910251e-002,1.484952e-003,...
 2.078445e-002,1.325930e-007,3.325276e-003,1.745904e-002,...
 2.263362e-002,8.209052e-008,2.309483e-003,1.885848e-002;...
1.000000e+005,2.417710e-002,6.546671e-008,1.296949e-008,...
 2.435669e-003,2.013789e-002,1.603352e-003,...
 2.078445e-002,1.325930e-007,3.325276e-003,1.745904e-002,...
 2.345230e-002,6.546551e-008,1.933563e-003,1.993218e-002;...
1.250000e+005,2.476762e-002,5.225942e-008,8.300623e-009,...
 2.017925e-003,2.103877e-002,1.710977e-003,...
 2.078445e-002,1.325930e-007,3.325276e-003,1.745904e-002,...
 2.417977e-002,5.225747e-008,1.615770e-003,2.086713e-002;...
 ];
zr = interp1q(za(:,1),za(:,flag),e);
