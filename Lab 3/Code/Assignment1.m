%EE 341 Lab 3
%Assignment 1: Exploring MATLAB's FFT function
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

clc;
clear;

n = 1:127;
f1 = 0.25;
f2 = 0.5;

nAngFreq = linspace(-pi, pi, 127);  %Create the frequency axis from -pi to pi with 127 samples
nHzFreq = nAngFreq/2/pi;            %Convert frequency axis to Hz

x1 = 1+cos(2*pi*f1*n);              %Define function x1
x2 = 1+cos(2*pi*f2*n);              %Define function x2

figure;                             %Plot a discrete version of the fft of x1 without shifting the graph
subplot(3,1,1);
stem(nAngFreq+pi,abs(fft(x1)));
title('Unshifted f=0.25');

x1FFT = abs(fftshift(fft(x1)));     %Plot a discrete version of the fft of x1 with graph shifted
subplot(3,1,2);
stem(nAngFreq, x1FFT);
title('Shifted f=0.25');

subplot(3,1,3);                     %Plot a discrete version x1 in frequency domain using Hz 
stem(nHzFreq, x1FFT);
title('Shifted Hz f=0.25');


figure;                             %Plot a discrete version of the fft of x2 without shifting the graph
x2FFT = abs(fftshift(fft(x2)));
subplot(3,1,1);
stem(nAngFreq+pi,abs(fft(x2)));
title('Unshifted f=0.5');

subplot(3,1,2);                    %Plot a discrete version of the fft of x2 with graph shifted
stem(nAngFreq, x2FFT);
title('Shifted f=0.5');

subplot(3,1,3);                    %Plot a discrete version x2 in frequency domain using Hz 
stem(nHzFreq, x2FFT);
title('Shifted Hz f=0.5');