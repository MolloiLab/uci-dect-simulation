 
function zr =z26(flag,e)

za = [9.808000e-001,9.517930e+003,9.513725e+003,4.202718e+000,...
 8.529766e-003,0.000000e+000,0.000000e+000,...
 8.984604e+003,9.027482e+003,2.319500e-005,0.000000e+000,...
 9.488374e+003,9.488374e+003,2.215771e-005,0.000000e+000;...
1.000000e+000,9.024710e+003,9.020397e+003,4.247468e+000,...
 8.784031e-003,0.000000e+000,0.000000e+000,...
 8.984604e+003,9.027482e+003,2.319500e-005,0.000000e+000,...
 8.996951e+003,8.996951e+003,2.321564e-005,0.000000e+000;...
1.100000e+000,7.201825e+003,7.197404e+003,4.364465e+000,...
 1.008027e-002,0.000000e+000,0.000000e+000,...
 7.172590e+003,7.203694e+003,2.908395e-005,0.000000e+000,...
 7.180363e+003,7.180363e+003,2.937862e-005,0.000000e+000;...
1.172600e+000,6.236952e+003,6.232531e+003,4.389482e+000,...
 1.106671e-002,0.000000e+000,0.000000e+000,...
 6.166914e+003,6.191995e+003,3.384885e-005,0.000000e+000,...
 6.218637e+003,6.218637e+003,3.411548e-005,0.000000e+000;...
1.235400e+000,5.470273e+003,5.465852e+003,4.411263e+000,...
 1.191965e-002,0.000000e+000,0.000000e+000,...
 5.433937e+003,5.454909e+003,3.831131e-005,0.000000e+000,...
 5.454308e+003,5.454308e+003,3.828615e-005,0.000000e+000;...
1.250000e+000,5.299469e+003,5.295047e+003,4.416224e+000,...
 1.210297e-002,0.000000e+000,0.000000e+000,...
 5.279234e+003,5.299371e+003,3.930448e-005,0.000000e+000,...
 5.284023e+003,5.284023e+003,3.938227e-005,0.000000e+000;...
1.400000e+000,4.009053e+003,4.004632e+003,4.363387e+000,...
 1.401589e-002,0.000000e+000,0.000000e+000,...
 3.995433e+003,4.009034e+003,5.031033e-005,0.000000e+000,...
 3.997152e+003,3.997152e+003,5.090624e-005,0.000000e+000;...
1.496700e+000,3.405954e+003,3.401641e+003,4.314000e+000,...
 1.528291e-002,0.000000e+000,0.000000e+000,...
 3.390306e+003,3.401099e+003,5.818950e-005,0.000000e+000,...
 3.395668e+003,3.395668e+003,5.861681e-005,0.000000e+000;...
1.500000e+000,3.388593e+003,3.384280e+003,4.312383e+000,...
 1.532604e-002,0.000000e+000,0.000000e+000,...
 3.371995e+003,3.382706e+003,5.846934e-005,0.000000e+000,...
 3.378376e+003,3.378376e+003,5.888748e-005,0.000000e+000;...
1.577300e+000,2.998137e+003,2.993931e+003,4.272809e+000,...
 1.624260e-002,0.000000e+000,0.000000e+000,...
 2.974892e+003,2.983877e+003,6.523293e-005,0.000000e+000,...
 2.988890e+003,2.988890e+003,6.588345e-005,0.000000e+000;...
1.600000e+000,2.883512e+003,2.879199e+003,4.258898e+000,...
 1.651218e-002,0.000000e+000,0.000000e+000,...
 2.870759e+003,2.879307e+003,6.729537e-005,0.000000e+000,...
 2.874492e+003,2.874492e+003,6.794911e-005,0.000000e+000;...
1.611900e+000,2.833047e+003,2.828842e+003,4.250380e+000,...
 1.665452e-002,0.000000e+000,0.000000e+000,...
 2.818196e+003,2.826525e+003,6.839045e-005,0.000000e+000,...
 2.824040e+003,2.824040e+003,6.903427e-005,0.000000e+000;...
1.697100e+000,2.511926e+003,2.507721e+003,4.189131e+000,...
 1.767999e-002,0.000000e+000,0.000000e+000,...
 2.466297e+003,2.473219e+003,7.616399e-005,0.000000e+000,...
 2.503785e+003,2.503785e+003,7.689161e-005,0.000000e+000;...
1.800000e+000,2.124705e+003,2.120499e+003,4.107827e+000,...
 1.891897e-002,0.000000e+000,0.000000e+000,...
 2.117583e+003,2.123185e+003,8.574909e-005,0.000000e+000,...
 2.117447e+003,2.117447e+003,8.645190e-005,0.000000e+000;...
1.897400e+000,1.878526e+003,1.874536e+003,4.028247e+000,...
 2.010619e-002,0.000000e+000,0.000000e+000,...
 1.847433e+003,1.852070e+003,9.534883e-005,0.000000e+000,...
 1.871938e+003,1.871938e+003,9.562836e-005,0.000000e+000;...
1.933600e+000,1.787085e+003,1.783095e+003,3.998702e+000,...
 2.050732e-002,0.000000e+000,0.000000e+000,...
 1.759185e+003,1.763517e+003,9.904739e-005,0.000000e+000,...
 1.780670e+003,1.780670e+003,9.990038e-005,0.000000e+000;...
2.000000e+000,1.619731e+003,1.615742e+003,3.943061e+000,...
 2.123411e-002,0.000000e+000,0.000000e+000,...
 1.611883e+003,1.615720e+003,1.060158e-004,0.000000e+000,...
 1.613602e+003,1.613602e+003,1.078867e-004,0.000000e+000;...
2.097600e+000,1.445261e+003,1.441379e+003,3.860139e+000,...
 2.230487e-002,0.000000e+000,0.000000e+000,...
 1.423180e+003,1.426410e+003,1.166914e-004,0.000000e+000,...
 1.439530e+003,1.439530e+003,1.196803e-004,0.000000e+000;...
2.200000e+000,1.262595e+003,1.258821e+003,3.775060e+000,...
 2.342739e-002,0.000000e+000,0.000000e+000,...
 1.256506e+003,1.259224e+003,1.284464e-004,0.000000e+000,...
 1.257245e+003,1.257245e+003,1.320629e-004,0.000000e+000;...
2.345200e+000,1.076252e+003,1.072575e+003,3.659141e+000,...
 2.502545e-002,0.000000e+000,0.000000e+000,...
 1.062163e+003,1.064318e+003,1.458668e-004,0.000000e+000,...
 1.071368e+003,1.071368e+003,1.496905e-004,0.000000e+000;...
2.500000e+000,8.995165e+002,8.959581e+002,3.534489e+000,...
 2.672810e-002,0.000000e+000,0.000000e+000,...
 8.958750e+002,8.975801e+002,1.650943e-004,0.000000e+000,...
 8.949962e+002,8.949962e+002,1.685039e-004,0.000000e+000;...
2.645800e+000,7.858840e+002,7.824334e+002,3.421589e+000,...
 2.833802e-002,0.000000e+000,0.000000e+000,...
 7.703231e+002,7.717083e+002,1.842547e-004,0.000000e+000,...
 7.816434e+002,7.816434e+002,1.862859e-004,0.000000e+000;...
2.800000e+000,6.658141e+002,6.624713e+002,3.306426e+000,...
 3.004175e-002,0.000000e+000,0.000000e+000,...
 6.624279e+002,6.635532e+002,2.056243e-004,0.000000e+000,...
 6.618528e+002,6.618528e+002,2.051417e-004,0.000000e+000;...
2.818200e+000,6.557103e+002,6.523891e+002,3.293486e+000,...
 3.023369e-002,0.000000e+000,0.000000e+000,...
 6.510927e+002,6.521917e+002,2.082213e-004,0.000000e+000,...
 6.517652e+002,6.517652e+002,2.079267e-004,0.000000e+000;...
2.993300e+000,5.586623e+002,5.554705e+002,3.169265e+000,...
 3.203555e-002,0.000000e+000,0.000000e+000,...
 5.545026e+002,5.553836e+002,2.340112e-004,0.000000e+000,...
 5.549605e+002,5.549605e+002,2.368638e-004,0.000000e+000;...
3.000000e+000,5.555244e+002,5.523326e+002,3.164520e+000,...
 3.210456e-002,0.000000e+000,0.000000e+000,...
 5.512097e+002,5.520836e+002,2.350269e-004,0.000000e+000,...
 5.518584e+002,5.518584e+002,2.379688e-004,0.000000e+000;...
3.200000e+000,4.668441e+002,4.637924e+002,3.022830e+000,...
 3.416306e-002,0.000000e+000,0.000000e+000,...
 4.632907e+002,4.639792e+002,2.658840e-004,0.000000e+000,...
 4.633922e+002,4.633922e+002,2.709312e-004,0.000000e+000;...
3.319900e+000,4.260084e+002,4.230323e+002,2.942819e+000,...
 3.539233e-002,0.000000e+000,0.000000e+000,...
 4.196063e+002,4.202072e+002,2.849116e-004,0.000000e+000,...
 4.227094e+002,4.227094e+002,2.906290e-004,0.000000e+000;...
3.402400e+000,3.979508e+002,3.950178e+002,2.888580e+000,...
 3.623773e-002,0.000000e+000,0.000000e+000,...
 3.927706e+002,3.933194e+002,2.983606e-004,0.000000e+000,...
 3.947295e+002,3.947295e+002,3.041489e-004,0.000000e+000;...
3.500000e+000,3.667984e+002,3.639408e+002,2.824313e+000,...
 3.723840e-002,0.000000e+000,0.000000e+000,...
 3.635488e+002,3.640424e+002,3.146453e-004,0.000000e+000,...
 3.636562e+002,3.636562e+002,3.201422e-004,0.000000e+000;...
3.510600e+000,3.641888e+002,3.613313e+002,2.817735e+000,...
 3.734731e-002,0.000000e+000,0.000000e+000,...
 3.605632e+002,3.610514e+002,3.164383e-004,0.000000e+000,...
 3.610604e+002,3.610604e+002,3.218852e-004,0.000000e+000;...
3.741700e+000,3.075775e+002,3.048602e+002,2.675398e+000,...
 3.970665e-002,0.000000e+000,0.000000e+000,...
 3.030267e+002,3.034115e+002,3.567101e-004,0.000000e+000,...
 3.046486e+002,3.046486e+002,3.595801e-004,0.000000e+000;...
3.854800e+000,2.845556e+002,2.819137e+002,2.606817e+000,...
 4.086153e-002,0.000000e+000,0.000000e+000,...
 2.793919e+002,2.797362e+002,3.772393e-004,0.000000e+000,...
 2.817180e+002,2.817180e+002,3.780224e-004,0.000000e+000;...
4.000000e+000,2.550098e+002,2.524435e+002,2.519798e+000,...
 4.221588e-002,0.000000e+000,0.000000e+000,...
 2.525943e+002,2.528942e+002,4.043813e-004,0.000000e+000,...
 2.522765e+002,2.522765e+002,4.092583e-004,0.000000e+000;...
4.008400e+000,2.537482e+002,2.511818e+002,2.515053e+000,...
 4.229352e-002,0.000000e+000,0.000000e+000,...
 2.511467e+002,2.514442e+002,4.059781e-004,0.000000e+000,...
 2.510223e+002,2.510223e+002,4.110304e-004,0.000000e+000;...
4.472100e+000,1.888231e+002,1.865155e+002,2.254318e+000,...
 4.657981e-002,0.000000e+000,0.000000e+000,...
 1.860639e+002,1.862612e+002,4.950167e-004,0.000000e+000,...
 1.864124e+002,1.864096e+002,5.093812e-004,0.000000e+000;...
4.500000e+000,1.853617e+002,1.830757e+002,2.238898e+000,...
 4.683753e-002,0.000000e+000,0.000000e+000,...
 1.828901e+002,1.830829e+002,5.006250e-004,0.000000e+000,...
 1.829650e+002,1.829650e+002,5.152259e-004,0.000000e+000;...
5.000000e+000,1.388110e+002,1.367838e+002,1.977084e+000,...
 5.139771e-002,0.000000e+000,0.000000e+000,...
 1.366491e+002,1.367784e+002,6.058989e-004,0.000000e+000,...
 1.367081e+002,1.367081e+002,6.191008e-004,0.000000e+000;...
5.500000e+000,1.064239e+002,1.046361e+002,1.731444e+000,...
 5.581878e-002,0.000000e+000,0.000000e+000,...
 1.048293e+002,1.049191e+002,7.183290e-004,0.000000e+000,...
 1.045859e+002,1.045859e+002,7.261874e-004,0.000000e+000;...
5.886400e+000,8.895097e+001,8.734644e+001,1.544897e+000,...
 5.883051e-002,0.000000e+000,0.000000e+000,...
 8.678986e+001,8.685914e+001,8.074562e-004,0.000000e+000,...
 8.730836e+001,8.730836e+001,8.263948e-004,0.000000e+000;...
6.000000e+000,8.450186e+001,8.295448e+001,1.487423e+000,...
 5.971580e-002,0.000000e+000,0.000000e+000,...
 8.229609e+001,8.236045e+001,8.342744e-004,0.000000e+000,...
 8.291846e+001,8.291846e+001,8.555372e-004,0.000000e+000;...
6.300000e+000,7.302755e+001,7.164623e+001,1.319422e+000,...
 6.205358e-002,0.000000e+000,0.000000e+000,...
 7.180542e+001,7.185868e+001,9.068351e-004,0.000000e+000,...
 7.161806e+001,7.161604e+001,9.318391e-004,0.000000e+000;...
6.630100e+000,6.396542e+001,6.278036e+001,1.121120e+000,...
 6.455957e-002,0.000000e+000,0.000000e+000,...
 6.225391e+001,6.229755e+001,9.895558e-004,0.000000e+000,...
 6.275595e+001,6.275403e+001,1.013841e-003,0.000000e+000;...
6.640800e+000,6.366997e+001,6.249353e+001,1.111739e+000,...
 6.464045e-002,0.000000e+000,0.000000e+000,...
 6.197398e+001,6.201734e+001,9.922870e-004,0.000000e+000,...
 6.246933e+001,6.246933e+001,1.016396e-003,0.000000e+000;...
6.882900e+000,5.737694e+001,5.643450e+001,8.759338e-001,...
 6.647789e-002,0.000000e+000,0.000000e+000,...
 5.607182e+001,5.610949e+001,1.054919e-003,0.000000e+000,...
 5.641380e+001,5.641196e+001,1.075947e-003,0.000000e+000;...
6.960300e+000,5.530011e+001,5.449677e+001,7.367993e-001,...
 6.706449e-002,0.000000e+000,0.000000e+000,...
 5.434643e+001,5.438246e+001,1.075277e-003,0.000000e+000,...
 5.447638e+001,5.447638e+001,1.094856e-003,0.000000e+000;...
6.995200e+000,5.434581e+001,5.362442e+001,6.540821e-001,...
 6.732976e-002,0.000000e+000,0.000000e+000,...
 5.359196e+001,5.362729e+001,1.084510e-003,0.000000e+000,...
 5.360546e+001,5.360365e+001,1.103318e-003,0.000000e+000;...
7.000000e+000,5.421210e+001,5.350257e+001,6.425765e-001,...
 6.736641e-002,0.000000e+000,0.000000e+000,...
 5.348933e+001,5.352457e+001,1.085781e-003,0.000000e+000,...
 5.348344e+001,5.348162e+001,1.104521e-003,0.000000e+000;...
7.067400e+000,5.284264e+001,5.220860e+001,5.667388e-001,...
 6.786998e-002,0.000000e+000,0.000000e+000,...
 5.207574e+001,5.210966e+001,1.103712e-003,0.000000e+000,...
 5.218989e+001,5.218810e+001,1.120889e-003,0.000000e+000;...
7.083400e+000,5.256767e+001,5.191098e+001,5.890598e-001,...
 6.798860e-002,0.000000e+000,0.000000e+000,...
 5.174561e+001,5.177922e+001,1.107987e-003,0.000000e+000,...
 5.189271e+001,5.189091e+001,1.124721e-003,0.000000e+000;...
7.083400e+000,4.105454e+002,4.098877e+002,5.890598e-001,...
 6.798860e-002,0.000000e+000,0.000000e+000,...
 4.094694e+002,4.097430e+002,1.108014e-003,0.000000e+000,...
 2.970523e+002,2.970523e+002,1.124721e-003,0.000000e+000;...
7.121800e+000,4.060381e+002,4.052833e+002,6.799507e-001,...
 6.827543e-002,0.000000e+000,0.000000e+000,...
 4.039223e+002,4.041907e+002,1.118274e-003,0.000000e+000,...
 2.943093e+002,2.943093e+002,1.133922e-003,0.000000e+000;...
7.155600e+000,4.021023e+002,4.012289e+002,8.012500e-001,...
 6.852776e-002,0.000000e+000,0.000000e+000,...
 3.991136e+002,3.993776e+002,1.127361e-003,0.000000e+000,...
 2.918542e+002,2.918542e+002,1.142126e-003,0.000000e+000;...
7.276900e+000,3.878362e+002,3.866824e+002,1.082948e+000,...
 6.943246e-002,0.000000e+000,0.000000e+000,...
 3.824995e+002,3.827481e+002,1.160224e-003,0.000000e+000,...
 2.829577e+002,2.829577e+002,1.171204e-003,0.000000e+000;...
7.593900e+000,3.502786e+002,3.489200e+002,1.295160e+000,...
 7.155243e-002,0.000000e+000,0.000000e+000,...
 3.433911e+002,3.436048e+002,1.244167e-003,0.000000e+000,...
 2.590880e+002,2.590880e+002,1.258814e-003,0.000000e+000;...
8.000000e+000,3.026173e+002,3.011723e+002,1.370965e+000,...
 7.415546e-002,0.000000e+000,0.000000e+000,...
 3.009949e+002,3.011724e+002,1.353168e-003,0.000000e+000,...
 2.274257e+002,2.274098e+002,1.374555e-003,0.000000e+000;...
9.000000e+000,2.249465e+002,2.235016e+002,1.363632e+000,...
 8.036222e-002,0.000000e+000,0.000000e+000,...
 2.233954e+002,2.235117e+002,1.634185e-003,0.000000e+000,...
 1.745971e+002,1.745830e+002,1.647052e-003,0.000000e+000;...
9.486800e+000,1.974927e+002,1.960801e+002,1.331067e+000,...
 8.315505e-002,0.000000e+000,0.000000e+000,...
 1.944589e+002,1.945545e+002,1.775392e-003,0.000000e+000,...
 1.553165e+002,1.553165e+002,1.781013e-003,0.000000e+000;...
9.832001e+000,1.790428e+002,1.776518e+002,1.299796e+000,...
 8.500220e-002,0.000000e+000,0.000000e+000,...
 1.765393e+002,1.766227e+002,1.878088e-003,0.000000e+000,...
 1.419969e+002,1.419969e+002,1.879428e-003,0.000000e+000;...
1.000000e+001,1.700605e+002,1.686910e+002,1.282975e+000,...
 8.590151e-002,0.000000e+000,0.000000e+000,...
 1.686312e+002,1.687094e+002,1.928823e-003,0.000000e+000,...
 1.353950e+002,1.353950e+002,1.926721e-003,0.000000e+000;...
1.048800e+001,1.512979e+002,1.499715e+002,1.234774e+000,...
 8.806137e-002,0.000000e+000,0.000000e+000,...
 1.482289e+002,1.482939e+002,2.055324e-003,0.000000e+000,...
 1.217207e+002,1.217207e+002,2.081070e-003,0.000000e+000;...
1.060300e+001,1.468876e+002,1.455828e+002,1.222158e+000,...
 8.856817e-002,0.000000e+000,0.000000e+000,...
 1.439178e+002,1.439802e+002,2.085424e-003,0.000000e+000,...
 1.184433e+002,1.184409e+002,2.116471e-003,0.000000e+000;...
1.100000e+001,1.316079e+002,1.303355e+002,1.182800e+000,...
 9.032691e-002,0.000000e+000,0.000000e+000,...
 1.302890e+002,1.303430e+002,2.190169e-003,0.000000e+000,...
 1.069100e+002,1.069077e+002,2.238091e-003,0.000000e+000;...
1.130600e+001,1.228951e+002,1.216551e+002,1.150558e+000,...
 9.161009e-002,0.000000e+000,0.000000e+000,...
 1.209495e+002,1.209980e+002,2.271771e-003,0.000000e+000,...
 1.003646e+002,1.003623e+002,2.328038e-003,0.000000e+000;...
1.191200e+001,1.067011e+002,1.055128e+002,1.093731e+000,...
 9.415490e-002,0.000000e+000,0.000000e+000,...
 1.049794e+002,1.050189e+002,2.435545e-003,0.000000e+000,...
 8.797369e+001,8.797049e+001,2.502263e-003,0.000000e+000;...
1.250000e+001,9.328363e+001,9.214816e+001,1.038780e+000,...
 9.662316e-002,0.000000e+000,0.000000e+000,...
 9.211958e+001,9.215200e+001,2.597131e-003,0.000000e+000,...
 7.753924e+001,7.753721e+001,2.666396e-003,0.000000e+000;...
1.322900e+001,8.133918e+001,8.026194e+001,9.773921e-001,...
 9.954646e-002,0.000000e+000,0.000000e+000,...
 7.899216e+001,7.901774e+001,2.792652e-003,0.000000e+000,...
 6.822147e+001,6.821859e+001,2.860361e-003,0.000000e+000;...
1.340700e+001,7.843097e+001,7.736884e+001,9.621447e-001,...
 1.001934e-001,0.000000e+000,0.000000e+000,...
 7.617979e+001,7.620394e+001,2.838938e-003,0.000000e+000,...
 6.591566e+001,6.591282e+001,2.911618e-003,0.000000e+000;...
1.400000e+001,6.877577e+001,6.775677e+001,9.167694e-001,...
 1.020018e-001,0.000000e+000,0.000000e+000,...
 6.774174e+001,6.776173e+001,2.994153e-003,0.000000e+000,...
 5.814344e+001,5.813981e+001,3.099441e-003,0.000000e+000;...
1.496700e+001,5.753006e+001,5.657576e+001,8.500220e-001,...
 1.047957e-001,0.000000e+000,0.000000e+000,...
 5.651701e+001,5.653170e+001,3.250499e-003,0.000000e+000,...
 4.905212e+001,4.904873e+001,3.387267e-003,0.000000e+000;...
1.526000e+001,5.470165e+001,5.376460e+001,8.310652e-001,...
 1.056422e-001,0.000000e+000,0.000000e+000,...
 5.351669e+001,5.353002e+001,3.328938e-003,0.000000e+000,...
 4.675290e+001,4.674957e+001,3.471534e-003,0.000000e+000;...
1.600000e+001,4.771204e+001,4.682135e+001,7.835333e-001,...
 1.077826e-001,0.000000e+000,0.000000e+000,...
 4.681233e+001,4.682270e+001,3.528578e-003,0.000000e+000,...
 4.099488e+001,4.099171e+001,3.679276e-003,0.000000e+000;...
1.688800e+001,4.172525e+001,4.088309e+001,7.326801e-001,...
 1.100417e-001,0.000000e+000,0.000000e+000,...
 4.018427e+001,4.019180e+001,3.770957e-003,0.000000e+000,...
 3.606136e+001,3.605760e+001,3.908070e-003,0.000000e+000;...
1.732100e+001,3.882891e+001,3.800724e+001,7.099925e-001,...
 1.111308e-001,0.000000e+000,0.000000e+000,...
 3.740938e+001,3.741575e+001,3.890207e-003,0.000000e+000,...
 3.363626e+001,3.363186e+001,4.033418e-003,0.000000e+000;...
1.800000e+001,3.433774e+001,3.355058e+001,6.743974e-001,...
 1.126296e-001,0.000000e+000,0.000000e+000,...
 3.354725e+001,3.355204e+001,4.061165e-003,0.000000e+000,...
 2.983871e+001,2.983448e+001,4.260717e-003,0.000000e+000;...
1.897400e+001,3.006116e+001,2.931713e+001,6.294642e-001,...
 1.144843e-001,0.000000e+000,0.000000e+000,...
 2.889367e+001,2.889660e+001,4.307727e-003,0.000000e+000,...
 2.623806e+001,2.623338e+001,4.560604e-003,0.000000e+000;...
2.000000e+001,2.559048e+001,2.488958e+001,5.847251e-001,...
 1.164468e-001,0.000000e+000,0.000000e+000,...
 2.488824e+001,2.488958e+001,4.569081e-003,0.000000e+000,...
 2.240856e+001,2.240348e+001,4.860490e-003,0.000000e+000;...
2.094100e+001,2.278364e+001,2.211724e+001,5.483860e-001,...
 1.181290e-001,0.000000e+000,0.000000e+000,...
 2.184717e+001,2.184731e+001,4.810182e-003,0.000000e+000,...
 2.001220e+001,2.000735e+001,5.117368e-003,0.000000e+000;...
2.097600e+001,2.267797e+001,2.201265e+001,5.471027e-001,...
 1.181937e-001,0.000000e+000,0.000000e+000,...
 2.174400e+001,2.174410e+001,4.819175e-003,0.000000e+000,...
 1.992068e+001,1.991523e+001,5.127115e-003,0.000000e+000;...
2.200000e+001,1.962419e+001,1.899337e+001,5.104402e-001,...
 1.200160e-001,0.000000e+000,0.000000e+000,...
 1.899620e+001,1.899522e+001,5.083058e-003,0.000000e+000,...
 1.727319e+001,1.726799e+001,5.393528e-003,0.000000e+000;...
2.345200e+001,1.652835e+001,1.593960e+001,4.660138e-001,...
 1.220648e-001,0.000000e+000,0.000000e+000,...
 1.584885e+001,1.584660e+001,5.459722e-003,0.000000e+000,...
 1.458564e+001,1.457969e+001,5.727250e-003,0.000000e+000;...
2.388200e+001,1.563444e+001,1.505862e+001,4.535161e-001,...
 1.226795e-001,0.000000e+000,0.000000e+000,...
 1.505343e+001,1.505085e+001,5.571807e-003,0.000000e+000,...
 1.380241e+001,1.379656e+001,5.857051e-003,0.000000e+000;...
2.500000e+001,1.370749e+001,1.316187e+001,4.210158e-001,...
 1.242538e-001,0.000000e+000,0.000000e+000,...
 1.316623e+001,1.316290e+001,5.831285e-003,0.000000e+000,...
 1.211430e+001,1.210820e+001,6.206248e-003,0.000000e+000;...
2.645800e+001,1.186250e+001,1.134923e+001,3.868226e-001,...
 1.257742e-001,0.000000e+000,0.000000e+000,...
 1.115310e+001,1.114893e+001,6.169584e-003,0.000000e+000,...
 1.049679e+001,1.049007e+001,6.608736e-003,0.000000e+000;...
2.800000e+001,9.922621e+000,9.443419e+000,3.517990e-001,...
 1.273917e-001,0.000000e+000,0.000000e+000,...
 9.449049e+000,9.444123e+000,6.527271e-003,0.000000e+000,...
 8.774810e+000,8.768006e+000,7.005878e-003,0.000000e+000;...
2.803000e+001,9.895986e+000,9.417324e+000,3.511952e-001,...
 1.274133e-001,0.000000e+000,0.000000e+000,...
 9.419476e+000,9.414536e+000,6.534232e-003,0.000000e+000,...
 8.751372e+000,8.744576e+000,7.012879e-003,0.000000e+000;...
2.956400e+001,8.537745e+000,8.087227e+000,3.218220e-001,...
 1.286749e-001,0.000000e+000,0.000000e+000,...
 8.059516e+000,8.053920e+000,6.889962e-003,0.000000e+000,...
 7.546385e+000,7.539083e+000,7.362956e-003,0.000000e+000;...
3.000000e+001,8.165081e+000,7.721248e+000,3.147698e-001,...
 1.290307e-001,0.000000e+000,0.000000e+000,...
 7.721562e+000,7.715792e+000,6.991051e-003,0.000000e+000,...
 7.213191e+000,7.205571e+000,7.457878e-003,0.000000e+000;...
3.200000e+001,6.795949e+000,6.382848e+000,2.824421e-001,...
 1.306698e-001,0.000000e+000,0.000000e+000,...
 6.389678e+000,6.383170e+000,7.454671e-003,0.000000e+000,...
 5.990840e+000,5.982903e+000,7.997444e-003,0.000000e+000;...
3.207700e+001,6.756806e+000,6.344784e+000,2.813206e-001,...
 1.307021e-001,0.000000e+000,0.000000e+000,...
 6.344792e+000,6.338258e+000,7.472520e-003,0.000000e+000,...
 5.956267e+000,5.948349e+000,8.017839e-003,0.000000e+000;...
3.465200e+001,5.456363e+000,5.076581e+000,2.477852e-001,...
 1.319637e-001,0.000000e+000,0.000000e+000,...
 5.059227e+000,5.051851e+000,8.069207e-003,0.000000e+000,...
 4.791646e+000,4.782850e+000,8.674001e-003,0.000000e+000;...
3.500000e+001,5.281245e+000,4.905454e+000,2.437091e-001,...
 1.321255e-001,0.000000e+000,0.000000e+000,...
 4.913173e+000,4.905698e+000,8.140284e-003,0.000000e+000,...
 4.632969e+000,4.624260e+000,8.756486e-003,0.000000e+000;...
3.722400e+001,4.455798e+000,4.101357e+000,2.212910e-001,...
 1.331175e-001,0.000000e+000,0.000000e+000,...
 4.101607e+000,4.093537e+000,8.592427e-003,0.000000e+000,...
 3.889434e+000,3.880222e+000,9.252418e-003,0.000000e+000;...
3.885800e+001,3.970019e+000,3.631321e+000,2.048252e-001,...
 1.338400e-001,0.000000e+000,0.000000e+000,...
 3.616685e+000,3.608203e+000,8.922509e-003,0.000000e+000,...
 3.453303e+000,3.443825e+000,9.588915e-003,0.000000e+000;...
4.000000e+001,3.643182e+000,3.313866e+000,1.949910e-001,...
 1.343468e-001,0.000000e+000,0.000000e+000,...
 3.322647e+000,3.313888e+000,9.152186e-003,0.000000e+000,...
 3.157417e+000,3.147606e+000,9.812040e-003,0.000000e+000;...
4.224900e+001,3.129259e+000,2.816873e+000,1.776841e-001,...
 1.347458e-001,0.000000e+000,0.000000e+000,...
 2.817775e+000,2.808488e+000,9.602187e-003,0.000000e+000,...
 2.693401e+000,2.683120e+000,1.027870e-002,0.000000e+000;...
4.242600e+001,3.089038e+000,2.777838e+000,1.765088e-001,...
 1.347781e-001,0.000000e+000,0.000000e+000,...
 2.782522e+000,2.773195e+000,9.637473e-003,0.000000e+000,...
 2.656750e+000,2.646422e+000,1.032292e-002,0.000000e+000;...
4.500000e+001,2.615120e+000,2.320526e+000,1.594068e-001,...
 1.352310e-001,0.000000e+000,0.000000e+000,...
 2.330489e+000,2.320585e+000,1.014867e-002,0.000000e+000,...
 2.227923e+000,2.217001e+000,1.093105e-002,0.000000e+000;...
4.743400e+001,2.293245e+000,2.011590e+000,1.462298e-001,...
 1.354575e-001,0.000000e+000,0.000000e+000,...
 1.989187e+000,1.978756e+000,1.062877e-002,0.000000e+000,...
 1.937882e+000,1.926450e+000,1.143522e-002,0.000000e+000;...
5.000000e+001,1.955949e+000,1.687234e+000,1.330205e-001,...
 1.356947e-001,0.000000e+000,0.000000e+000,...
 1.698216e+000,1.687245e+000,1.113164e-002,0.000000e+000,...
 1.631471e+000,1.619533e+000,1.191720e-002,0.000000e+000;...
5.500000e+001,1.512655e+000,1.263673e+000,1.129100e-001,...
 1.361152e-001,0.000000e+000,0.000000e+000,...
 1.275679e+000,1.263750e+000,1.203755e-002,0.000000e+000,...
 1.230263e+000,1.217540e+000,1.273281e-002,0.000000e+000;...
5.886400e+001,1.265075e+000,1.028461e+000,1.008857e-001,...
 1.357594e-001,0.000000e+000,0.000000e+000,...
 1.041203e+000,1.028599e+000,1.268685e-002,0.000000e+000,...
 1.006807e+000,9.933869e-001,1.342732e-002,0.000000e+000;...
6.300000e+001,1.061608e+000,8.370607e-001,8.914831e-002,...
 1.353928e-001,0.000000e+000,0.000000e+000,...
 8.504925e-001,8.371843e-001,1.337127e-002,0.000000e+000,...
 8.245944e-001,8.103826e-001,1.422040e-002,0.000000e+000;...
6.640800e+001,9.421098e-001,7.254555e-001,8.165404e-002,...
 1.349938e-001,0.000000e+000,0.000000e+000,...
 7.274579e-001,7.135813e-001,1.392758e-002,0.000000e+000,...
 7.183065e-001,7.035234e-001,1.478227e-002,0.000000e+000;...
7.000000e+001,8.167669e-001,6.081567e-001,7.404655e-002,...
 1.345625e-001,0.000000e+000,0.000000e+000,...
 6.226964e-001,6.082357e-001,1.450192e-002,0.000000e+000,...
 6.060089e-001,5.907145e-001,1.530643e-002,0.000000e+000;...
7.752100e+001,6.449056e-001,4.493970e-001,6.173008e-002,...
 1.337861e-001,0.000000e+000,0.000000e+000,...
 4.619617e-001,4.463516e-001,1.563747e-002,0.000000e+000,...
 4.539807e-001,4.377455e-001,1.623639e-002,0.000000e+000;...
8.000000e+001,5.975677e-001,4.057146e-001,5.832154e-002,...
 1.335273e-001,0.000000e+000,0.000000e+000,...
 4.216992e-001,4.057179e-001,1.600535e-002,0.000000e+000,...
 4.120364e-001,3.955264e-001,1.649892e-002,0.000000e+000;...
9.000000e+001,4.614957e-001,2.825391e-001,4.711358e-002,...
 1.318451e-001,0.000000e+000,0.000000e+000,...
 2.999295e-001,2.825432e-001,1.740123e-002,0.000000e+000,...
 2.939068e-001,2.762255e-001,1.768126e-002,0.000000e+000;...
1.000000e+002,3.733545e-001,2.044155e-001,3.884832e-002,...
 1.300875e-001,0.000000e+000,0.000000e+000,...
 2.230992e-001,2.044176e-001,1.869128e-002,0.000000e+000,...
 2.189865e-001,2.003175e-001,1.867031e-002,0.000000e+000;...
1.100000e+002,3.127318e-001,1.524840e-001,3.256392e-002,...
 1.276828e-001,0.000000e+000,0.000000e+000,...
 1.718023e-001,1.524921e-001,1.931674e-002,0.000000e+000,...
 1.695223e-001,1.496987e-001,1.982359e-002,0.000000e+000;...
1.218400e+002,2.641324e-001,1.120689e-001,2.688122e-002,...
 1.251812e-001,0.000000e+000,0.000000e+000,...
 1.313690e-001,1.113625e-001,2.001088e-002,0.000000e+000,...
 1.310759e-001,1.102184e-001,2.086060e-002,0.000000e+000;...
1.250000e+002,2.530473e-001,1.029259e-001,2.560558e-002,...
 1.245126e-001,0.000000e+000,0.000000e+000,...
 1.231161e-001,1.029314e-001,2.018864e-002,0.000000e+000,...
 1.223571e-001,1.012700e-001,2.108407e-002,0.000000e+000;...
1.400000e+002,2.150584e-001,7.264367e-002,2.064211e-002,...
 1.217737e-001,0.000000e+000,0.000000e+000,...
 9.363894e-002,7.264683e-002,2.099457e-002,0.000000e+000,...
 9.357198e-002,7.160093e-002,2.196741e-002,0.000000e+000;...
1.496700e+002,1.974064e-001,5.916478e-002,1.822777e-002,...
 1.200160e-001,0.000000e+000,0.000000e+000,...
 8.062039e-002,5.916015e-002,2.146211e-002,0.000000e+000,...
 8.073472e-002,5.836988e-002,2.236484e-002,0.000000e+000;...
1.600000e+002,1.823101e-001,4.818865e-002,1.599243e-002,...
 1.181290e-001,0.000000e+000,0.000000e+000,...
 7.006186e-002,4.818914e-002,2.187414e-002,0.000000e+000,...
 7.061770e-002,4.758224e-002,2.303467e-002,0.000000e+000;...
1.714900e+002,1.690576e-001,3.905751e-002,1.399864e-002,...
 1.160047e-001,0.000000e+000,0.000000e+000,...
 6.124876e-002,3.893918e-002,2.231066e-002,0.000000e+000,...
 6.225893e-002,3.859922e-002,2.365971e-002,0.000000e+000;...
1.800000e+002,1.607331e-001,3.355381e-002,1.275319e-002,...
 1.144304e-001,0.000000e+000,0.000000e+000,...
 5.615931e-002,3.355412e-002,2.260608e-002,0.000000e+000,...
 5.719385e-002,3.317952e-002,2.401434e-002,0.000000e+000;...
1.935200e+002,1.505215e-001,2.716805e-002,1.109043e-002,...
 1.122630e-001,0.000000e+000,0.000000e+000,...
 4.999314e-002,2.693862e-002,2.305518e-002,0.000000e+000,...
 5.137630e-002,2.688583e-002,2.449113e-002,0.000000e+000;...
2.000000e+002,1.460357e-001,2.440650e-002,1.040592e-002,...
 1.112278e-001,0.000000e+000,0.000000e+000,...
 4.766839e-002,2.440661e-002,2.326236e-002,0.000000e+000,...
 4.882525e-002,2.416116e-002,2.466408e-002,0.000000e+000;...
2.200000e+002,1.352310e-001,1.835502e-002,8.652369e-003,...
 1.082193e-001,0.000000e+000,0.000000e+000,...
 4.214680e-002,1.835567e-002,2.379152e-002,0.000000e+000,...
 4.341042e-002,1.818759e-002,2.522283e-002,0.000000e+000;...
2.345200e+002,1.288905e-001,1.516321e-002,7.659676e-003,...
 1.060670e-001,0.000000e+000,0.000000e+000,...
 3.931692e-002,1.516414e-002,2.415309e-002,0.000000e+000,...
 4.075738e-002,1.503349e-002,2.572443e-002,0.000000e+000;...
2.500000e+002,1.230461e-001,1.252782e-002,6.747964e-003,...
 1.037724e-001,0.000000e+000,0.000000e+000,...
 3.701936e-002,1.252734e-002,2.449225e-002,0.000000e+000,...
 3.851562e-002,1.242672e-002,2.608839e-002,0.000000e+000;...
2.710800e+002,1.168782e-001,9.997671e-003,5.768318e-003,...
 1.011100e-001,0.000000e+000,0.000000e+000,...
 3.475436e-002,9.835438e-003,2.491909e-002,0.000000e+000,...
 3.639943e-002,9.923710e-003,2.647619e-002,0.000000e+000;...
2.800000e+002,1.143226e-001,8.928417e-003,5.408485e-003,...
 9.998317e-002,0.000000e+000,0.000000e+000,...
 3.402016e-002,8.928429e-003,2.509188e-002,0.000000e+000,...
 3.543987e-002,8.864164e-003,2.657571e-002,0.000000e+000;...
2.993300e+002,1.099662e-001,7.320547e-003,4.757617e-003,...
 9.788693e-002,0.000000e+000,0.000000e+000,...
 3.272576e-002,7.313680e-003,2.541220e-002,0.000000e+000,...
 3.404861e-002,7.271341e-003,2.677769e-002,0.000000e+000;...
3.200000e+002,1.058309e-001,6.058061e-003,4.162713e-003,...
 9.560955e-002,0.000000e+000,0.000000e+000,...
 3.178808e-002,6.058025e-003,2.573015e-002,0.000000e+000,...
 3.296966e-002,6.019812e-003,2.694985e-002,0.000000e+000;...
3.500000e+002,1.006075e-001,4.707476e-003,3.490062e-003,...
 9.241019e-002,0.000000e+000,0.000000e+000,...
 3.087050e-002,4.707479e-003,2.616309e-002,0.000000e+000,...
 3.204144e-002,4.680504e-003,2.736130e-002,0.000000e+000;...
3.841400e+002,9.583815e-002,3.642967e-003,2.905186e-003,...
 8.928957e-002,0.000000e+000,0.000000e+000,...
 3.019060e-002,3.622556e-003,2.656808e-002,0.000000e+000,...
 3.126308e-002,3.623809e-003,2.763927e-002,0.000000e+000;...
4.000000e+002,9.375485e-002,3.232669e-003,2.682084e-003,...
 8.784031e-002,0.000000e+000,0.000000e+000,...
 2.997526e-002,3.232659e-003,2.674264e-002,0.000000e+000,...
 3.088805e-002,3.216281e-003,2.767177e-002,0.000000e+000;...
4.410200e+002,8.936181e-002,2.462647e-003,2.212048e-003,...
 8.468733e-002,0.000000e+000,0.000000e+000,...
 2.962869e-002,2.460146e-003,2.716857e-002,0.000000e+000,...
 3.017631e-002,2.451454e-003,2.772454e-002,0.000000e+000;...
4.500000e+002,8.845711e-002,2.334867e-003,2.124920e-003,...
 8.399721e-002,0.000000e+000,0.000000e+000,...
 2.957203e-002,2.334880e-003,2.723718e-002,0.000000e+000,...
 3.002286e-002,2.324415e-003,2.769847e-002,0.000000e+000;...
4.869200e+002,8.515748e-002,1.922737e-003,1.817709e-003,...
 8.141681e-002,0.000000e+000,0.000000e+000,...
 2.940515e-002,1.903183e-003,2.750199e-002,0.000000e+000,...
 2.962174e-002,1.914785e-003,2.770730e-002,0.000000e+000;...
5.000000e+002,8.399398e-002,1.776734e-003,1.724651e-003,...
 8.049271e-002,0.000000e+000,0.000000e+000,...
 2.936836e-002,1.776777e-003,2.759160e-002,0.000000e+000,...
 2.953010e-002,1.769622e-003,2.776226e-002,0.000000e+000;...
5.477200e+002,8.024361e-002,1.405579e-003,1.440516e-003,...
 7.739795e-002,0.000000e+000,0.000000e+000,...
 2.885225e-002,1.403107e-003,2.744915e-002,0.000000e+000,...
 2.924586e-002,1.400407e-003,2.784536e-002,0.000000e+000;...
5.500000e+002,8.006569e-002,1.388218e-003,1.427468e-003,...
 7.725022e-002,0.000000e+000,0.000000e+000,...
 2.883086e-002,1.388194e-003,2.744268e-002,0.000000e+000,...
 2.922622e-002,1.383079e-003,2.784307e-002,0.000000e+000;...
6.000000e+002,7.681566e-002,1.111523e-003,1.200915e-003,...
 7.450376e-002,0.000000e+000,0.000000e+000,...
 2.841721e-002,1.109787e-003,2.730744e-002,0.000000e+000,...
 2.892430e-002,1.107781e-003,2.781729e-002,0.000000e+000;...
6.300000e+002,7.493401e-002,9.894260e-004,1.089849e-003,...
 7.285503e-002,0.000000e+000,0.000000e+000,...
 2.819543e-002,9.894306e-004,2.720601e-002,0.000000e+000,...
 2.867988e-002,9.862679e-004,2.769412e-002,0.000000e+000;...
7.000000e+002,7.127421e-002,7.722218e-004,8.837515e-004,...
 6.961793e-002,0.000000e+000,0.000000e+000,...
 2.776050e-002,7.722204e-004,2.698828e-002,0.000000e+000,...
 2.817773e-002,7.700025e-004,2.740666e-002,0.000000e+000;...
7.804300e+002,6.774490e-002,6.056767e-004,7.124511e-004,...
 6.642721e-002,0.000000e+000,0.000000e+000,...
 2.736426e-002,5.989192e-004,2.676534e-002,0.000000e+000,...
 2.758943e-002,6.041068e-004,2.698570e-002,0.000000e+000;...
8.000000e+002,6.689627e-002,5.652723e-004,6.773628e-004,...
 6.565406e-002,0.000000e+000,0.000000e+000,...
 2.728011e-002,5.652713e-004,2.671484e-002,0.000000e+000,...
 2.748762e-002,5.638493e-004,2.692405e-002,0.000000e+000;...
9.000000e+002,6.307258e-002,4.396599e-004,5.356080e-004,...
 6.209779e-002,0.000000e+000,0.000000e+000,...
 2.683537e-002,4.396646e-004,2.639571e-002,0.000000e+000,...
 2.696639e-002,4.386730e-004,2.652753e-002,0.000000e+000;...
1.022000e+003,5.920899e-002,3.364655e-004,4.156567e-004,...
 5.845741e-002,0.000000e+000,0.000000e+000,...
 2.629879e-002,3.335228e-004,2.596527e-002,0.000000e+000,...
 2.628110e-002,3.358051e-004,2.594558e-002,0.000000e+000;...
1.100000e+003,5.691974e-002,2.906588e-004,3.589375e-004,...
 5.626628e-002,4.116022e-006,0.000000e+000,...
 2.577435e-002,2.860180e-004,2.548805e-002,2.918811e-007,...
 2.593922e-002,2.901378e-004,2.564943e-002,2.918581e-007;...
1.250000e+003,5.322760e-002,2.269522e-004,2.781396e-004,...
 5.265178e-002,7.030589e-005,0.000000e+000,...
 2.491768e-002,2.255827e-004,2.467939e-002,1.270887e-005,...
 2.523546e-002,2.265888e-004,2.499568e-002,1.282398e-005;...
1.400000e+003,5.026979e-002,1.845530e-004,2.218302e-004,...
 4.964222e-002,2.209460e-004,0.000000e+000,...
 2.422777e-002,1.841280e-004,2.398398e-002,5.965445e-005,...
 2.454824e-002,1.842864e-004,2.430422e-002,5.965474e-005;...
1.600000e+003,4.715024e-002,1.459926e-004,1.698987e-004,...
 4.631563e-002,5.192500e-004,0.000000e+000,...
 2.352272e-002,1.459952e-004,2.318969e-002,1.870360e-004,...
 2.372523e-002,1.458042e-004,2.339186e-002,1.875794e-004;...
1.718800e+003,4.564707e-002,1.304217e-004,1.487423e-004,...
 4.462484e-002,7.433231e-004,0.000000e+000,...
 2.320502e-002,1.294417e-004,2.277454e-002,3.010361e-004,...
 2.330308e-002,1.302735e-004,2.287157e-002,3.013337e-004;...
1.800000e+003,4.464748e-002,1.197788e-004,1.342821e-004,...
 4.348398e-002,9.099329e-004,0.000000e+000,...
 2.297806e-002,1.197817e-004,2.246813e-002,3.901539e-004,...
 2.306183e-002,1.196483e-004,2.254890e-002,3.932915e-004;...
2.044000e+003,4.216089e-002,9.691862e-005,1.041627e-004,...
 4.049274e-002,1.467582e-003,0.000000e+000,...
 2.244144e-002,9.691863e-005,2.161073e-002,7.337935e-004,...
 2.244562e-002,9.682216e-005,2.161490e-002,7.337931e-004;...
2.200000e+003,4.077526e-002,8.678572e-005,8.992145e-005,...
 3.876206e-002,1.835933e-003,1.244155e-007,...
 2.205328e-002,8.678577e-005,2.098337e-002,9.831289e-004,...
 2.214018e-002,8.670653e-005,2.107050e-002,9.830396e-004;...
2.500000e+003,3.863158e-002,7.162899e-005,6.964597e-005,...
 3.592825e-002,2.560342e-003,2.116509e-006,...
 2.152246e-002,7.162970e-005,1.993592e-002,1.514913e-003,...
 2.166878e-002,7.157226e-005,2.008229e-002,1.513640e-003;...
2.800000e+003,3.699794e-002,6.042209e-005,5.552764e-005,...
 3.358940e-002,3.286154e-003,6.848247e-006,...
 2.120266e-002,6.042202e-005,1.905115e-002,2.091092e-003,...
 2.133060e-002,6.037955e-005,1.917931e-002,2.086705e-003;...
3.200000e+003,3.528450e-002,4.985464e-005,4.251889e-005,...
 3.094214e-002,4.233235e-003,1.669873e-005,...
 2.095099e-002,4.985522e-005,1.800849e-002,2.892643e-003,...
 2.105585e-002,4.982379e-005,1.811341e-002,2.881239e-003;...
3.500000e+003,3.423315e-002,4.408244e-005,3.554437e-005,...
 2.919528e-002,4.931980e-003,2.643696e-005,...
 2.084367e-002,4.408160e-005,1.728898e-002,3.510602e-003,...
 2.095141e-002,4.405820e-005,1.739686e-002,3.491818e-003;...
4.000000e+003,3.292300e-002,3.669493e-005,2.721550e-005,...
 2.677447e-002,6.038543e-003,4.617329e-005,...
 2.083662e-002,3.669494e-005,1.626985e-002,4.530077e-003,...
 2.089631e-002,3.667767e-005,1.632969e-002,4.495809e-003;...
4.500000e+003,3.196762e-002,3.149100e-005,2.150476e-005,...
 2.480547e-002,7.041157e-003,6.812986e-005,...
 2.085794e-002,3.149106e-005,1.533175e-002,5.494704e-003,...
 2.092456e-002,3.147631e-005,1.539864e-002,5.442102e-003;...
5.000000e+003,3.133680e-002,2.746459e-005,1.741904e-005,...
 2.316752e-002,8.032341e-003,9.197995e-005,...
 2.100859e-002,2.746459e-005,1.453849e-002,6.442635e-003,...
 2.107442e-002,2.745237e-005,1.458344e-002,6.390399e-003;...
5.500000e+003,3.085048e-002,2.438601e-005,1.439653e-005,...
 2.177865e-002,8.916987e-003,1.164468e-004,...
 2.123493e-002,2.438666e-005,1.385633e-002,7.354210e-003,...
 2.124368e-002,2.437712e-005,1.386450e-002,7.260027e-003;...
6.300000e+003,3.026496e-002,2.062270e-005,1.097289e-005,...
 1.979456e-002,1.028353e-002,1.555140e-004,...
 2.158126e-002,2.062179e-005,1.282176e-002,8.738886e-003,...
 2.162834e-002,2.061637e-005,1.286250e-002,8.615253e-003;...
7.000000e+003,2.998244e-002,1.814798e-005,8.887981e-006,...
 1.837766e-002,1.138697e-002,1.903220e-004,...
 2.191611e-002,1.814798e-005,1.204457e-002,9.853395e-003,...
 2.201459e-002,1.814235e-005,1.210966e-002,9.724409e-003;...
8.000000e+003,2.979697e-002,1.548455e-005,6.805007e-006,...
 1.672676e-002,1.281034e-002,2.379833e-004,...
 2.248858e-002,1.548455e-005,1.112689e-002,1.134621e-002,...
 2.259017e-002,1.548085e-005,1.119364e-002,1.117380e-002;...
9.000000e+003,2.979051e-002,1.350046e-005,5.376784e-006,...
 1.539397e-002,1.409353e-002,2.835959e-004,...
 2.313368e-002,1.350046e-005,1.037565e-002,1.274453e-002,...
 2.318319e-002,1.349702e-005,1.042475e-002,1.249302e-002;...
1.000000e+004,2.989402e-002,1.195847e-005,4.355299e-006,...
 1.429302e-002,1.525810e-002,3.269440e-004,...
 2.375097e-002,1.195847e-005,9.746745e-003,1.399226e-002,...
 2.377445e-002,1.195593e-005,9.770511e-003,1.369825e-002;...
1.250000e+004,3.025849e-002,9.291916e-006,2.787435e-006,...
 1.209110e-002,1.773067e-002,4.251458e-004,...
 2.509703e-002,9.292009e-006,8.444149e-003,1.664358e-002,...
 2.514707e-002,9.290425e-006,8.466650e-003,1.628042e-002;...
1.600000e+004,3.112114e-002,7.073722e-006,1.701252e-006,...
 1.004932e-002,2.052026e-002,5.429297e-004,...
 2.681449e-002,7.073722e-006,7.164902e-003,1.964251e-002,...
 2.690818e-002,7.072803e-006,7.183293e-003,1.920958e-002;...
2.000000e+004,3.217681e-002,5.554381e-006,1.088879e-006,...
 8.460646e-003,2.305429e-002,6.547506e-004,...
 2.857857e-002,5.554382e-006,6.150047e-003,2.242297e-002,...
 2.866332e-002,5.553848e-006,6.160147e-003,2.187579e-002;...
2.500000e+004,3.345029e-002,4.377297e-006,6.968586e-007,...
 7.092161e-003,2.558293e-002,7.696662e-004,...
 3.047370e-002,4.377286e-006,5.227340e-003,2.524199e-002,...
 3.053543e-002,4.376937e-006,5.256287e-003,2.453696e-002;...
3.200000e+004,3.501708e-002,3.374899e-006,4.253291e-007,...
 5.834634e-003,2.828195e-002,8.972196e-004,...
 3.248678e-002,3.374827e-006,4.366964e-003,2.811644e-002,...
 3.264065e-002,3.374635e-006,4.390240e-003,2.737848e-002;...
4.000000e+004,3.662053e-002,2.673134e-006,2.722089e-007,...
 4.890896e-003,3.071031e-002,1.016308e-003,...
 3.454515e-002,2.673134e-006,3.711776e-003,3.083070e-002,...
 3.463932e-002,2.673006e-006,3.719837e-003,2.992539e-002;...
5.000000e+004,3.823800e-002,2.122116e-006,1.742120e-007,...
 4.075046e-003,3.302867e-002,1.132227e-003,...
 3.650121e-002,2.122117e-006,3.135837e-003,3.336326e-002,...
 3.660655e-002,2.121996e-006,3.141225e-003,3.235459e-002;...
6.300000e+004,3.990291e-002,1.673216e-006,1.097397e-007,...
 3.366703e-003,3.528666e-002,1.247714e-003,...
 3.650121e-002,2.122117e-006,3.135837e-003,3.336326e-002,...
 3.856977e-002,1.673178e-006,2.627091e-003,3.471340e-002;...
8.000000e+004,4.168751e-002,1.311226e-006,6.805330e-008,...
 2.763604e-003,3.755758e-002,1.365142e-003,...
 3.650121e-002,2.122117e-006,3.135837e-003,3.336326e-002,...
 4.060515e-002,1.311166e-006,2.177896e-003,3.707772e-002;...
1.000000e+005,4.326616e-002,1.044560e-006,4.355407e-008,...
 2.297342e-003,3.949854e-002,1.468660e-003,...
 3.650121e-002,2.122117e-006,3.135837e-003,3.336326e-002,...
 4.237236e-002,1.044526e-006,1.823724e-003,3.909449e-002;...
1.250000e+005,4.465718e-002,8.332219e-007,2.787435e-008,...
 1.903327e-003,4.119041e-002,1.562365e-003,...
 3.650121e-002,2.122117e-006,3.135837e-003,3.336326e-002,...
 4.392888e-002,8.332233e-007,1.524003e-003,4.085446e-002;...
 ];
zr = interp1q(za(:,1),za(:,flag),e);
