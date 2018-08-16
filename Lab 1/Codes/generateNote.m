%EE341 Lab 1
%This function generates a sin wave with the given frequency, duration, and
%sampling rate
%
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

function generatedNote = generateNote(frequency, duration, samplingrate)

t = 0:1/samplingrate:(duration - 1)/samplingrate;
omega = 2*pi*frequency;
generatedNote = sin(omega*t);