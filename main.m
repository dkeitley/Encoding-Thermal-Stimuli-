
  
[spikes_A,temps_A,resting_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
[spikes_C,temps_C,resting_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');
disp('Data Loaded');

[rise_A,fall_A,plat_A] = classify(spikes_A,temps_A,resting_A);
[rise_C,fall_C,plat_C] = classify(spikes_C,temps_C,resting_C);

theta_rise_A = model(spikes_A(rise_A),temps_A(rise_A),resting_A(rise_A));
theta_plat_A = model(spikes_A(plat_A),temps_A(plat_A),resting_A(plat_A));
theta_fall_A = model(spikes_A(fall_A),temps_A(fall_A),resting_A(fall_A));

