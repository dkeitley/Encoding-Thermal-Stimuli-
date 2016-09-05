% Loads data, classifies and models responses and generates Poisson spikes. 

[spikes_A,temps_A,rest_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
[spikes_C,temps_C,rest_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');
disp('Training Data Loaded');

[rise_A,fall_A,plat_A,centroids_A] = createClasses(spikes_A,temps_A,rest_A);
[rise_C,fall_C,plat_C,centroids_C] = createClasses(spikes_C,temps_C,rest_C);
disp('Responses Classified');
 
theta_rise_A = model(spikes_A(rise_A),temps_A(rise_A),rest_A(rise_A));
theta_plat_A = model(spikes_A(plat_A),temps_A(plat_A),rest_A(plat_A));
theta_fall_A = model(spikes_A(fall_A),temps_A(fall_A),rest_A(fall_A));
disp('Responses Modelled');

[spikes_test_A, temps_test_A, rest_test_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
[spikes_test_C,temps_text_c,rest_test_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');
disp('Test Data Loaded');

[rise,fall,plat] = classify(spikes_test_A,temps_test_A,rest_test_A,centroids_A);
disp('Test Data Classified');

for i = 1:size(plat)
    k = plat(i);
    s = modelResponse(theta_plat_A,spikes_test_A{k},temps_test_A{k});
end
disp('Model Spikes Produced');
