% Read processed CSV from ALICE
y_out = readmatrix('alice_output.csv');

% Convert back to audio
audiowrite('equalized_output.wav', y_out, Fs);

sound(y_out, Fs);   % listen in MATLAB
