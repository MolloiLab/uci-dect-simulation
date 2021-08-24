 
function zr =z17(flag,e)

za = [9.686100e-001,3.098246e+003,3.095698e+003,2.664253e+000,...
 8.108265e-003,0.000000e+000,0.000000e+000,...
 2.807331e+003,2.820729e+003,2.307430e-005,0.000000e+000,...
 3.095520e+003,3.095520e+003,2.122378e-005,0.000000e+000;...
1.000000e+000,2.823412e+003,2.820694e+003,2.641153e+000,...
 8.568586e-003,0.000000e+000,0.000000e+000,...
 2.807331e+003,2.820729e+003,2.307430e-005,0.000000e+000,...
 2.820628e+003,2.820628e+003,2.305880e-005,0.000000e+000;...
1.089200e+000,2.265422e+003,2.262705e+003,2.580682e+000,...
 9.924578e-003,0.000000e+000,0.000000e+000,...
 2.245113e+003,2.254946e+003,2.886460e-005,0.000000e+000,...
 2.262555e+003,2.262555e+003,2.949419e-005,0.000000e+000;...
1.100000e+000,2.197648e+003,2.195100e+003,2.571850e+000,...
 1.008917e-002,0.000000e+000,0.000000e+000,...
 2.187911e+003,2.197399e+003,2.962062e-005,0.000000e+000,...
 2.195056e+003,2.195056e+003,3.029643e-005,0.000000e+000;...
1.172600e+000,1.863364e+003,1.860986e+003,2.517324e+000,...
 1.128533e-002,0.000000e+000,0.000000e+000,...
 1.851059e+003,1.858587e+003,3.502107e-005,0.000000e+000,...
 1.860889e+003,1.860889e+003,3.606514e-005,0.000000e+000;...
1.203600e+000,1.745311e+003,1.742763e+003,2.493884e+000,...
 1.179626e-002,0.000000e+000,0.000000e+000,...
 1.728742e+003,1.735591e+003,3.749943e-005,0.000000e+000,...
 1.742801e+003,1.742801e+003,3.858990e-005,0.000000e+000;...
1.250000e+000,1.572207e+003,1.569744e+003,2.455835e+000,...
 1.256046e-002,0.000000e+000,0.000000e+000,...
 1.565100e+003,1.571070e+003,4.140686e-005,0.000000e+000,...
 1.569732e+003,1.569732e+003,4.241693e-005,0.000000e+000;...
1.363800e+000,1.264522e+003,1.262144e+003,2.366829e+000,...
 1.454239e-002,0.000000e+000,0.000000e+000,...
 1.244662e+003,1.249012e+003,5.180442e-005,0.000000e+000,...
 1.262145e+003,1.262145e+003,5.296522e-005,0.000000e+000;...
1.400000e+000,1.166819e+003,1.164458e+003,2.338292e+000,...
 1.516187e-002,0.000000e+000,0.000000e+000,...
 1.161812e+003,1.165767e+003,5.524742e-005,0.000000e+000,...
 1.164459e+003,1.164459e+003,5.664281e-005,0.000000e+000;...
1.500000e+000,9.799391e+002,9.776630e+002,2.262025e+000,...
 1.694710e-002,0.000000e+000,0.000000e+000,...
 9.690491e+002,9.721273e+002,6.544978e-005,0.000000e+000,...
 9.776395e+002,9.776395e+002,6.731798e-005,0.000000e+000;...
1.600000e+000,8.197441e+002,8.175530e+002,2.183550e+000,...
 1.867101e-002,0.000000e+000,0.000000e+000,...
 8.155521e+002,8.179802e+002,7.669249e-005,0.000000e+000,...
 8.175366e+002,8.175366e+002,7.947067e-005,0.000000e+000;...
1.800000e+000,5.978221e+002,5.957838e+002,2.021673e+000,...
 2.225165e-002,0.000000e+000,0.000000e+000,...
 5.945844e+002,5.961573e+002,1.019598e-004,0.000000e+000,...
 5.957789e+002,5.957789e+002,1.056904e-004,0.000000e+000;...
2.000000e+000,4.505535e+002,4.486851e+002,1.854531e+000,...
 2.585438e-002,0.000000e+000,0.000000e+000,...
 4.476196e+002,4.486851e+002,1.303476e-004,0.000000e+000,...
 4.486776e+002,4.486776e+002,1.350887e-004,0.000000e+000;...
2.200000e+000,3.472617e+002,3.455631e+002,1.676467e+000,...
 2.935180e-002,0.000000e+000,0.000000e+000,...
 3.449172e+002,3.456633e+002,1.617738e-004,0.000000e+000,...
 3.455620e+002,3.455620e+002,1.677180e-004,0.000000e+000;...
2.334600e+000,2.976286e+002,2.960489e+002,1.542006e+000,...
 3.176891e-002,0.000000e+000,0.000000e+000,...
 2.931260e+002,2.937234e+002,1.847806e-004,0.000000e+000,...
 2.960522e+002,2.960522e+002,1.904869e-004,0.000000e+000;...
2.354800e+000,2.906644e+002,2.891186e+002,1.519024e+000,...
 3.213071e-002,0.000000e+000,0.000000e+000,...
 2.862878e+002,2.868661e+002,1.882025e-004,0.000000e+000,...
 2.890995e+002,2.890995e+002,1.939134e-004,0.000000e+000;...
2.500000e+000,2.443945e+002,2.430356e+002,1.330615e+000,...
 3.450026e-002,0.000000e+000,0.000000e+000,...
 2.429971e+002,2.434594e+002,2.135687e-004,0.000000e+000,...
 2.430243e+002,2.430243e+002,2.211325e-004,0.000000e+000;...
2.625600e+000,2.154334e+002,2.142614e+002,1.133357e+000,...
 3.658274e-002,0.000000e+000,0.000000e+000,...
 2.124556e+002,2.128403e+002,2.366948e-004,0.000000e+000,...
 2.142634e+002,2.142634e+002,2.450858e-004,0.000000e+000;...
2.698800e+000,1.998912e+002,1.989060e+002,9.508421e-001,...
 3.779723e-002,0.000000e+000,0.000000e+000,...
 1.970356e+002,1.973827e+002,2.507468e-004,0.000000e+000,...
 1.989061e+002,1.989061e+002,2.591555e-004,0.000000e+000;...
2.741200e+000,1.911434e+002,1.903281e+002,7.798440e-001,...
 3.850045e-002,0.000000e+000,0.000000e+000,...
 1.887962e+002,1.891237e+002,2.590808e-004,0.000000e+000,...
 1.903245e+002,1.903245e+002,2.673033e-004,0.000000e+000;...
2.758400e+000,1.875594e+002,1.868459e+002,6.729681e-001,...
 3.878752e-002,0.000000e+000,0.000000e+000,...
 1.855878e+002,1.859077e+002,2.625022e-004,0.000000e+000,...
 1.868367e+002,1.868367e+002,2.706447e-004,0.000000e+000;...
2.770000e+000,1.851304e+002,1.845019e+002,5.897708e-001,...
 3.897776e-002,0.000000e+000,0.000000e+000,...
 1.834659e+002,1.837807e+002,2.648231e-004,0.000000e+000,...
 1.844930e+002,1.844930e+002,2.728698e-004,0.000000e+000;...
2.781900e+000,1.826334e+002,1.820899e+002,5.135037e-001,...
 3.917650e-002,0.000000e+000,0.000000e+000,...
 1.813233e+002,1.816331e+002,2.672148e-004,0.000000e+000,...
 1.820820e+002,1.820820e+002,2.751921e-004,0.000000e+000;...
2.800000e+000,1.789644e+002,1.784209e+002,4.959741e-001,...
 3.947715e-002,0.000000e+000,0.000000e+000,...
 1.781294e+002,1.784318e+002,2.708744e-004,0.000000e+000,...
 1.784159e+002,1.784159e+002,2.786804e-004,0.000000e+000;...
2.804900e+000,1.782341e+002,1.776735e+002,5.132319e-001,...
 3.955869e-002,0.000000e+000,0.000000e+000,...
 1.772780e+002,1.775784e+002,2.718697e-004,0.000000e+000,...
 1.776716e+002,1.776716e+002,2.796355e-004,0.000000e+000;...
2.804900e+000,1.652822e+003,1.652262e+003,5.132319e-001,...
 3.955869e-002,0.000000e+000,0.000000e+000,...
 1.649272e+003,1.652070e+003,2.718900e-004,0.000000e+000,...
 1.523470e+003,1.523470e+003,2.796355e-004,0.000000e+000;...
2.821300e+000,1.637467e+003,1.636771e+003,6.572391e-001,...
 3.983556e-002,0.000000e+000,0.000000e+000,...
 1.632093e+003,1.634845e+003,2.751476e-004,0.000000e+000,...
 1.509872e+003,1.509872e+003,2.828514e-004,0.000000e+000;...
2.824600e+000,1.634410e+003,1.633679e+003,6.925021e-001,...
 3.988312e-002,0.000000e+000,0.000000e+000,...
 1.628649e+003,1.631392e+003,2.757912e-004,0.000000e+000,...
 1.507116e+003,1.507116e+003,2.835564e-004,0.000000e+000;...
2.844700e+000,1.615776e+003,1.614808e+003,9.161906e-001,...
 4.017697e-002,0.000000e+000,0.000000e+000,...
 1.607912e+003,1.610600e+003,2.796764e-004,0.000000e+000,...
 1.490452e+003,1.490452e+003,2.878638e-004,0.000000e+000;...
2.873800e+000,1.588530e+003,1.587358e+003,1.127242e+000,...
 4.060672e-002,0.000000e+000,0.000000e+000,...
 1.578608e+003,1.581221e+003,2.852740e-004,0.000000e+000,...
 1.466265e+003,1.466265e+003,2.941516e-004,0.000000e+000;...
2.928800e+000,1.536893e+003,1.535534e+003,1.317162e+000,...
 4.141526e-002,0.000000e+000,0.000000e+000,...
 1.525440e+003,1.527918e+003,2.960004e-004,0.000000e+000,...
 1.420351e+003,1.420351e+003,3.060183e-004,0.000000e+000;...
3.080300e+000,1.396792e+003,1.395179e+003,1.566601e+000,...
 4.364042e-002,0.000000e+000,0.000000e+000,...
 1.392245e+003,1.394395e+003,3.265394e-004,0.000000e+000,...
 1.295141e+003,1.295141e+003,3.386840e-004,0.000000e+000;...
3.180100e+000,1.295301e+003,1.293602e+003,1.659838e+000,...
 4.510801e-002,0.000000e+000,0.000000e+000,...
 1.290552e+003,1.292482e+003,3.474535e-004,0.000000e+000,...
 1.203619e+003,1.203619e+003,3.602834e-004,0.000000e+000;...
3.200000e+000,1.275105e+003,1.273372e+003,1.673290e+000,...
 4.540017e-002,0.000000e+000,0.000000e+000,...
 1.271542e+003,1.273432e+003,3.516993e-004,0.000000e+000,...
 1.185342e+003,1.185342e+003,3.645866e-004,0.000000e+000;...
3.376700e+000,1.123437e+003,1.121636e+003,1.760768e+000,...
 4.800922e-002,0.000000e+000,0.000000e+000,...
 1.118930e+003,1.120505e+003,3.904970e-004,0.000000e+000,...
 1.047941e+003,1.047941e+003,4.029591e-004,0.000000e+000;...
3.500000e+000,1.017053e+003,1.015219e+003,1.792872e+000,...
 4.982842e-002,0.000000e+000,0.000000e+000,...
 1.013901e+003,1.015279e+003,4.183304e-004,0.000000e+000,...
 9.508401e+002,9.508401e+002,4.297449e-004,0.000000e+000;...
3.541600e+000,9.879055e+002,9.860710e+002,1.790664e+000,...
 5.044501e-002,0.000000e+000,0.000000e+000,...
 9.815041e+002,9.828217e+002,4.274273e-004,0.000000e+000,...
 9.242972e+002,9.242972e+002,4.388150e-004,0.000000e+000;...
4.000000e+000,7.050377e+002,7.032032e+002,1.767223e+000,...
 5.620326e-002,0.000000e+000,0.000000e+000,...
 7.024299e+002,7.032644e+002,5.323514e-004,0.000000e+000,...
 6.641801e+002,6.641801e+002,5.480087e-004,0.000000e+000;...
4.173900e+000,6.296369e+002,6.278364e+002,1.730533e+000,...
 5.836558e-002,0.000000e+000,0.000000e+000,...
 6.248670e+002,6.255782e+002,5.725828e-004,0.000000e+000,...
 5.944280e+002,5.944280e+002,5.888372e-004,0.000000e+000;...
4.284000e+000,5.868831e+002,5.851166e+002,1.708452e+000,...
 5.973465e-002,0.000000e+000,0.000000e+000,...
 5.823444e+002,5.829902e+002,5.986815e-004,0.000000e+000,...
 5.547697e+002,5.547697e+002,6.146007e-004,0.000000e+000;...
4.472100e+000,5.224893e+002,5.207567e+002,1.669401e+000,...
 6.169823e-002,0.000000e+000,0.000000e+000,...
 5.193788e+002,5.199303e+002,6.443828e-004,0.000000e+000,...
 4.948957e+002,4.948957e+002,6.632771e-004,0.000000e+000;...
4.500000e+000,5.130790e+002,5.113634e+002,1.663252e+000,...
 6.198869e-002,0.000000e+000,0.000000e+000,...
 5.108211e+002,5.113602e+002,6.512800e-004,0.000000e+000,...
 4.861025e+002,4.861025e+002,6.704211e-004,0.000000e+000;...
4.689400e+000,4.652634e+002,4.635818e+002,1.618290e+000,...
 6.392679e-002,0.000000e+000,0.000000e+000,...
 4.575504e+002,4.580136e+002,6.989074e-004,0.000000e+000,...
 4.415949e+002,4.415949e+002,7.182983e-004,0.000000e+000;...
4.894100e+000,4.138978e+002,4.122671e+002,1.575910e+000,...
 6.602287e-002,0.000000e+000,0.000000e+000,...
 4.081972e+002,4.085930e+002,7.519437e-004,0.000000e+000,...
 3.935183e+002,3.935183e+002,7.695663e-004,0.000000e+000;...
5.000000e+000,3.873996e+002,3.857859e+002,1.553488e+000,...
 6.710827e-002,0.000000e+000,0.000000e+000,...
 3.855080e+002,3.858737e+002,7.791822e-004,0.000000e+000,...
 3.686123e+002,3.686061e+002,7.958307e-004,0.000000e+000;...
5.038700e+000,3.807071e+002,3.790934e+002,1.544825e+000,...
 6.749555e-002,0.000000e+000,0.000000e+000,...
 3.776488e+002,3.780044e+002,7.886205e-004,0.000000e+000,...
 3.623355e+002,3.623355e+002,8.052793e-004,0.000000e+000;...
5.295200e+000,3.361359e+002,3.345732e+002,1.488619e+000,...
 7.007062e-002,0.000000e+000,0.000000e+000,...
 3.307358e+002,3.310319e+002,8.522030e-004,0.000000e+000,...
 3.204990e+002,3.204990e+002,8.676889e-004,0.000000e+000;...
5.500000e+000,3.005672e+002,2.990555e+002,1.445304e+000,...
 7.177433e-002,0.000000e+000,0.000000e+000,...
 2.988506e+002,2.991080e+002,9.042309e-004,0.000000e+000,...
 2.869322e+002,2.869322e+002,9.245913e-004,0.000000e+000;...
5.830600e+000,2.593931e+002,2.579323e+002,1.382048e+000,...
 7.443773e-002,0.000000e+000,0.000000e+000,...
 2.556993e+002,2.559068e+002,9.905298e-004,0.000000e+000,...
 2.480529e+002,2.480529e+002,1.013312e-003,0.000000e+000;...
6.000000e+000,2.385683e+002,2.371415e+002,1.351287e+000,...
 7.580340e-002,0.000000e+000,0.000000e+000,...
 2.368649e+002,2.370515e+002,1.035837e-003,0.000000e+000,...
 2.283188e+002,2.283136e+002,1.057976e-003,0.000000e+000;...
6.300000e+000,2.080784e+002,2.067026e+002,1.297373e+000,...
 7.822051e-002,0.000000e+000,0.000000e+000,...
 2.065625e+002,2.067172e+002,1.117844e-003,0.000000e+000,...
 1.993757e+002,1.993708e+002,1.135755e-003,0.000000e+000;...
6.640800e+000,1.822258e+002,1.809008e+002,1.241948e+000,...
 8.073614e-002,0.000000e+000,0.000000e+000,...
 1.781798e+002,1.783061e+002,1.213700e-003,0.000000e+000,...
 1.748164e+002,1.748164e+002,1.218917e-003,0.000000e+000;...
6.928200e+000,1.604327e+002,1.591554e+002,1.195356e+000,...
 8.276597e-002,0.000000e+000,0.000000e+000,...
 1.582101e+002,1.583173e+002,1.293124e-003,0.000000e+000,...
 1.540200e+002,1.540155e+002,1.308919e-003,0.000000e+000;...
7.000000e+000,1.550533e+002,1.537878e+002,1.183737e+000,...
 8.323308e-002,0.000000e+000,0.000000e+000,...
 1.536879e+002,1.537909e+002,1.312554e-003,0.000000e+000,...
 1.488710e+002,1.488710e+002,1.330652e-003,0.000000e+000;...
7.483300e+000,1.286332e+002,1.274323e+002,1.114009e+000,...
 8.626848e-002,0.000000e+000,0.000000e+000,...
 1.273747e+002,1.274541e+002,1.445641e-003,0.000000e+000,...
 1.236231e+002,1.236190e+002,1.471104e-003,0.000000e+000;...
8.000000e+000,1.067366e+002,1.056036e+002,1.043738e+000,...
 8.951449e-002,0.000000e+000,0.000000e+000,...
 1.055652e+002,1.056264e+002,1.592231e-003,0.000000e+000,...
 1.026486e+002,1.026486e+002,1.615744e-003,0.000000e+000;...
8.449900e+000,9.324292e+001,9.216092e+001,9.891625e-001,...
 9.220338e-002,0.000000e+000,0.000000e+000,...
 9.050738e+001,9.055656e+001,1.723370e-003,0.000000e+000,...
 8.971948e+001,8.971948e+001,1.735181e-003,0.000000e+000;...
8.726400e+000,8.499622e+001,8.394479e+001,9.573477e-001,...
 9.385612e-002,0.000000e+000,0.000000e+000,...
 8.267053e+001,8.271374e+001,1.805537e-003,0.000000e+000,...
 8.178873e+001,8.178873e+001,1.806989e-003,0.000000e+000;...
9.000000e+000,7.683955e+001,7.581870e+001,9.258557e-001,...
 9.526935e-002,0.000000e+000,0.000000e+000,...
 7.579455e+001,7.583267e+001,1.887996e-003,0.000000e+000,...
 7.393004e+001,7.393004e+001,1.892450e-003,0.000000e+000;...
9.007400e+000,7.669517e+001,7.567431e+001,9.250573e-001,...
 9.530672e-002,0.000000e+000,0.000000e+000,...
 7.561954e+001,7.565754e+001,1.890242e-003,0.000000e+000,...
 7.379330e+001,7.378985e+001,1.894729e-003,0.000000e+000;...
9.812500e+000,6.095764e+001,6.001492e+001,8.428961e-001,...
 9.932052e-002,0.000000e+000,0.000000e+000,...
 5.943636e+001,5.946301e+001,2.129588e-003,0.000000e+000,...
 5.864470e+001,5.864153e+001,2.133152e-003,0.000000e+000;...
1.000000e+001,5.730396e+001,5.637992e+001,8.247380e-001,...
 1.002547e-001,0.000000e+000,0.000000e+000,...
 5.635465e+001,5.637923e+001,2.186471e-003,0.000000e+000,...
 5.511512e+001,5.511512e+001,2.186839e-003,0.000000e+000;...
1.048800e+001,5.056221e+001,4.967894e+001,7.812030e-001,...
 1.024323e-001,0.000000e+000,0.000000e+000,...
 4.902017e+001,4.904005e+001,2.323014e-003,0.000000e+000,...
 4.861988e+001,4.861692e+001,2.357452e-003,0.000000e+000;...
1.058900e+001,4.916766e+001,4.829288e+001,7.721834e-001,...
 1.028825e-001,0.000000e+000,0.000000e+000,...
 4.766446e+001,4.768350e+001,2.351493e-003,0.000000e+000,...
 4.727464e+001,4.727171e+001,2.391969e-003,0.000000e+000;...
1.100000e+001,4.349604e+001,4.265523e+001,7.375489e-001,...
 1.047136e-001,0.000000e+000,0.000000e+000,...
 4.263823e+001,4.265418e+001,2.468139e-003,0.000000e+000,...
 4.178876e+001,4.178593e+001,2.529954e-003,0.000000e+000;...
1.106700e+001,4.281830e+001,4.198089e+001,7.323002e-001,...
 1.049938e-001,0.000000e+000,0.000000e+000,...
 4.188725e+001,4.190274e+001,2.487268e-003,0.000000e+000,...
 4.113093e+001,4.112812e+001,2.551636e-003,0.000000e+000;...
1.172600e+001,3.615809e+001,3.536824e+001,6.823614e-001,...
 1.077609e-001,0.000000e+000,0.000000e+000,...
 3.535099e+001,3.536263e+001,2.677070e-003,0.000000e+000,...
 3.469598e+001,3.469333e+001,2.760342e-003,0.000000e+000;...
1.198800e+001,3.408410e+001,3.331293e+001,6.625218e-001,...
 1.088582e-001,0.000000e+000,0.000000e+000,...
 3.313244e+001,3.314282e+001,2.753347e-003,0.000000e+000,...
 3.269189e+001,3.268930e+001,2.840686e-003,0.000000e+000;...
1.250000e+001,3.005162e+001,2.931443e+001,6.268342e-001,...
 1.110069e-001,0.000000e+000,0.000000e+000,...
 2.930800e+001,2.931623e+001,2.903713e-003,0.000000e+000,...
 2.879154e+001,2.878905e+001,2.994897e-003,0.000000e+000;...
1.322900e+001,2.597159e+001,2.527686e+001,5.817024e-001,...
 1.137331e-001,0.000000e+000,0.000000e+000,...
 2.481954e+001,2.482533e+001,3.120697e-003,0.000000e+000,...
 2.484830e+001,2.484594e+001,3.197939e-003,0.000000e+000;...
1.360400e+001,2.387891e+001,2.320457e+001,5.589752e-001,...
 1.151379e-001,0.000000e+000,0.000000e+000,...
 2.286620e+001,2.287095e+001,3.225589e-003,0.000000e+000,...
 2.282515e+001,2.282195e+001,3.327977e-003,0.000000e+000;...
1.400000e+001,2.167413e+001,2.102187e+001,5.367065e-001,...
 1.163931e-001,0.000000e+000,0.000000e+000,...
 2.102087e+001,2.102467e+001,3.333530e-003,0.000000e+000,...
 2.068806e+001,2.068473e+001,3.466975e-003,0.000000e+000;...
1.496700e+001,1.788965e+001,1.728325e+001,4.883304e-001,...
 1.192162e-001,0.000000e+000,0.000000e+000,...
 1.728192e+001,1.728381e+001,3.598984e-003,0.000000e+000,...
 1.702667e+001,1.702272e+001,3.784513e-003,0.000000e+000;...
1.500000e+001,1.778943e+001,1.718303e+001,4.866658e-001,...
 1.193147e-001,0.000000e+000,0.000000e+000,...
 1.717067e+001,1.717250e+001,3.608089e-003,0.000000e+000,...
 1.693030e+001,1.692657e+001,3.795271e-003,0.000000e+000;...
1.586700e+001,1.517308e+001,1.460320e+001,4.480906e-001,...
 1.218490e-001,0.000000e+000,0.000000e+000,...
 1.456190e+001,1.456241e+001,3.848327e-003,0.000000e+000,...
 1.440098e+001,1.439686e+001,4.064589e-003,0.000000e+000;...
1.600000e+001,1.477340e+001,1.420862e+001,4.425701e-001,...
 1.222363e-001,0.000000e+000,0.000000e+000,...
 1.420975e+001,1.421009e+001,3.885356e-003,0.000000e+000,...
 1.401369e+001,1.400961e+001,4.104503e-003,0.000000e+000;...
1.732100e+001,1.178183e+001,1.126256e+001,3.937524e-001,...
 1.255554e-001,0.000000e+000,0.000000e+000,...
 1.126044e+001,1.125927e+001,4.255534e-003,0.000000e+000,...
 1.112059e+001,1.111610e+001,4.488978e-003,0.000000e+000;...
1.800000e+001,1.051654e+001,1.001885e+001,3.706174e-001,...
 1.269822e-001,0.000000e+000,0.000000e+000,...
 1.002083e+001,1.001902e+001,4.447451e-003,0.000000e+000,...
 9.898362e+000,9.893695e+000,4.733113e-003,0.000000e+000;...
1.897400e+001,9.153073e+000,8.682052e+000,3.423527e-001,...
 1.287012e-001,0.000000e+000,0.000000e+000,...
 8.540710e+000,8.538122e+000,4.724607e-003,0.000000e+000,...
 8.584111e+000,8.579027e+000,5.052930e-003,0.000000e+000;...
2.000000e+001,7.722343e+000,7.276970e+000,3.149204e-001,...
 1.305153e-001,0.000000e+000,0.000000e+000,...
 7.280158e+000,7.276886e+000,5.000024e-003,0.000000e+000,...
 7.200373e+000,7.194928e+000,5.370411e-003,0.000000e+000;...
2.188800e+001,5.958008e+000,5.551023e+000,2.733556e-001,...
 1.336118e-001,0.000000e+000,0.000000e+000,...
 5.538411e+000,5.534124e+000,5.487750e-003,0.000000e+000,...
 5.499798e+000,5.493970e+000,5.899667e-003,0.000000e+000;...
2.200000e+001,5.853374e+000,5.448428e+000,2.711475e-001,...
 1.337953e-001,0.000000e+000,0.000000e+000,...
 5.453403e+000,5.449062e+000,5.516726e-003,0.000000e+000,...
 5.398682e+000,5.392742e+000,5.929598e-003,0.000000e+000;...
2.345200e+001,4.868866e+000,4.487700e+000,2.455496e-001,...
 1.355805e-001,0.000000e+000,0.000000e+000,...
 4.493273e+000,4.488289e+000,5.892796e-003,0.000000e+000,...
 4.450829e+000,4.444593e+000,6.274914e-003,0.000000e+000;...
2.500000e+001,4.055237e+000,3.696492e+000,2.213275e-001,...
 1.374829e-001,0.000000e+000,0.000000e+000,...
 3.702434e+000,3.696841e+000,6.294548e-003,0.000000e+000,...
 3.669944e+000,3.663099e+000,6.770753e-003,0.000000e+000;...
2.723600e+001,3.226490e+000,2.894244e+000,1.929439e-001,...
 1.393395e-001,0.000000e+000,0.000000e+000,...
 2.856883e+000,2.850503e+000,6.876243e-003,0.000000e+000,...
 2.877771e+000,2.870345e+000,7.390517e-003,0.000000e+000;...
2.800000e+001,2.945202e+000,2.620769e+000,1.845359e-001,...
 1.399731e-001,0.000000e+000,0.000000e+000,...
 2.627555e+000,2.620946e+000,7.053695e-003,0.000000e+000,...
 2.607232e+000,2.599676e+000,7.585452e-003,0.000000e+000;...
2.993300e+001,2.449551e+000,2.142274e+000,1.660942e-001,...
 1.411944e-001,0.000000e+000,0.000000e+000,...
 2.147432e+000,2.140270e+000,7.500962e-003,0.000000e+000,...
 2.134200e+000,2.126092e+000,8.027782e-003,0.000000e+000;...
3.132800e+001,2.164186e+000,1.868120e+000,1.539526e-001,...
 1.420743e-001,0.000000e+000,0.000000e+000,...
 1.864484e+000,1.856943e+000,7.822318e-003,0.000000e+000,...
 1.863078e+000,1.854736e+000,8.389365e-003,0.000000e+000;...
3.200000e+001,2.029147e+000,1.737837e+000,1.487413e-001,...
 1.424989e-001,0.000000e+000,0.000000e+000,...
 1.745620e+000,1.737902e+000,7.976714e-003,0.000000e+000,...
 1.734210e+000,1.725653e+000,8.593556e-003,0.000000e+000;...
3.500000e+001,1.585863e+000,1.313765e+000,1.285653e-001,...
 1.435215e-001,0.000000e+000,0.000000e+000,...
 1.322302e+000,1.313818e+000,8.662943e-003,0.000000e+000,...
 1.314695e+000,1.305272e+000,9.376833e-003,0.000000e+000;...
3.892800e+001,1.201878e+000,9.491944e-001,1.079579e-001,...
 1.447292e-001,0.000000e+000,0.000000e+000,...
 9.520498e-001,9.426103e-001,9.554486e-003,0.000000e+000,...
 9.539255e-001,9.436949e-001,1.024021e-002,0.000000e+000;...
4.000000e+001,1.114196e+000,8.659630e-001,1.031780e-001,...
 1.450587e-001,0.000000e+000,0.000000e+000,...
 8.756418e-001,8.659698e-001,9.774704e-003,0.000000e+000,...
 8.714997e-001,8.610765e-001,1.045037e-002,0.000000e+000;...
4.242600e+001,9.594030e-001,7.205629e-001,9.358773e-002,...
 1.452439e-001,0.000000e+000,0.000000e+000,...
 7.307952e-001,7.206063e-001,1.026959e-002,0.000000e+000,...
 7.277212e-001,7.167426e-001,1.097925e-002,0.000000e+000;...
4.500000e+001,8.296980e-001,5.995717e-001,8.468199e-002,...
 1.454426e-001,0.000000e+000,0.000000e+000,...
 6.103339e-001,5.996074e-001,1.078970e-002,0.000000e+000,...
 6.081864e-001,5.965774e-001,1.161032e-002,0.000000e+000;...
5.000000e+001,6.478289e-001,4.315632e-001,7.078914e-002,...
 1.454800e-001,0.000000e+000,0.000000e+000,...
 4.433159e-001,4.315871e-001,1.176979e-002,0.000000e+000,...
 4.422526e-001,4.296204e-001,1.263037e-002,0.000000e+000;...
5.447300e+001,5.387958e-001,3.322291e-001,6.105446e-002,...
 1.455088e-001,0.000000e+000,0.000000e+000,...
 3.429062e-001,3.303242e-001,1.261078e-002,0.000000e+000,...
 3.442386e-001,3.308559e-001,1.338503e-002,0.000000e+000;...
5.500000e+001,5.260733e-001,3.205258e-001,6.003021e-002,...
 1.455139e-001,0.000000e+000,0.000000e+000,...
 3.332280e-001,3.205467e-001,1.270896e-002,0.000000e+000,...
 3.326809e-001,3.192171e-001,1.346552e-002,0.000000e+000;...
6.300000e+001,4.006656e-001,2.092845e-001,4.719559e-002,...
 1.441856e-001,0.000000e+000,0.000000e+000,...
 2.233495e-001,2.092758e-001,1.408952e-002,0.000000e+000,...
 2.235162e-001,2.085272e-001,1.498899e-002,0.000000e+000;...
6.772200e+001,3.539032e-001,1.691449e-001,4.144583e-002,...
 1.433091e-001,0.000000e+000,0.000000e+000,...
 1.812225e-001,1.663825e-001,1.485166e-002,0.000000e+000,...
 1.843438e-001,1.685806e-001,1.576323e-002,0.000000e+000;...
7.000000e+001,3.317195e-001,1.497961e-001,3.903212e-002,...
 1.428862e-001,0.000000e+000,0.000000e+000,...
 1.650036e-001,1.497996e-001,1.521415e-002,0.000000e+000,...
 1.654058e-001,1.493155e-001,1.609121e-002,0.000000e+000;...
7.841000e+001,2.784175e-001,1.051773e-001,3.172984e-002,...
 1.415137e-001,0.000000e+000,0.000000e+000,...
 1.210263e-001,1.045068e-001,1.652580e-002,0.000000e+000,...
 1.219953e-001,1.048729e-001,1.711958e-002,0.000000e+000;...
8.000000e+001,2.698905e-001,9.805506e-002,3.057479e-002,...
 1.412555e-001,0.000000e+000,0.000000e+000,...
 1.148202e-001,9.805658e-002,1.676939e-002,0.000000e+000,...
 1.150630e-001,9.777925e-002,1.728337e-002,0.000000e+000;...
8.958701e+001,2.325043e-001,6.859115e-002,2.479616e-002,...
 1.391204e-001,0.000000e+000,0.000000e+000,...
 8.657037e-002,6.847332e-002,1.810067e-002,0.000000e+000,...
 8.683629e-002,6.841879e-002,1.841750e-002,0.000000e+000;...
9.000000e+001,2.310945e-001,6.748027e-002,2.458553e-002,...
 1.390287e-001,0.000000e+000,0.000000e+000,...
 8.563482e-002,6.748144e-002,1.815693e-002,0.000000e+000,...
 8.577403e-002,6.730969e-002,1.846435e-002,0.000000e+000;...
9.825401e+001,2.097261e-001,5.165271e-002,2.088938e-002,...
 1.371806e-001,0.000000e+000,0.000000e+000,...
 7.033288e-002,5.108328e-002,1.925207e-002,0.000000e+000,...
 7.082908e-002,5.153451e-002,1.929520e-002,0.000000e+000;...
1.000000e+002,2.053097e-001,4.830477e-002,2.021164e-002,...
 1.367899e-001,0.000000e+000,0.000000e+000,...
 6.778194e-002,4.830681e-002,1.947742e-002,0.000000e+000,...
 6.763846e-002,4.819540e-002,1.944306e-002,0.000000e+000;...
1.100000e+002,1.866082e-001,3.570117e-002,1.690701e-002,...
 1.340076e-001,0.000000e+000,0.000000e+000,...
 5.580061e-002,3.570103e-002,2.010111e-002,0.000000e+000,...
 5.624823e-002,3.562821e-002,2.061888e-002,0.000000e+000;...
1.231600e+002,1.695321e-001,2.506793e-002,1.365300e-002,...
 1.308108e-001,0.000000e+000,0.000000e+000,...
 4.580999e-002,2.494445e-002,2.086651e-002,0.000000e+000,...
 4.678955e-002,2.502373e-002,2.176481e-002,0.000000e+000;...
1.250000e+002,1.674343e-001,2.379738e-002,1.327286e-002,...
 1.303641e-001,0.000000e+000,0.000000e+000,...
 4.476618e-002,2.379799e-002,2.096910e-002,0.000000e+000,...
 4.564530e-002,2.375582e-002,2.189048e-002,0.000000e+000;...
1.355400e+002,1.579664e-001,1.841622e-002,1.139777e-002,...
 1.281525e-001,0.000000e+000,0.000000e+000,...
 3.994530e-002,1.840789e-002,2.153805e-002,0.000000e+000,...
 4.093194e-002,1.838597e-002,2.254712e-002,0.000000e+000;...
1.400000e+002,1.545386e-001,1.663065e-002,1.069167e-002,...
 1.272166e-001,0.000000e+000,0.000000e+000,...
 3.839993e-002,1.663061e-002,2.176989e-002,0.000000e+000,...
 3.937239e-002,1.660436e-002,2.276869e-002,0.000000e+000;...
1.496700e+002,1.481450e-001,1.348977e-002,9.412280e-003,...
 1.252428e-001,0.000000e+000,0.000000e+000,...
 3.574330e-002,1.348764e-002,2.225609e-002,0.000000e+000,...
 3.662694e-002,1.346896e-002,2.315819e-002,0.000000e+000;...
1.600000e+002,1.423528e-001,1.094340e-002,8.276086e-003,...
 1.231332e-001,0.000000e+000,0.000000e+000,...
 3.360184e-002,1.094337e-002,2.265879e-002,0.000000e+000,...
 3.476392e-002,1.092817e-002,2.383517e-002,0.000000e+000;...
1.743800e+002,1.356383e-001,8.403482e-003,7.011139e-003,...
 1.202235e-001,0.000000e+000,0.000000e+000,...
 3.154162e-002,8.357722e-003,2.318412e-002,0.000000e+000,...
 3.299448e-002,8.392966e-003,2.460134e-002,0.000000e+000;...
1.800000e+002,1.332500e-001,7.567261e-003,6.594473e-003,...
 1.190888e-001,0.000000e+000,0.000000e+000,...
 3.094523e-002,7.567339e-003,2.337809e-002,0.000000e+000,...
 3.238436e-002,7.557906e-003,2.482541e-002,0.000000e+000;...
1.960600e+002,1.277211e-001,5.859659e-003,5.588902e-003,...
 1.162725e-001,0.000000e+000,0.000000e+000,...
 2.969895e-002,5.790223e-003,2.390886e-002,0.000000e+000,...
 3.122496e-002,5.852697e-003,2.537227e-002,0.000000e+000;...
2.000000e+002,1.263979e-001,5.440445e-003,5.376747e-003,...
 1.155812e-001,0.000000e+000,0.000000e+000,...
 2.947443e-002,5.440411e-003,2.403415e-002,0.000000e+000,...
 3.090541e-002,5.434350e-003,2.547138e-002,0.000000e+000;...
2.200000e+002,1.208316e-001,4.036722e-003,4.466637e-003,...
 1.123284e-001,0.000000e+000,0.000000e+000,...
 2.864292e-002,4.036763e-003,2.460624e-002,0.000000e+000,...
 3.006307e-002,4.032641e-003,2.603100e-002,0.000000e+000;...
2.345200e+002,1.173291e-001,3.330954e-003,3.961814e-003,...
 1.100370e-001,0.000000e+000,0.000000e+000,...
 2.826537e-002,3.327538e-003,2.493790e-002,0.000000e+000,...
 2.987341e-002,3.327773e-003,2.654471e-002,0.000000e+000;...
2.500000e+002,1.138181e-001,2.744767e-003,3.479242e-003,...
 1.075944e-001,0.000000e+000,0.000000e+000,...
 2.801885e-002,2.744846e-003,2.527406e-002,0.000000e+000,...
 2.965775e-002,2.742377e-003,2.691475e-002,0.000000e+000;...
2.789400e+002,1.084929e-001,1.980737e-003,2.806426e-003,...
 1.037063e-001,0.000000e+000,0.000000e+000,...
 2.783603e-002,1.975358e-003,2.586071e-002,0.000000e+000,...
 2.937492e-002,1.979224e-003,2.739614e-002,0.000000e+000;...
2.800000e+002,1.083044e-001,1.953050e-003,2.785533e-003,...
 1.035653e-001,0.000000e+000,0.000000e+000,...
 2.783187e-002,1.953008e-003,2.587890e-002,0.000000e+000,...
 2.935705e-002,1.951507e-003,2.740577e-002,0.000000e+000;...
2.993300e+002,1.053845e-001,1.598518e-003,2.449380e-003,...
 1.013367e-001,0.000000e+000,0.000000e+000,...
 2.779956e-002,1.598548e-003,2.620104e-002,0.000000e+000,...
 2.920233e-002,1.597324e-003,2.760469e-002,0.000000e+000;...
3.200000e+002,1.023763e-001,1.308465e-003,2.141424e-003,...
 9.892644e-002,0.000000e+000,0.000000e+000,...
 2.783572e-002,1.308459e-003,2.652728e-002,0.000000e+000,...
 2.908272e-002,1.307561e-003,2.777594e-002,0.000000e+000;...
3.471900e+002,9.873449e-002,1.029691e-003,1.822937e-003,...
 9.588255e-002,0.000000e+000,0.000000e+000,...
 2.795972e-002,1.028521e-003,2.693122e-002,0.000000e+000,...
 2.920057e-002,1.029064e-003,2.817178e-002,0.000000e+000;...
3.500000e+002,9.836760e-002,1.005486e-003,1.794231e-003,...
 9.556831e-002,0.000000e+000,0.000000e+000,...
 2.797696e-002,1.005487e-003,2.697149e-002,0.000000e+000,...
 2.920260e-002,1.004889e-003,2.819806e-002,0.000000e+000;...
4.000000e+002,9.284545e-002,6.914829e-004,1.377445e-003,...
 9.077656e-002,0.000000e+000,0.000000e+000,...
 2.823349e-002,6.914812e-004,2.754201e-002,0.000000e+000,...
 2.920348e-002,6.910937e-004,2.851276e-002,0.000000e+000;...
4.500000e+002,8.833737e-002,4.975877e-004,1.090467e-003,...
 8.674918e-002,0.000000e+000,0.000000e+000,...
 2.854338e-002,4.975852e-004,2.804580e-002,0.000000e+000,...
 2.902786e-002,4.973311e-004,2.853073e-002,0.000000e+000;...
4.988100e+002,8.444588e-002,3.762738e-004,8.887413e-004,...
 8.318042e-002,0.000000e+000,0.000000e+000,...
 2.886986e-002,3.760664e-004,2.849380e-002,0.000000e+000,...
 2.896501e-002,3.760911e-004,2.858889e-002,0.000000e+000;...
5.000000e+002,8.435246e-002,3.737429e-004,8.845287e-004,...
 8.309379e-002,0.000000e+000,0.000000e+000,...
 2.887800e-002,3.737446e-004,2.850426e-002,0.000000e+000,...
 2.896764e-002,3.735843e-004,2.859428e-002,0.000000e+000;...
5.500000e+002,8.075143e-002,2.922271e-004,7.317737e-004,...
 7.972717e-002,0.000000e+000,0.000000e+000,...
 2.860331e-002,2.922270e-004,2.831109e-002,0.000000e+000,...
 2.897041e-002,2.921140e-004,2.867851e-002,0.000000e+000;...
6.300000e+002,7.593080e-002,2.077218e-004,5.583976e-004,...
 7.516473e-002,0.000000e+000,0.000000e+000,...
 2.824390e-002,2.077180e-004,2.803618e-002,0.000000e+000,...
 2.873440e-002,2.076481e-004,2.852649e-002,0.000000e+000;...
7.000000e+002,7.241980e-002,1.615929e-004,4.526258e-004,...
 7.180490e-002,0.000000e+000,0.000000e+000,...
 2.797646e-002,1.615932e-004,2.781487e-002,0.000000e+000,...
 2.839008e-002,1.615432e-004,2.822829e-002,0.000000e+000;...
8.000000e+002,6.815971e-002,1.187270e-004,3.468030e-004,...
 6.769429e-002,0.000000e+000,0.000000e+000,...
 2.765560e-002,1.187255e-004,2.753687e-002,0.000000e+000,...
 2.784848e-002,1.186917e-004,2.772985e-002,0.000000e+000;...
9.000000e+002,6.438372e-002,9.218809e-005,2.741540e-004,...
 6.401682e-002,0.000000e+000,0.000000e+000,...
 2.726935e-002,9.218817e-005,2.717716e-002,0.000000e+000,...
 2.741306e-002,9.216622e-005,2.732075e-002,0.000000e+000;...
1.022000e+003,6.053639e-002,7.042054e-005,2.127156e-004,...
 6.025272e-002,0.000000e+000,0.000000e+000,...
 2.680032e-002,6.955765e-005,2.673076e-002,0.000000e+000,...
 2.679234e-002,7.040504e-005,2.672201e-002,0.000000e+000;...
1.100000e+003,5.823648e-002,6.082175e-005,1.836526e-004,...
 5.799019e-002,2.483183e-006,0.000000e+000,...
 2.629920e-002,5.946942e-005,2.623955e-002,1.760931e-007,...
 2.647734e-002,6.081066e-005,2.641653e-002,1.760791e-007;...
1.250000e+003,5.448938e-002,4.746906e-005,1.422679e-004,...
 5.425667e-002,4.241403e-005,0.000000e+000,...
 2.546198e-002,4.711915e-005,2.540712e-002,7.736443e-006,...
 2.579714e-002,4.745986e-005,2.574238e-002,7.736154e-006;...
1.400000e+003,5.143869e-002,3.862785e-005,1.134393e-004,...
 5.114993e-002,1.369530e-004,0.000000e+000,...
 2.476683e-002,3.852062e-005,2.469133e-002,3.697770e-005,...
 2.510445e-002,3.862343e-005,2.502889e-002,3.697662e-005;...
1.600000e+003,4.816719e-002,3.062745e-005,8.686978e-005,...
 4.771536e-002,3.336899e-004,0.000000e+000,...
 2.402491e-002,3.062695e-005,2.387374e-002,1.205442e-004,...
 2.423966e-002,3.062383e-005,2.408798e-002,1.205449e-004;...
1.800000e+003,4.547831e-002,2.521061e-005,6.864890e-005,...
 4.479377e-002,5.900256e-004,0.000000e+000,...
 2.340969e-002,2.521000e-005,2.313158e-002,2.528997e-004,...
 2.349962e-002,2.520743e-005,2.321959e-002,2.550128e-004;...
2.044000e+003,4.274186e-002,2.046812e-005,5.324430e-005,...
 4.171081e-002,9.566513e-004,0.000000e+000,...
 2.274896e-002,2.046812e-005,2.225016e-002,4.783274e-004,...
 2.275849e-002,2.046605e-005,2.225921e-002,4.783226e-004;...
2.200000e+003,4.119274e-002,1.837035e-005,4.596411e-005,...
 3.992559e-002,1.202337e-003,1.821748e-007,...
 2.226651e-002,1.836995e-005,2.160427e-002,6.438659e-004,...
 2.235815e-002,1.836850e-005,2.169627e-002,6.437885e-004;...
2.500000e+003,3.874676e-002,1.522183e-005,3.559755e-005,...
 3.700569e-002,1.687406e-003,2.179983e-006,...
 2.154016e-002,1.522196e-005,2.052604e-002,9.988926e-004,...
 2.169259e-002,1.522091e-005,2.067828e-002,9.975855e-004;...
2.800000e+003,3.681884e-002,1.288541e-005,2.838020e-005,...
 3.459538e-002,2.175396e-003,7.053605e-006,...
 2.101398e-002,1.288534e-005,1.961519e-002,1.385897e-003,...
 2.114855e-002,1.288448e-005,1.975065e-002,1.381345e-003;...
3.200000e+003,3.473296e-002,1.067434e-005,2.172849e-005,...
 3.186743e-002,2.815089e-003,1.720172e-005,...
 2.048044e-002,1.067433e-005,1.854202e-002,1.927743e-003,...
 2.058961e-002,1.067400e-005,1.865082e-002,1.916031e-003;...
3.500000e+003,3.341145e-002,9.462389e-006,1.816482e-005,...
 3.006691e-002,3.288998e-003,2.723534e-005,...
 2.015907e-002,9.462403e-006,1.780166e-002,2.347954e-003,...
 2.027113e-002,9.462174e-006,1.791359e-002,2.328563e-003;...
4.000000e+003,3.168568e-002,7.907151e-006,1.390762e-005,...
 2.757337e-002,4.042667e-003,4.757777e-005,...
 1.980599e-002,7.906980e-006,1.675289e-002,3.045191e-003,...
 1.986699e-002,7.906814e-006,1.681394e-002,3.009723e-003;...
4.500000e+003,3.036077e-002,6.807138e-006,1.098909e-005,...
 2.554524e-002,4.727882e-003,7.020652e-005,...
 1.950224e-002,6.807141e-006,1.578704e-002,3.708391e-003,...
 1.957132e-002,6.806818e-006,1.585632e-002,3.654083e-003;...
5.000000e+003,2.937558e-002,5.953591e-006,8.901342e-006,...
 2.385853e-002,5.406643e-003,9.478186e-005,...
 1.933844e-002,5.953591e-006,1.497032e-002,4.362167e-003,...
 1.939950e-002,5.953267e-006,1.501680e-002,4.301494e-003;...
5.500000e+003,2.857384e-002,5.297083e-006,7.356465e-006,...
 2.242831e-002,6.012363e-003,1.199891e-004,...
 1.926574e-002,5.297092e-006,1.426800e-002,4.992446e-003,...
 1.927533e-002,5.296883e-006,1.427674e-002,4.895118e-003;...
6.300000e+003,2.750372e-002,4.492456e-006,5.606908e-006,...
 2.038320e-002,6.950499e-003,1.602612e-004,...
 1.915986e-002,4.492475e-006,1.320278e-002,5.952585e-003,...
 1.920566e-002,4.492300e-006,1.324414e-002,5.822740e-003;...
7.000000e+003,2.683957e-002,3.962833e-006,4.541715e-006,...
 1.892410e-002,7.709944e-003,1.961883e-004,...
 1.913331e-002,3.962833e-006,1.240254e-002,6.726813e-003,...
 1.922482e-002,3.962663e-006,1.246911e-002,6.584140e-003;...
8.000000e+003,2.616353e-002,3.390405e-006,3.477203e-006,...
 1.722550e-002,8.684940e-003,2.454476e-004,...
 1.922734e-002,3.390405e-006,1.145761e-002,7.766340e-003,...
 1.931977e-002,3.390246e-006,1.152691e-002,7.575451e-003;...
9.000000e+003,2.572019e-002,2.960829e-006,2.747485e-006,...
 1.585252e-002,9.569909e-003,2.924989e-004,...
 1.942947e-002,2.960659e-006,1.068403e-002,8.742481e-003,...
 1.948005e-002,2.960658e-006,1.073463e-002,8.483025e-003;...
1.000000e+004,2.543143e-002,2.627733e-006,2.225505e-006,...
 1.471786e-002,1.037165e-002,3.373419e-004,...
 1.965358e-002,2.627733e-006,1.003642e-002,9.614536e-003,...
 1.967766e-002,2.627660e-006,1.006036e-002,9.311450e-003;...
1.250000e+004,2.497111e-002,2.048171e-006,1.424293e-006,...
 1.245141e-002,1.207755e-002,4.390540e-004,...
 2.017387e-002,2.048133e-006,8.695207e-003,1.147662e-002,...
 2.021381e-002,2.048090e-006,8.718607e-003,1.108998e-002;...
1.600000e+004,2.491336e-002,1.563901e-006,8.693262e-007,...
 1.034821e-002,1.400156e-002,5.612173e-004,...
 2.096023e-002,1.563901e-006,7.377942e-003,1.358072e-002,...
 2.103104e-002,1.563881e-006,7.396935e-003,1.310711e-002;...
2.000000e+004,2.514097e-002,1.230635e-006,5.563593e-007,...
 8.712287e-003,1.574942e-002,6.775713e-004,...
 2.186853e-002,1.230635e-006,6.332937e-003,1.553436e-002,...
 2.193217e-002,1.230616e-006,6.343341e-003,1.494446e-002;...
2.500000e+004,2.559280e-002,9.715141e-007,3.560774e-007,...
 7.303129e-003,1.749048e-002,7.975434e-004,...
 2.290262e-002,9.715276e-007,5.382765e-003,1.751888e-002,...
 2.295333e-002,9.715121e-007,5.412197e-003,1.677536e-002;...
3.200000e+004,2.629942e-002,7.502205e-007,2.173358e-007,...
 6.008117e-003,1.935894e-002,9.310874e-004,...
 2.406369e-002,7.502310e-007,4.496782e-003,1.956616e-002,...
 2.416381e-002,7.502236e-007,4.520846e-003,1.874028e-002;...
4.000000e+004,2.717250e-002,5.950194e-007,1.390932e-007,...
 5.036178e-003,2.107962e-002,1.056359e-003,...
 2.533217e-002,5.950194e-007,3.822096e-003,2.150948e-002,...
 2.540137e-002,5.950140e-007,3.830352e-003,2.054060e-002;...
5.000000e+004,2.808634e-002,4.727202e-007,8.901851e-008,...
 4.196221e-003,2.271028e-002,1.178658e-003,...
 2.655758e-002,4.727202e-007,3.229030e-003,2.332807e-002,...
 2.663535e-002,4.727194e-007,3.234412e-003,2.224580e-002;...
6.300000e+004,2.905964e-002,3.731653e-007,5.607077e-008,...
 3.466672e-003,2.429167e-002,1.301161e-003,...
 2.655758e-002,4.727202e-007,3.229030e-003,2.332807e-002,...
 2.788297e-002,3.731690e-007,2.705031e-003,2.389743e-002;...
8.000000e+004,3.012636e-002,2.924988e-007,3.477373e-008,...
 2.845834e-003,2.585268e-002,1.427163e-003,...
 2.655758e-002,4.727202e-007,3.229030e-003,2.332807e-002,...
 2.917431e-002,2.925015e-007,2.242727e-003,2.552232e-002;...
1.000000e+005,3.111665e-002,2.332347e-007,2.225505e-008,...
 2.366149e-003,2.721157e-002,1.538761e-003,...
 2.655758e-002,4.727202e-007,3.229030e-003,2.332807e-002,...
 3.033479e-002,2.332265e-007,1.878345e-003,2.693310e-002;...
1.250000e+005,3.200671e-002,1.860646e-007,1.424310e-008,...
 1.960354e-003,2.840568e-002,1.639913e-003,...
 2.655758e-002,4.727202e-007,3.229030e-003,2.332807e-002,...
 3.137026e-002,1.860660e-007,1.569683e-003,2.817424e-002;...
 ];
zr = interp1q(za(:,1),za(:,flag),e);
