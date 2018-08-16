%EE341 Lab 1
%This module generates a song sample from Scarobough fair with an added
%ADSR envelope
%
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

oneBeat = 4000;             %Duration of one quarter note = 4000 samples
halfNote = 2*oneBeat;
wholeNote = 4*oneBeat;
Afreq = 220;
Efreq = 220 * (2^(7/12));
Bfreq = 220 * (2^(2/12));
Cfreq = 220 * (2^(3/12));

samplingrate = 8000;
frequency = [Afreq,Afreq,Efreq,Efreq,Efreq,Bfreq,Cfreq,Bfreq,Afreq];
duration = [halfNote, oneBeat, oneBeat, oneBeat, oneBeat, oneBeat, oneBeat, oneBeat, wholeNote];

%Generate the first note separately
thisnote0 = generateNote(frequency(1),duration(1),samplingrate);
thisnote = ADSR(thisnote0);
songArray = [thisnote]; 
for i = 2:9     %Generate the rest of the notes by looping through the frequency and duration vectors
    thisnote0 = generateNote(frequency(i),duration(i),samplingrate);
    thisnote = ADSR(thisnote0); %Apply ADSR to note
    overlapVectorEnd = zeros(1, length(thisnote) - .12*oneBeat);
    overlapVectorBegin = zeros(1, length(songArray) - .12*oneBeat);

    songArray = [songArray, overlapVectorEnd] + [overlapVectorBegin, thisnote]; %Overlap the beginning of new note with end of previous note
end

plot([0:length(songArray)-1],songArray); %Plot the song to observe its behavior
xlabel("sample");
ylabel("Amplitude");
title("Sound Sample");

sound(songArray, samplingrate);          %Play the song