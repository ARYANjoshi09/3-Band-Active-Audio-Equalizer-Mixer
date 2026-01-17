filename = 'file_example_WAV_1MG.wav';

% Specify the sample range [start, end]
samples = [1, 2000];

% Read only the specified range
[y, Fs] = audioread(filename, samples);

% Export to CSV
writematrix(y, 'output_audio_2000.csv');
