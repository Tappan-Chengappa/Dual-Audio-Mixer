clc;
clear;

[fileName1, filePath1] = uigetfile({'*.mp3','mp3 Format (*.mp3)'},'Select the First Audio File');
audioFilePath1 = fullfile(filePath1, fileName1);


[fileName2, filePath2] = uigetfile({'*.mp3','mp3 Format (*.mp3)'},'Select the Second Audio File');
audioFilePath2 = fullfile(filePath2, fileName2);


[audioData1, sampleRate1] = audioread(audioFilePath1);
[audioData2, sampleRate2] = audioread(audioFilePath2);

recom=[audioData1;audioData2];
time = ((0:length(recom)-1) * (1/sampleRate1));

plot(time, recom);
sound(recom,sampleRate2);
title('Audio Waveform');
xlabel('Time (s)');
ylabel('Amplitude')

[outputFileName, outputFilePath] = uiputfile({'*.wav', 'Waveform Audio File Format (*.wav)'; '*.mp3', 'MPEG Audio Layer III (*.mp3)'}, 'Save As', 'output_audio.wav');


if isequal(outputFileName, 0) || isequal(outputFilePath, 0)
    disp('User canceled the operation');
else
    % path for output
    outputFile = fullfile(outputFilePath, outputFileName);
    
  %save
    audiowrite(outputFile, recom, sampleRate1);
    disp(['Audio file saved to: ' outputFile]);
end


