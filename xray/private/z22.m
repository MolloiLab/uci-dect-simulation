 
function zr =z22(flag,e)

za = [9.756200e-001,6.257646e+003,6.253875e+003,3.777670e+000,...
 1.142278e-002,0.000000e+000,0.000000e+000,...
 5.806081e+003,5.833790e+003,3.088173e-005,0.000000e+000,...
 6.251757e+003,6.251757e+003,2.915801e-005,0.000000e+000;...
1.000000e+000,5.830194e+003,5.826423e+003,3.758812e+000,...
 1.182483e-002,0.000000e+000,0.000000e+000,...
 5.806081e+003,5.833790e+003,3.088173e-005,0.000000e+000,...
 5.824449e+003,5.824449e+003,3.085463e-005,0.000000e+000;...
1.100000e+000,4.616608e+003,4.612962e+003,3.682122e+000,...
 1.339308e-002,0.000000e+000,0.000000e+000,...
 4.593534e+003,4.613454e+003,3.803616e-005,0.000000e+000,...
 4.611534e+003,4.611534e+003,3.853224e-005,0.000000e+000;...
1.106700e+000,4.551107e+003,4.547335e+003,3.676842e+000,...
 1.350120e-002,0.000000e+000,0.000000e+000,...
 4.525469e+003,4.544975e+003,3.854449e-005,0.000000e+000,...
 4.546198e+003,4.546198e+003,3.905925e-005,0.000000e+000;...
1.172600e+000,3.936205e+003,3.932559e+003,3.624919e+000,...
 1.456857e-002,0.000000e+000,0.000000e+000,...
 3.905433e+003,3.921316e+003,4.374022e-005,0.000000e+000,...
 3.931547e+003,3.931547e+003,4.432899e-005,0.000000e+000;...
1.194100e+000,3.762835e+003,3.759189e+003,3.607947e+000,...
 1.491682e-002,0.000000e+000,0.000000e+000,...
 3.728772e+003,3.743663e+003,4.551267e-005,0.000000e+000,...
 3.758199e+003,3.758199e+003,4.606164e-005,0.000000e+000;...
1.250000e+000,3.329600e+003,3.326080e+003,3.554012e+000,...
 1.579938e-002,0.000000e+000,0.000000e+000,...
 3.317077e+003,3.329729e+003,5.030042e-005,0.000000e+000,...
 3.325286e+003,3.325286e+003,5.072247e-005,0.000000e+000;...
1.355400e+000,2.738962e+003,2.735442e+003,3.453687e+000,...
 1.735330e-002,0.000000e+000,0.000000e+000,...
 2.696753e+003,2.706237e+003,6.003918e-005,0.000000e+000,...
 2.734859e+003,2.734859e+003,6.027936e-005,0.000000e+000;...
1.400000e+000,2.489028e+003,2.485634e+003,3.409182e+000,...
 1.800956e-002,0.000000e+000,0.000000e+000,...
 2.482442e+003,2.490893e+003,6.407408e-005,0.000000e+000,...
 2.485054e+003,2.485054e+003,6.435022e-005,0.000000e+000;...
1.496700e+000,2.106710e+003,2.103315e+003,3.318411e+000,...
 1.945535e-002,0.000000e+000,0.000000e+000,...
 2.092596e+003,2.099257e+003,7.327516e-005,0.000000e+000,...
 2.102864e+003,2.102864e+003,7.331106e-005,0.000000e+000;...
1.509100e+000,2.064216e+003,2.060822e+003,3.306719e+000,...
 1.963011e-002,0.000000e+000,0.000000e+000,...
 2.048141e+003,2.054607e+003,7.449985e-005,0.000000e+000,...
 2.060481e+003,2.060481e+003,7.455651e-005,0.000000e+000;...
1.600000e+000,1.763491e+003,1.760222e+003,3.224497e+000,...
 2.088606e-002,0.000000e+000,0.000000e+000,...
 1.757249e+003,1.762481e+003,8.378917e-005,0.000000e+000,...
 1.759912e+003,1.759912e+003,8.388217e-005,0.000000e+000;...
1.697100e+000,1.516323e+003,1.513180e+003,3.137121e+000,...
 2.223253e-002,0.000000e+000,0.000000e+000,...
 1.505971e+003,1.510198e+003,9.431766e-005,0.000000e+000,...
 1.512817e+003,1.512817e+003,9.389171e-005,0.000000e+000;...
1.706100e+000,1.496334e+003,1.493191e+003,3.128949e+000,...
 2.235323e-002,0.000000e+000,0.000000e+000,...
 1.485161e+003,1.489307e+003,9.532519e-005,0.000000e+000,...
 1.492829e+003,1.492829e+003,9.494695e-005,0.000000e+000;...
1.800000e+000,1.293545e+003,1.290528e+003,3.048236e+000,...
 2.354884e-002,0.000000e+000,0.000000e+000,...
 1.289237e+003,1.292648e+003,1.059694e-004,0.000000e+000,...
 1.290259e+003,1.290259e+003,1.074315e-004,0.000000e+000;...
1.897400e+000,1.140128e+003,1.137136e+003,2.966769e+000,...
 2.478467e-002,0.000000e+000,0.000000e+000,...
 1.121752e+003,1.124567e+003,1.171160e-004,0.000000e+000,...
 1.136891e+003,1.136891e+003,1.203362e-004,0.000000e+000;...
2.000000e+000,9.784126e+002,9.755084e+002,2.880147e+000,...
 2.608840e-002,0.000000e+000,0.000000e+000,...
 9.761079e+002,9.784315e+002,1.294263e-004,0.000000e+000,...
 9.753524e+002,9.753524e+002,1.339207e-004,0.000000e+000;...
2.143600e+000,8.219149e+002,8.191113e+002,2.767752e+000,...
 2.790633e-002,0.000000e+000,0.000000e+000,...
 8.120475e+002,8.138506e+002,1.476299e-004,0.000000e+000,...
 8.189936e+002,8.189936e+002,1.528574e-004,0.000000e+000;...
2.200000e+000,7.604246e+002,7.576713e+002,2.722367e+000,...
 2.862043e-002,0.000000e+000,0.000000e+000,...
 7.579630e+002,7.596027e+002,1.550888e-004,0.000000e+000,...
 7.575691e+002,7.575691e+002,1.602823e-004,0.000000e+000;...
2.345200e+000,6.472630e+002,6.446228e+002,2.615504e+000,...
 3.045345e-002,0.000000e+000,0.000000e+000,...
 6.391808e+002,6.404778e+002,1.750894e-004,0.000000e+000,...
 6.445352e+002,6.445352e+002,1.793710e-004,0.000000e+000;...
2.387300e+000,6.184603e+002,6.158453e+002,2.584576e+000,...
 3.098525e-002,0.000000e+000,0.000000e+000,...
 6.092505e+002,6.104648e+002,1.811028e-004,0.000000e+000,...
 6.157584e+002,6.157584e+002,1.848991e-004,0.000000e+000;...
2.500000e+000,5.413932e+002,5.388661e+002,2.502857e+000,...
 3.240841e-002,0.000000e+000,0.000000e+000,...
 5.380182e+002,5.390421e+002,1.976720e-004,0.000000e+000,...
 5.387930e+002,5.387930e+002,1.996740e-004,0.000000e+000;...
2.528300e+000,5.262941e+002,5.237796e+002,2.484125e+000,...
 3.276420e-002,0.000000e+000,0.000000e+000,...
 5.219387e+002,5.229208e+002,2.019403e-004,0.000000e+000,...
 5.237104e+002,5.237104e+002,2.033806e-004,0.000000e+000;...
2.645800e+000,4.675697e+002,4.651307e+002,2.406681e+000,...
 3.424268e-002,0.000000e+000,0.000000e+000,...
 4.612699e+002,4.620992e+002,2.195574e-004,0.000000e+000,...
 4.650543e+002,4.650543e+002,2.187325e-004,0.000000e+000;...
2.668800e+000,4.570594e+002,4.546330e+002,2.391469e+000,...
 3.451550e-002,0.000000e+000,0.000000e+000,...
 4.505363e+002,4.513393e+002,2.230845e-004,0.000000e+000,...
 4.545757e+002,4.545757e+002,2.227816e-004,0.000000e+000;...
2.800000e+000,3.972287e+002,3.948903e+002,2.300572e+000,...
 3.604049e-002,0.000000e+000,0.000000e+000,...
 3.953979e+002,3.960695e+002,2.436940e-004,0.000000e+000,...
 3.948474e+002,3.948474e+002,2.468849e-004,0.000000e+000;...
2.941700e+000,3.504352e+002,3.481974e+002,2.210681e+000,...
 3.767236e-002,0.000000e+000,0.000000e+000,...
 3.457081e+002,3.462669e+002,2.668836e-004,0.000000e+000,...
 3.481460e+002,3.481460e+002,2.726854e-004,0.000000e+000;...
3.000000e+000,3.314891e+002,3.292764e+002,2.174222e+000,...
 3.834371e-002,0.000000e+000,0.000000e+000,...
 3.277361e+002,3.282555e+002,2.767034e-004,0.000000e+000,...
 3.292364e+002,3.292364e+002,2.832673e-004,0.000000e+000;...
3.200000e+000,2.761843e+002,2.740974e+002,2.049130e+000,...
 4.064818e-002,0.000000e+000,0.000000e+000,...
 2.747034e+002,2.751115e+002,3.115844e-004,0.000000e+000,...
 2.740708e+002,2.740639e+002,3.194039e-004,0.000000e+000;...
3.500000e+000,2.166302e+002,2.147318e+002,1.861805e+000,...
 4.406528e-002,0.000000e+000,0.000000e+000,...
 2.149606e+002,2.152523e+002,3.669980e-004,0.000000e+000,...
 2.147074e+002,2.147074e+002,3.728760e-004,0.000000e+000;...
4.000000e+000,1.507146e+002,1.491053e+002,1.561457e+000,...
 4.935814e-002,0.000000e+000,0.000000e+000,...
 1.489313e+002,1.491078e+002,4.651707e-004,0.000000e+000,...
 1.490969e+002,1.490969e+002,4.780892e-004,0.000000e+000;...
4.242600e+000,1.287888e+002,1.273304e+002,1.405060e+000,...
 5.177073e-002,0.000000e+000,0.000000e+000,...
 1.263580e+002,1.264991e+002,5.153747e-004,0.000000e+000,...
 1.273220e+002,1.273220e+002,5.330868e-004,0.000000e+000;...
4.269100e+000,1.267018e+002,1.252573e+002,1.387208e+000,...
 5.203474e-002,0.000000e+000,0.000000e+000,...
 1.241806e+002,1.243184e+002,5.209909e-004,0.000000e+000,...
 1.252469e+002,1.252469e+002,5.390648e-004,0.000000e+000;...
4.500000e+000,1.084509e+002,1.071899e+002,1.207326e+000,...
 5.433041e-002,0.000000e+000,0.000000e+000,...
 1.072000e+002,1.073127e+002,5.710155e-004,0.000000e+000,...
 1.071806e+002,1.071806e+002,5.907000e-004,0.000000e+000;...
4.632700e+000,1.009566e+002,9.982262e+001,1.077607e+000,...
 5.562283e-002,0.000000e+000,0.000000e+000,...
 9.884637e+001,9.894720e+001,6.006443e-004,0.000000e+000,...
 9.981715e+001,9.981715e+001,6.198991e-004,0.000000e+000;...
4.743400e+000,9.466805e+001,9.367738e+001,9.340581e-001,...
 5.670151e-002,0.000000e+000,0.000000e+000,...
 9.254042e+001,9.263255e+001,6.258463e-004,0.000000e+000,...
 9.367061e+001,9.367061e+001,6.441132e-004,0.000000e+000;...
4.800700e+000,9.150114e+001,9.060978e+001,8.339715e-001,...
 5.725972e-002,0.000000e+000,0.000000e+000,...
 8.948987e+001,8.957785e+001,6.390648e-004,0.000000e+000,...
 9.060261e+001,9.060261e+001,6.566131e-004,0.000000e+000;...
4.841600e+000,8.920924e+001,8.842097e+001,7.293841e-001,...
 5.765826e-002,0.000000e+000,0.000000e+000,...
 8.739542e+001,8.748058e+001,6.485712e-004,0.000000e+000,...
 8.841782e+001,8.841327e+001,6.655335e-004,0.000000e+000;...
4.872900e+000,8.742903e+001,8.675014e+001,6.219428e-001,...
 5.796250e-002,0.000000e+000,0.000000e+000,...
 8.583733e+001,8.592042e+001,6.558869e-004,0.000000e+000,...
 8.674244e+001,8.674244e+001,6.723330e-004,0.000000e+000;...
4.904900e+000,8.561864e+001,8.503907e+001,5.214538e-001,...
 5.827429e-002,0.000000e+000,0.000000e+000,...
 8.428311e+001,8.436414e+001,6.634014e-004,0.000000e+000,...
 8.503139e+001,8.503139e+001,6.792632e-004,0.000000e+000;...
4.940600e+000,8.371272e+001,8.312811e+001,5.252631e-001,...
 5.862253e-002,0.000000e+000,0.000000e+000,...
 8.259332e+001,8.267212e+001,6.718289e-004,0.000000e+000,...
 8.312408e+001,8.312408e+001,6.870164e-004,0.000000e+000;...
4.940600e+000,6.893670e+002,6.887761e+002,5.252631e-001,...
 5.862253e-002,0.000000e+000,0.000000e+000,...
 6.876431e+002,6.883042e+002,6.718524e-004,0.000000e+000,...
 5.685161e+002,5.685161e+002,6.870164e-004,0.000000e+000;...
4.941500e+000,6.892036e+002,6.886127e+002,5.263946e-001,...
 5.863133e-002,0.000000e+000,0.000000e+000,...
 6.875042e+002,6.881649e+002,6.720419e-004,0.000000e+000,...
 5.684126e+002,5.684126e+002,6.872033e-004,0.000000e+000;...
4.981000e+000,6.822763e+002,6.815094e+002,7.080240e-001,...
 5.901604e-002,0.000000e+000,0.000000e+000,...
 6.807051e+002,6.813541e+002,6.814198e-004,0.000000e+000,...
 5.633301e+002,5.632859e+002,6.957717e-004,0.000000e+000;...
5.000000e+000,6.789698e+002,6.781024e+002,8.107131e-001,...
 5.920085e-002,0.000000e+000,0.000000e+000,...
 6.774778e+002,6.781212e+002,6.859510e-004,0.000000e+000,...
 5.608370e+002,5.608370e+002,6.998679e-004,0.000000e+000;...
5.003000e+000,6.785047e+002,6.776246e+002,8.284272e-001,...
 5.922977e-002,0.000000e+000,0.000000e+000,...
 6.769709e+002,6.776135e+002,6.866675e-004,0.000000e+000,...
 5.605007e+002,5.605007e+002,7.005489e-004,0.000000e+000;...
5.064600e+000,6.689625e+002,6.678561e+002,1.047220e+000,...
 5.982191e-002,0.000000e+000,0.000000e+000,...
 6.667068e+002,6.673320e+002,7.014505e-004,0.000000e+000,...
 5.535529e+002,5.535529e+002,7.137302e-004,0.000000e+000;...
5.201300e+000,6.433530e+002,6.420330e+002,1.257036e+000,...
 6.113570e-002,0.000000e+000,0.000000e+000,...
 6.399138e+002,6.404979e+002,7.344293e-004,0.000000e+000,...
 5.345580e+002,5.345580e+002,7.429522e-004,0.000000e+000;...
5.350400e+000,6.037006e+002,6.022673e+002,1.378533e+000,...
 6.238788e-002,0.000000e+000,0.000000e+000,...
 5.996207e+002,6.001526e+002,7.697245e-004,0.000000e+000,...
 5.040999e+002,5.040999e+002,7.824768e-004,0.000000e+000;...
5.500000e+000,5.619737e+002,5.604651e+002,1.449440e+000,...
 6.364509e-002,0.000000e+000,0.000000e+000,...
 5.599794e+002,5.604626e+002,8.054721e-004,0.000000e+000,...
 4.714858e+002,4.714858e+002,8.217861e-004,0.000000e+000;...
5.886400e+000,4.598127e+002,4.582537e+002,1.501111e+000,...
 6.680447e-002,0.000000e+000,0.000000e+000,...
 4.575894e+002,4.579580e+002,9.007187e-004,0.000000e+000,...
 3.903570e+002,3.903570e+002,9.206243e-004,0.000000e+000;...
6.000000e+000,4.364285e+002,4.348570e+002,1.503123e+000,...
 6.773355e-002,0.000000e+000,0.000000e+000,...
 4.323015e+002,4.326431e+002,9.295109e-004,0.000000e+000,...
 3.716960e+002,3.716960e+002,9.492291e-004,0.000000e+000;...
6.300000e+000,3.756046e+002,3.740331e+002,1.508654e+000,...
 7.018637e-002,0.000000e+000,0.000000e+000,...
 3.737558e+002,3.740368e+002,1.007244e-003,0.000000e+000,...
 3.223271e+002,3.223271e+002,1.024159e-003,0.000000e+000;...
6.569100e+000,3.368322e+002,3.352858e+002,1.470184e+000,...
 7.233243e-002,0.000000e+000,0.000000e+000,...
 3.328080e+002,3.330477e+002,1.076596e-003,0.000000e+000,...
 2.908323e+002,2.908323e+002,1.089670e-003,0.000000e+000;...
6.876000e+000,2.989147e+002,2.974060e+002,1.436113e+000,...
 7.437289e-002,0.000000e+000,0.000000e+000,...
 2.954625e+002,2.956656e+002,1.155466e-003,0.000000e+000,...
 2.596947e+002,2.596947e+002,1.179516e-003,0.000000e+000;...
7.000000e+000,2.836396e+002,2.821435e+002,1.417632e+000,...
 7.519761e-002,0.000000e+000,0.000000e+000,...
 2.820125e+002,2.822028e+002,1.187890e-003,0.000000e+000,...
 2.469824e+002,2.469824e+002,1.215293e-003,0.000000e+000;...
7.483300e+000,2.388326e+002,2.373993e+002,1.354143e+000,...
 7.828784e-002,0.000000e+000,0.000000e+000,...
 2.369652e+002,2.371143e+002,1.317261e-003,0.000000e+000,...
 2.096769e+002,2.096739e+002,1.349643e-003,0.000000e+000;...
7.695100e+000,2.231551e+002,2.217470e+002,1.323593e+000,...
 7.964186e-002,0.000000e+000,0.000000e+000,...
 2.203369e+002,2.204716e+002,1.375435e-003,0.000000e+000,...
 1.965522e+002,1.965494e+002,1.407240e-003,0.000000e+000;...
8.000000e+000,2.005756e+002,1.992052e+002,1.282985e+000,...
 8.159180e-002,0.000000e+000,0.000000e+000,...
 1.991110e+002,1.992279e+002,1.460731e-003,0.000000e+000,...
 1.774064e+002,1.774036e+002,1.488932e-003,0.000000e+000;...
8.422199e+000,1.781218e+002,1.768143e+002,1.227014e+000,...
 8.418165e-002,0.000000e+000,0.000000e+000,...
 1.741190e+002,1.742157e+002,1.577450e-003,0.000000e+000,...
 1.584051e+002,1.584051e+002,1.597912e-003,0.000000e+000;...
8.761000e+000,1.602945e+002,1.590247e+002,1.185601e+000,...
 8.618691e-002,0.000000e+000,0.000000e+000,...
 1.571004e+002,1.571839e+002,1.673175e-003,0.000000e+000,...
 1.430901e+002,1.430901e+002,1.686439e-003,0.000000e+000;...
9.000000e+000,1.477601e+002,1.465155e+002,1.156811e+000,...
 8.739635e-002,0.000000e+000,0.000000e+000,...
 1.464454e+002,1.465210e+002,1.741816e-003,0.000000e+000,...
 1.322173e+002,1.322173e+002,1.755384e-003,0.000000e+000;...
9.321400e+000,1.354017e+002,1.341948e+002,1.121458e+000,...
 8.897037e-002,0.000000e+000,0.000000e+000,...
 1.329761e+002,1.330421e+002,1.835546e-003,0.000000e+000,...
 1.215336e+002,1.215336e+002,1.845264e-003,0.000000e+000;...
9.486800e+000,1.292414e+002,1.280470e+002,1.103379e+000,...
 8.978002e-002,0.000000e+000,0.000000e+000,...
 1.265561e+002,1.266176e+002,1.882728e-003,0.000000e+000,...
 1.161828e+002,1.161804e+002,1.890733e-003,0.000000e+000;...
1.000000e+001,1.103090e+002,1.091700e+002,1.047320e+000,...
 9.229193e-002,0.000000e+000,0.000000e+000,...
 1.091219e+002,1.091718e+002,2.031438e-003,0.000000e+000,...
 9.956828e+001,9.956608e+001,2.029031e-003,0.000000e+000;...
1.003200e+001,1.094944e+002,1.083578e+002,1.044114e+000,...
 9.241639e-002,0.000000e+000,0.000000e+000,...
 1.081458e+002,1.081950e+002,2.039537e-003,0.000000e+000,...
 9.885327e+001,9.885108e+001,2.039092e-003,0.000000e+000;...
1.100000e+001,8.452361e+001,8.348013e+001,9.465674e-001,...
 9.622826e-002,0.000000e+000,0.000000e+000,...
 8.346231e+001,8.349608e+001,2.287508e-003,0.000000e+000,...
 7.680416e+001,7.680216e+001,2.337605e-003,0.000000e+000;...
1.103700e+001,8.381203e+001,8.277232e+001,9.431604e-001,...
 9.636655e-002,0.000000e+000,0.000000e+000,...
 8.267772e+001,8.271101e+001,2.297096e-003,0.000000e+000,...
 7.617548e+001,7.617149e+001,2.348528e-003,0.000000e+000;...
1.172600e+001,7.072446e+001,6.974006e+001,8.854292e-001,...
 9.891114e-002,0.000000e+000,0.000000e+000,...
 6.973009e+001,6.975586e+001,2.477064e-003,0.000000e+000,...
 6.450330e+001,6.449954e+001,2.543953e-003,0.000000e+000;...
1.250000e+001,5.918954e+001,5.826674e+001,8.221285e-001,...
 1.017713e-001,0.000000e+000,0.000000e+000,...
 5.825616e+001,5.827562e+001,2.682350e-003,0.000000e+000,...
 5.415683e+001,5.415506e+001,2.754009e-003,0.000000e+000;...
1.322900e+001,5.139356e+001,5.051855e+001,7.708846e-001,...
 1.041613e-001,0.000000e+000,0.000000e+000,...
 4.967199e+001,4.968695e+001,2.878584e-003,0.000000e+000,...
 4.715311e+001,4.714978e+001,2.935081e-003,0.000000e+000;...
1.400000e+001,4.319026e+001,4.236427e+001,7.188109e-001,...
 1.064859e-001,0.000000e+000,0.000000e+000,...
 4.235804e+001,4.236934e+001,3.081388e-003,0.000000e+000,...
 3.969477e+001,3.969163e+001,3.193675e-003,0.000000e+000;...
1.488200e+001,3.652578e+001,3.575008e+001,6.669509e-001,...
 1.087212e-001,0.000000e+000,0.000000e+000,...
 3.567205e+001,3.568013e+001,3.307945e-003,0.000000e+000,...
 3.363168e+001,3.362872e+001,3.475357e-003,0.000000e+000;...
1.500000e+001,3.568973e+001,3.492032e+001,6.606271e-001,...
 1.090191e-001,0.000000e+000,0.000000e+000,...
 3.488860e+001,3.489631e+001,3.338423e-003,0.000000e+000,...
 3.286784e+001,3.286491e+001,3.511601e-003,0.000000e+000;...
1.589800e+001,3.040818e+001,2.968403e+001,6.123879e-001,...
 1.112947e-001,0.000000e+000,0.000000e+000,...
 2.961402e+001,2.961929e+001,3.571613e-003,0.000000e+000,...
 2.803666e+001,2.803389e+001,3.780156e-003,0.000000e+000;...
1.600000e+001,2.980849e+001,2.908937e+001,6.071579e-001,...
 1.115537e-001,0.000000e+000,0.000000e+000,...
 2.908487e+001,2.908990e+001,3.598238e-003,0.000000e+000,...
 2.748623e+001,2.748210e+001,3.809884e-003,0.000000e+000;...
1.697100e+001,2.550003e+001,2.482491e+001,5.615840e-001,...
 1.138192e-001,0.000000e+000,0.000000e+000,...
 2.463402e+001,2.463707e+001,3.853039e-003,0.000000e+000,...
 2.353458e+001,2.353068e+001,4.076662e-003,0.000000e+000;...
1.732100e+001,2.395492e+001,2.329488e+001,5.460700e-001,...
 1.146364e-001,0.000000e+000,0.000000e+000,...
 2.325641e+001,2.325884e+001,3.945468e-003,0.000000e+000,...
 2.210655e+001,2.210273e+001,4.169648e-003,0.000000e+000;...
1.800000e+001,2.140529e+001,2.077165e+001,5.170661e-001,...
 1.162230e-001,0.000000e+000,0.000000e+000,...
 2.077156e+001,2.077291e+001,4.125637e-003,0.000000e+000,...
 1.975404e+001,1.975037e+001,4.345448e-003,0.000000e+000;...
1.897400e+001,1.866960e+001,1.807117e+001,4.803052e-001,...
 1.180887e-001,0.000000e+000,0.000000e+000,...
 1.779171e+001,1.779178e+001,4.374299e-003,0.000000e+000,...
 1.723086e+001,1.722738e+001,4.571988e-003,0.000000e+000;...
2.000000e+001,1.580315e+001,1.523992e+001,4.438461e-001,...
 1.200549e-001,0.000000e+000,0.000000e+000,...
 1.524106e+001,1.524005e+001,4.629028e-003,0.000000e+000,...
 1.456938e+001,1.456388e+001,4.901211e-003,0.000000e+000;...
2.094100e+001,1.401917e+001,1.348360e+001,4.144399e-001,...
 1.214177e-001,0.000000e+000,0.000000e+000,...
 1.331469e+001,1.331285e+001,4.863512e-003,0.000000e+000,...
 1.291861e+001,1.291335e+001,5.188270e-003,0.000000e+000;...
2.097600e+001,1.395128e+001,1.341696e+001,4.134215e-001,...
 1.214693e-001,0.000000e+000,0.000000e+000,...
 1.324951e+001,1.324763e+001,4.872249e-003,0.000000e+000,...
 1.285505e+001,1.284980e+001,5.199040e-003,0.000000e+000;...
2.200000e+001,1.202133e+001,1.151430e+001,3.840782e-001,...
 1.229528e-001,0.000000e+000,0.000000e+000,...
 1.151775e+001,1.151511e+001,5.128348e-003,0.000000e+000,...
 1.105627e+001,1.105026e+001,5.494093e-003,0.000000e+000;...
2.218300e+001,1.176851e+001,1.126613e+001,3.792128e-001,...
 1.231967e-001,0.000000e+000,0.000000e+000,...
 1.124076e+001,1.123799e+001,5.174211e-003,0.000000e+000,...
 1.082108e+001,1.081612e+001,5.544191e-003,0.000000e+000;...
2.345200e+001,1.001910e+001,9.546388e+000,3.478580e-001,...
 1.248864e-001,0.000000e+000,0.000000e+000,...
 9.545697e+000,9.542136e+000,5.493007e-003,0.000000e+000,...
 9.191518e+000,9.185600e+000,5.879006e-003,0.000000e+000;...
2.388200e+001,9.548776e+000,9.085116e+000,3.382151e-001,...
 1.254597e-001,0.000000e+000,0.000000e+000,...
 9.049493e+000,9.045691e+000,5.601328e-003,0.000000e+000,...
 8.754036e+000,8.748040e+000,5.987681e-003,0.000000e+000;...
2.500000e+001,8.345624e+000,7.904594e+000,3.140515e-001,...
 1.269533e-001,0.000000e+000,0.000000e+000,...
 7.909284e+000,7.904902e+000,5.883639e-003,0.000000e+000,...
 7.630308e+000,7.624053e+000,6.260793e-003,0.000000e+000;...
2.762400e+001,6.337731e+000,5.941206e+000,2.672581e-001,...
 1.292162e-001,0.000000e+000,0.000000e+000,...
 5.896291e+000,5.890813e+000,6.490050e-003,0.000000e+000,...
 5.757380e+000,5.750363e+000,6.978545e-003,0.000000e+000;...
2.800000e+001,6.051464e+000,5.660471e+000,2.613995e-001,...
 1.295431e-001,0.000000e+000,0.000000e+000,...
 5.666376e+000,5.660764e+000,6.572135e-003,0.000000e+000,...
 5.488200e+000,5.481120e+000,7.088735e-003,0.000000e+000;...
2.993300e+001,5.019167e+000,4.653696e+000,2.346712e-001,...
 1.307500e-001,0.000000e+000,0.000000e+000,...
 4.656211e+000,4.649956e+000,6.992944e-003,0.000000e+000,...
 4.523391e+000,4.515812e+000,7.597731e-003,0.000000e+000;...
3.000000e+001,4.984342e+000,4.619751e+000,2.338665e-001,...
 1.308003e-001,0.000000e+000,0.000000e+000,...
 4.625700e+000,4.619424e+000,7.007494e-003,0.000000e+000,...
 4.490602e+000,4.482966e+000,7.615271e-003,0.000000e+000;...
3.178800e+001,4.227501e+000,3.883276e+000,2.122677e-001,...
 1.319192e-001,0.000000e+000,0.000000e+000,...
 3.880484e+000,3.873667e+000,7.394975e-003,0.000000e+000,...
 3.782840e+000,3.774802e+000,8.043376e-003,0.000000e+000;...
3.200000e+001,4.137988e+000,3.796026e+000,2.099670e-001,...
 1.320575e-001,0.000000e+000,0.000000e+000,...
 3.803021e+000,3.796144e+000,7.440813e-003,0.000000e+000,...
 3.698720e+000,3.690598e+000,8.092648e-003,0.000000e+000;...
3.430900e+001,3.419491e+000,3.098902e+000,1.872994e-001,...
 1.333650e-001,0.000000e+000,0.000000e+000,...
 3.078778e+000,3.071264e+000,7.938723e-003,0.000000e+000,...
 3.027230e+000,3.018627e+000,8.584846e-003,0.000000e+000;...
3.500000e+001,3.205262e+000,2.890330e+000,1.812522e-001,...
 1.337674e-001,0.000000e+000,0.000000e+000,...
 2.898234e+000,2.890539e+000,8.087267e-003,0.000000e+000,...
 2.825613e+000,2.816929e+000,8.723726e-003,0.000000e+000;...
3.911500e+001,2.360038e+000,2.074274e+000,1.508780e-001,...
 1.349743e-001,0.000000e+000,0.000000e+000,...
 2.070091e+000,2.061373e+000,8.967723e-003,0.000000e+000,...
 2.036748e+000,2.027118e+000,9.650747e-003,0.000000e+000;...
4.000000e+001,2.206281e+000,1.925671e+000,1.453337e-001,...
 1.352383e-001,0.000000e+000,0.000000e+000,...
 1.934700e+000,1.925772e+000,9.156205e-003,0.000000e+000,...
 1.892841e+000,1.882985e+000,9.855176e-003,0.000000e+000;...
4.242600e+001,1.876640e+000,1.609231e+000,1.317181e-001,...
 1.356783e-001,0.000000e+000,0.000000e+000,...
 1.618885e+000,1.609393e+000,9.671398e-003,0.000000e+000,...
 1.585970e+000,1.575638e+000,1.035750e-002,0.000000e+000;...
4.500000e+001,1.600179e+000,1.344840e+000,1.191950e-001,...
 1.361561e-001,0.000000e+000,0.000000e+000,...
 1.354921e+000,1.344911e+000,1.015182e-002,0.000000e+000,...
 1.329075e+000,1.318257e+000,1.083945e-002,0.000000e+000;...
5.000000e+001,1.211374e+000,9.754078e-001,9.969313e-002,...
 1.362692e-001,0.000000e+000,0.000000e+000,...
 9.864724e-001,9.754971e-001,1.106791e-002,0.000000e+000,...
 9.699560e-001,9.580617e-001,1.188943e-002,0.000000e+000;...
5.500000e+001,9.501504e-001,7.294595e-001,8.470842e-002,...
 1.359800e-001,0.000000e+000,0.000000e+000,...
 7.414044e-001,7.294996e-001,1.196763e-002,0.000000e+000,...
 7.305567e-001,7.176612e-001,1.287145e-002,0.000000e+000;...
5.868100e+001,8.154277e-001,6.039017e-001,7.573696e-002,...
 1.357789e-001,0.000000e+000,0.000000e+000,...
 6.113004e-001,5.987502e-001,1.259867e-002,0.000000e+000,...
 6.082314e-001,5.947561e-001,1.348289e-002,0.000000e+000;...
6.184100e+001,7.160073e-001,5.112829e-001,6.911648e-002,...
 1.356154e-001,0.000000e+000,0.000000e+000,...
 5.223999e-001,5.093069e-001,1.313215e-002,0.000000e+000,...
 5.178835e-001,5.039213e-001,1.394759e-002,0.000000e+000;...
6.300000e+001,6.831689e-001,4.807076e-001,6.689624e-002,...
 1.355652e-001,0.000000e+000,0.000000e+000,...
 4.940096e-001,4.807195e-001,1.332638e-002,0.000000e+000,...
 4.880428e-001,4.739179e-001,1.410671e-002,0.000000e+000;...
7.000000e+001,5.368295e-001,3.463493e-001,5.553357e-002,...
 1.349491e-001,0.000000e+000,0.000000e+000,...
 3.607987e-001,3.463690e-001,1.445323e-002,0.000000e+000,...
 3.570170e-001,3.419446e-001,1.506042e-002,0.000000e+000;...
7.910800e+001,4.153954e-001,2.377262e-001,4.458702e-002,...
 1.330759e-001,0.000000e+000,0.000000e+000,...
 2.524676e-001,2.367411e-001,1.574072e-002,0.000000e+000,...
 2.515131e-001,2.350603e-001,1.645411e-002,0.000000e+000;...
8.000000e+001,4.051994e-001,2.286240e-001,4.368434e-002,...
 1.328873e-001,0.000000e+000,0.000000e+000,...
 2.444760e-001,2.286253e-001,1.586433e-002,0.000000e+000,...
 2.426514e-001,2.260848e-001,1.656773e-002,0.000000e+000;...
8.743800e+001,3.429925e-001,1.742999e-001,3.713804e-002,...
 1.315546e-001,0.000000e+000,0.000000e+000,...
 1.902054e-001,1.733353e-001,1.687948e-002,0.000000e+000,...
 1.899546e-001,1.725275e-001,1.742556e-002,0.000000e+000;...
9.000000e+001,3.247378e-001,1.584213e-001,3.522079e-002,...
 1.310895e-001,0.000000e+000,0.000000e+000,...
 1.756416e-001,1.584270e-001,1.722303e-002,0.000000e+000,...
 1.745350e-001,1.568600e-001,1.767646e-002,0.000000e+000;...
1.000000e+002,2.726264e-001,1.141083e-001,2.901519e-002,...
 1.295054e-001,0.000000e+000,0.000000e+000,...
 1.326442e-001,1.141130e-001,1.853665e-002,0.000000e+000,...
 1.316101e-001,1.130947e-001,1.851652e-002,0.000000e+000;...
1.100000e+002,2.361170e-001,8.480271e-002,2.429939e-002,...
 1.270161e-001,0.000000e+000,0.000000e+000,...
 1.039482e-001,8.480524e-002,1.914665e-002,0.000000e+000,...
 1.037665e-001,8.411695e-002,1.964918e-002,0.000000e+000;...
1.250000e+002,1.997710e-001,5.695421e-002,1.908825e-002,...
 1.237335e-001,0.000000e+000,0.000000e+000,...
 7.694969e-002,5.695544e-002,1.999641e-002,0.000000e+000,...
 7.742907e-002,5.654801e-002,2.088106e-002,0.000000e+000;...
1.390200e+002,1.777069e-001,4.100271e-002,1.562211e-002,...
 1.210846e-001,0.000000e+000,0.000000e+000,...
 6.163613e-002,4.090581e-002,2.073172e-002,0.000000e+000,...
 6.243357e-002,4.073987e-002,2.169371e-002,0.000000e+000;...
1.400000e+002,1.763114e-001,4.002083e-002,1.538953e-002,...
 1.208998e-001,0.000000e+000,0.000000e+000,...
 6.080088e-002,4.002099e-002,2.078124e-002,0.000000e+000,...
 6.150566e-002,3.976715e-002,2.174009e-002,0.000000e+000;...
1.496700e+002,1.652102e-001,3.254041e-002,1.356783e-002,...
 1.190969e-001,0.000000e+000,0.000000e+000,...
 5.372067e-002,3.250747e-002,2.121423e-002,0.000000e+000,...
 5.446932e-002,3.234576e-002,2.212209e-002,0.000000e+000;...
1.600000e+002,1.555800e-001,2.648443e-002,1.192151e-002,...
 1.171684e-001,0.000000e+000,0.000000e+000,...
 4.813211e-002,2.648472e-002,2.164818e-002,0.000000e+000,...
 4.911482e-002,2.633673e-002,2.277808e-002,0.000000e+000;...
1.747500e+002,1.447805e-001,2.031529e-002,1.006574e-002,...
 1.144013e-001,0.000000e+000,0.000000e+000,...
 4.238076e-002,2.020590e-002,2.217540e-002,0.000000e+000,...
 4.374406e-002,2.021264e-002,2.353141e-002,0.000000e+000;...
1.800000e+002,1.413735e-001,1.845084e-002,9.507665e-003,...
 1.134169e-001,0.000000e+000,0.000000e+000,...
 4.080296e-002,1.845155e-002,2.235189e-002,0.000000e+000,...
 4.209373e-002,1.836025e-002,2.373470e-002,0.000000e+000;...
2.000000e+002,1.312781e-001,1.336039e-002,7.758883e-003,...
 1.101619e-001,0.000000e+000,0.000000e+000,...
 3.632808e-002,1.336102e-002,2.296739e-002,0.000000e+000,...
 3.766520e-002,1.330176e-002,2.436344e-002,0.000000e+000;...
2.200000e+002,1.235588e-001,9.980754e-003,6.450251e-003,...
 1.071283e-001,0.000000e+000,0.000000e+000,...
 3.349567e-002,9.980815e-003,2.351507e-002,0.000000e+000,...
 3.484682e-002,9.940229e-003,2.490689e-002,0.000000e+000;...
2.365400e+002,1.182923e-001,8.017617e-003,5.602262e-003,...
 1.046729e-001,0.000000e+000,0.000000e+000,...
 3.190824e-002,7.995082e-003,2.391331e-002,0.000000e+000,...
 3.344192e-002,7.987399e-003,2.545508e-002,0.000000e+000;...
2.500000e+002,1.144541e-001,6.749467e-003,5.029099e-003,...
 1.026752e-001,0.000000e+000,0.000000e+000,...
 3.094483e-002,6.749438e-003,2.419552e-002,0.000000e+000,...
 3.248106e-002,6.725375e-003,2.575595e-002,0.000000e+000;...
2.710800e+002,1.096678e-001,5.359369e-003,4.299539e-003,...
 1.000087e-001,0.000000e+000,0.000000e+000,...
 2.991949e-002,5.305255e-003,2.461433e-002,0.000000e+000,...
 3.147632e-002,5.341743e-003,2.613384e-002,0.000000e+000;...
2.800000e+002,1.077368e-001,4.826311e-003,4.029741e-003,...
 9.888097e-002,0.000000e+000,0.000000e+000,...
 2.958512e-002,4.826295e-003,2.475891e-002,0.000000e+000,...
 3.104154e-002,4.810887e-003,2.623034e-002,0.000000e+000;...
2.993300e+002,1.043159e-001,3.971030e-003,3.560676e-003,...
 9.678394e-002,0.000000e+000,0.000000e+000,...
 2.903048e-002,3.970857e-003,2.505969e-002,0.000000e+000,...
 3.038504e-002,3.959210e-003,2.642539e-002,0.000000e+000;...
3.200000e+002,1.008787e-001,3.269757e-003,3.100662e-003,...
 9.450839e-002,0.000000e+000,0.000000e+000,...
 2.863389e-002,3.269730e-003,2.536421e-002,0.000000e+000,...
 2.985270e-002,3.260669e-003,2.659210e-002,0.000000e+000;...
3.487800e+002,9.662051e-002,2.549877e-003,2.617264e-003,...
 9.145337e-002,0.000000e+000,0.000000e+000,...
 2.830752e-002,2.545147e-003,2.576241e-002,0.000000e+000,...
 2.952961e-002,2.543353e-003,2.698645e-002,0.000000e+000;...
3.500000e+002,9.644198e-002,2.519452e-003,2.599286e-003,...
 9.132387e-002,0.000000e+000,0.000000e+000,...
 2.829808e-002,2.519424e-003,2.577869e-002,0.000000e+000,...
 2.950787e-002,2.512964e-003,2.699497e-002,0.000000e+000;...
3.764500e+002,9.321849e-002,2.044352e-003,2.255690e-003,...
 8.891883e-002,0.000000e+000,0.000000e+000,...
 2.815896e-002,2.038360e-003,2.612063e-002,0.000000e+000,...
 2.927359e-002,2.039456e-003,2.723390e-002,0.000000e+000;...
4.000000e+002,9.049914e-002,1.724518e-003,1.997081e-003,...
 8.677779e-002,0.000000e+000,0.000000e+000,...
 2.813342e-002,1.724530e-003,2.640891e-002,0.000000e+000,...
 2.902092e-002,1.720650e-003,2.730011e-002,0.000000e+000;...
4.500000e+002,8.578837e-002,1.251907e-003,1.581950e-003,...
 8.295462e-002,0.000000e+000,0.000000e+000,...
 2.812530e-002,1.251906e-003,2.687340e-002,0.000000e+000,...
 2.857073e-002,1.249437e-003,2.732159e-002,0.000000e+000;...
4.875100e+002,8.272203e-002,1.017939e-003,1.353514e-003,...
 8.035093e-002,0.000000e+000,0.000000e+000,...
 2.820078e-002,1.007000e-003,2.719380e-002,0.000000e+000,...
 2.834778e-002,1.016087e-003,2.733164e-002,0.000000e+000;...
5.000000e+002,8.170117e-002,9.400676e-004,1.283613e-003,...
 7.947717e-002,0.000000e+000,0.000000e+000,...
 2.823589e-002,9.400689e-004,2.729583e-002,0.000000e+000,...
 2.832115e-002,9.383701e-004,2.738282e-002,0.000000e+000;...
5.500000e+002,7.806909e-002,7.390143e-004,1.062331e-003,...
 7.626750e-002,0.000000e+000,0.000000e+000,...
 2.786345e-002,7.390143e-004,2.712444e-002,0.000000e+000,...
 2.820104e-002,7.378053e-004,2.746296e-002,0.000000e+000;...
6.000000e+002,7.504173e-002,5.971505e-004,8.960904e-004,...
 7.354815e-002,0.000000e+000,0.000000e+000,...
 2.755034e-002,5.941282e-004,2.695622e-002,0.000000e+000,...
 2.803304e-002,5.962555e-004,2.743686e-002,0.000000e+000;...
6.300000e+002,7.325271e-002,5.257661e-004,8.109268e-004,...
 7.191630e-002,0.000000e+000,0.000000e+000,...
 2.738811e-002,5.257741e-004,2.686234e-002,0.000000e+000,...
 2.784176e-002,5.250332e-004,2.731662e-002,0.000000e+000;...
7.000000e+002,6.977777e-002,4.079904e-004,6.574841e-004,...
 6.871291e-002,0.000000e+000,0.000000e+000,...
 2.706118e-002,4.079868e-004,2.665320e-002,0.000000e+000,...
 2.744084e-002,4.074575e-004,2.703336e-002,0.000000e+000;...
8.000000e+002,6.559503e-002,2.999959e-004,5.038905e-004,...
 6.479167e-002,0.000000e+000,0.000000e+000,...
 2.668064e-002,2.999984e-004,2.638064e-002,0.000000e+000,...
 2.685683e-002,2.996696e-004,2.655699e-002,0.000000e+000;...
9.000000e+002,6.190889e-002,2.333134e-004,3.984105e-004,...
 6.127777e-002,0.000000e+000,0.000000e+000,...
 2.626702e-002,2.333050e-004,2.603371e-002,0.000000e+000,...
 2.639746e-002,2.330764e-004,2.616495e-002,0.000000e+000;...
1.022000e+003,5.816868e-002,1.785115e-004,3.091484e-004,...
 5.768088e-002,0.000000e+000,0.000000e+000,...
 2.578102e-002,1.767640e-004,2.560426e-002,0.000000e+000,...
 2.577006e-002,1.783516e-004,2.559333e-002,0.000000e+000;...
1.100000e+003,5.594090e-002,1.542096e-004,2.669438e-004,...
 5.551596e-002,3.258442e-006,0.000000e+000,...
 2.528543e-002,1.514545e-004,2.513374e-002,2.310650e-007,...
 2.545455e-002,1.540769e-004,2.530036e-002,2.310573e-007;...
1.250000e+003,5.232893e-002,1.204070e-004,2.068239e-004,...
 5.194549e-002,5.565677e-005,0.000000e+000,...
 2.446620e-002,1.196363e-004,2.433641e-002,1.015196e-005,...
 2.478414e-002,1.203189e-004,2.465375e-002,1.015172e-005;...
1.400000e+003,4.941220e-002,9.795064e-005,1.649336e-004,...
 4.897217e-002,1.767766e-004,0.000000e+000,...
 2.379615e-002,9.771229e-005,2.365071e-002,4.772836e-005,...
 2.411580e-002,9.788704e-005,2.397105e-002,4.772971e-005;...
1.600000e+003,4.631317e-002,7.756118e-005,1.263121e-004,...
 4.568708e-002,4.223855e-004,0.000000e+000,...
 2.309728e-002,7.756166e-005,2.286759e-002,1.521244e-004,...
 2.329846e-002,7.751652e-005,2.306856e-002,1.525881e-004;...
1.800000e+003,4.380126e-002,6.371927e-005,9.982766e-005,...
 4.289230e-002,7.452626e-004,0.000000e+000,...
 2.253978e-002,6.371932e-005,2.215653e-002,3.195270e-004,...
 2.262359e-002,6.368698e-005,2.223813e-002,3.221121e-004;...
2.044000e+003,4.127930e-002,5.163369e-005,7.743294e-005,...
 3.994036e-002,1.210192e-003,0.000000e+000,...
 2.196861e-002,5.163369e-005,2.131188e-002,6.050982e-004,...
 2.197255e-002,5.161017e-005,2.131628e-002,6.050911e-004;...
2.200000e+003,3.986745e-002,4.628049e-005,6.684596e-005,...
 3.823307e-002,1.521604e-003,1.254911e-007,...
 2.155410e-002,4.627958e-005,2.069303e-002,8.147866e-004,...
 2.164097e-002,4.626051e-005,2.077994e-002,8.147477e-004;...
2.500000e+003,3.765349e-002,3.826073e-005,5.177073e-005,...
 3.543577e-002,2.125820e-003,2.087978e-006,...
 2.095628e-002,3.826091e-005,1.965998e-002,1.258038e-003,...
 2.110044e-002,3.824670e-005,1.980441e-002,1.256740e-003;...
2.800000e+003,3.593992e-002,3.232166e-005,4.127553e-005,...
 3.312879e-002,2.730413e-003,6.755879e-006,...
 2.055774e-002,3.232190e-005,1.878732e-002,1.738096e-003,...
 2.068597e-002,3.231120e-005,1.891520e-002,1.733795e-003;...
3.200000e+003,3.410187e-002,2.671324e-005,3.160505e-005,...
 3.051630e-002,3.510764e-003,1.647451e-005,...
 2.018660e-002,2.671335e-005,1.775911e-002,2.400783e-003,...
 2.028979e-002,2.670498e-005,1.786206e-002,2.389524e-003;...
3.500000e+003,3.296535e-002,2.364438e-005,2.642031e-005,...
 2.879392e-002,4.095116e-003,2.608338e-005,...
 1.999118e-002,2.364445e-005,1.704968e-002,2.917865e-003,...
 2.009817e-002,2.363877e-005,1.715670e-002,2.899308e-003;...
4.000000e+003,3.151705e-002,1.971308e-005,2.022854e-005,...
 2.640522e-002,5.026333e-003,4.556136e-005,...
 1.984052e-002,1.971308e-005,1.604478e-002,3.776030e-003,...
 1.989868e-002,1.970815e-005,1.610297e-002,3.742070e-003;...
4.500000e+003,3.043333e-002,1.694344e-005,1.598419e-005,...
 2.446409e-002,5.868791e-003,6.723066e-005,...
 1.972461e-002,1.694347e-005,1.511975e-002,4.587912e-003,...
 1.979099e-002,1.693930e-005,1.518600e-002,4.535879e-003;...
5.000000e+003,2.966894e-002,1.479738e-005,1.294803e-005,...
 2.284857e-002,6.702197e-003,9.077070e-005,...
 1.973939e-002,1.479738e-005,1.433759e-002,5.387000e-003,...
 1.980132e-002,1.479471e-005,1.438194e-002,5.332159e-003;...
5.500000e+003,2.906548e-002,1.314792e-005,1.070051e-005,...
 2.147947e-002,7.447221e-003,1.149305e-004,...
 1.983454e-002,1.314766e-005,1.366492e-002,6.156466e-003,...
 1.984381e-002,1.314538e-005,1.367361e-002,6.063276e-003;...
6.300000e+003,2.829230e-002,1.112909e-005,8.155659e-006,...
 1.952073e-002,8.599077e-003,1.534930e-004,...
 1.998286e-002,1.112901e-005,1.264469e-002,7.327036e-003,...
 2.002797e-002,1.112754e-005,1.268443e-002,7.204042e-003;...
7.000000e+003,2.785730e-002,9.802481e-006,6.606146e-006,...
 1.812397e-002,9.529666e-003,1.878275e-004,...
 2.015722e-002,9.802481e-006,1.187823e-002,8.269188e-003,...
 2.025079e-002,9.801132e-006,1.194242e-002,8.138138e-003;...
8.000000e+003,2.747008e-002,8.374289e-006,5.057889e-006,...
 1.649588e-002,1.072653e-002,2.348472e-004,...
 2.051409e-002,8.374289e-006,1.097322e-002,9.532498e-003,...
 2.060820e-002,8.373348e-006,1.103882e-002,9.356277e-003;...
9.000000e+003,2.728401e-002,7.304401e-006,3.996425e-006,...
 1.518209e-002,1.181025e-002,2.799811e-004,...
 2.095698e-002,7.304401e-006,1.023236e-002,1.071732e-002,...
 2.100538e-002,7.303720e-006,1.028096e-002,1.046916e-002;...
1.000000e+004,2.721487e-002,6.475899e-006,3.237069e-006,...
 1.409586e-002,1.278584e-002,3.228520e-004,...
 2.138756e-002,6.475899e-006,9.612094e-003,1.176899e-002,...
 2.141079e-002,6.475331e-006,9.635462e-003,1.147908e-002;...
1.250000e+004,2.723372e-002,5.040037e-006,2.071760e-006,...
 1.192465e-002,1.488162e-002,4.198836e-004,...
 2.236583e-002,5.040118e-006,8.327543e-003,1.403324e-002,...
 2.240529e-002,5.039647e-006,8.349780e-003,1.366484e-002;...
1.600000e+004,2.768883e-002,3.840782e-006,1.264504e-006,...
 9.910601e-003,1.723638e-002,5.365780e-004,...
 2.364166e-002,3.840782e-006,7.065979e-003,1.657184e-002,...
 2.372522e-002,3.840446e-006,7.084114e-003,1.613574e-002;...
2.000000e+004,2.836899e-002,3.018566e-006,8.092924e-007,...
 8.343864e-003,1.937363e-002,6.472127e-004,...
 2.499116e-002,3.018566e-006,6.065149e-003,1.892300e-002,...
 2.507599e-002,3.018392e-006,6.075110e-003,1.838326e-002;...
2.500000e+004,2.924778e-002,2.380782e-006,5.179461e-007,...
 6.994247e-003,2.148952e-002,7.613172e-004,...
 2.646784e-002,2.380797e-006,5.155164e-003,2.131030e-002,...
 2.652687e-002,2.380705e-006,5.183524e-003,2.061057e-002;...
3.200000e+004,3.042076e-002,1.837164e-006,3.161259e-007,...
 5.754007e-003,2.377639e-002,8.879813e-004,...
 2.807429e-002,1.837162e-006,4.306651e-003,2.376580e-002,...
 2.820829e-002,1.837073e-006,4.329708e-003,2.301693e-002;...
4.000000e+004,3.167922e-002,1.455851e-006,2.023231e-007,...
 4.823294e-003,2.584828e-002,1.006398e-003,...
 2.975406e-002,1.455851e-006,3.660501e-003,2.609210e-002,...
 2.983811e-002,1.455837e-006,3.668447e-003,2.518778e-002;...
5.000000e+004,3.295153e-002,1.156132e-006,1.294928e-007,...
 4.018804e-003,2.780953e-002,1.121810e-003,...
 3.134923e-002,1.156132e-006,3.092517e-003,2.825556e-002,...
 3.143876e-002,1.156123e-006,3.097665e-003,2.724097e-002;...
6.300000e+004,3.428040e-002,9.121324e-007,8.156162e-008,...
 3.320171e-003,2.972175e-002,1.237172e-003,...
 3.134923e-002,1.156132e-006,3.092517e-003,2.825556e-002,...
 3.304804e-002,9.121041e-007,2.590728e-003,2.923921e-002;...
8.000000e+004,3.572619e-002,7.145993e-007,5.058141e-008,...
 2.725510e-003,3.164402e-002,1.355274e-003,...
 3.134923e-002,1.156132e-006,3.092517e-003,2.825556e-002,...
 3.472742e-002,7.145925e-007,2.147880e-003,3.123899e-002;...
1.000000e+005,3.701860e-002,5.695170e-007,3.237195e-008,...
 2.266502e-003,3.329097e-002,1.460880e-003,...
 3.134923e-002,1.156132e-006,3.092517e-003,2.825556e-002,...
 3.619603e-002,5.694934e-007,1.799251e-003,3.295154e-002;...
1.250000e+005,3.816518e-002,4.543689e-007,2.071759e-008,...
 1.877772e-003,3.473173e-002,1.555297e-003,...
 3.134923e-002,1.156132e-006,3.092517e-003,2.825556e-002,...
 3.749427e-002,4.543613e-007,1.503560e-003,3.444758e-002;...
 ];
zr = interp1q(za(:,1),za(:,flag),e);