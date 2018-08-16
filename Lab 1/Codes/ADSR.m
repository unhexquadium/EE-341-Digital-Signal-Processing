%EE341 Lab 1
%This function applies an ADSR envelope to an input containing the note.
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

function ADSRnote = ADSR(generatedNote)

A = linspace(0,1,length(generatedNote)*0.2);      %Create line for 'attack'
D = linspace(1,0.7,length(generatedNote)*0.05);   %Create line for 'decay'
S = linspace(0.7,0.7,length(generatedNote)*0.4);  %Create line for 'sustain'
R = linspace(0.7,0,length(generatedNote)*0.35);   %Create line for 'release'

ADSRmatrix = [A, D, S, R];                        %Concatenate each line
ADSRnote = ADSRmatrix .* generatedNote;           %Apply envelope to the note