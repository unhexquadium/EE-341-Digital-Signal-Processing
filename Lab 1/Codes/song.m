%EE341 Lab 1
%This module generates a basic song sample from Scarobough fair
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li


oneBeat = 4000;             %Duration of one quarter note = 4000 samples
halfNote = 2*oneBeat;
wholeNote = 4*oneBeat;
Afreq = 220;
Efreq = 220 * (2^(7/12));
Bfreq = 220 * (2^(2/12));
Cfreq = 220 * (2^(3/12));

samplingrate = 8000;
frequency = [Afreq,Afreq,Efreq,Efreq,Efreq,Bfreq,Cfreq,Bfreq,Afreq];                             %A vector of each frequency of the song, in order
duration = [halfNote, oneBeat, oneBeat, oneBeat, oneBeat, oneBeat, oneBeat, oneBeat, wholeNote]; %A vector of the duration of each note, in order

rest = zeros(1,200); %define the rest between notes as a row of 100 zeroes (Change to whichever amount makes the song sound good)
songArray = [];      %start with an empty song
for i = 1:9          %Loop through each index of the frequency and duration vectors to create each note
    thisnote = generateNote(frequency(i),duration(i),samplingrate);
    songArray = [songArray, thisnote, rest]; % concatenate this note and a rest to the song
end

sound(songArray, samplingrate); %Play the note