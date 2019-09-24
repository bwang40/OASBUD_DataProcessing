rf = data(1).rf1;
rf_amplitude = abs(hilbert(rf));
rf_amplitude = rf_amplitude(data(1).roi1 == 1);
rf_amplitude = rf_amplitude / max(rf_amplitude);

f = histogram(rf_amplitude, 200, 'Normalization','pdf');
f.FaceColor = [0 0 0];
axis([0 0.2 0 20]);
xlabel('Amplitude');
ylabel('Probability density');
set(gca, 'FontSize', 14)