%EE 341 Lab 3
%Assignment 2: Analyzing frequency shifting in the frequency domain with
%four different functions
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

close all; clear all;

%Define three different frequencies
f1 = 0.15;
f2 = 0.2;
f3 = 0.4;
n = 0:255;                          %Define n as going from 0 to 255 samples
nFreq = linspace(-0.5,0.5,256);     %Define frequency axis from -0.5 to 0.5, made up of 256 points
nAngle = linspace(-pi,pi,256);      %Frequency axis in radians

x1 = sinc(f1*(n-32));               %Define function x1
%figure; plot(n,x1);
x1_fft = fftshift(fft(x1));         %Take fft of x1
figure; subplot(2,1,1);                     %Plot magnitude of x1 in frequency domain
plot(nFreq, abs(x1_fft));
title('Magnitude x_1[n]');
subplot(2,1,2);                     %Plot phase of x1 in frequency domain
plot(nAngle,angle(x1_fft));
title('Phase x_1[n]');

x2 = sinc(f1*(n-32)).*((-1).^n);    %Define function x2
%figure; plot(n,x2);
x2_fft = fftshift(fft(x2));         %Take fft of x2
figure, subplot(2,1,1);             %Plot magnitude of x2 in frequency domain
plot(nFreq, abs(x2_fft));
title('Magnitude x_2[n]');
subplot(2,1,2);                     %Plot phase of x2 in frequency domain
plot(nAngle,angle(x2_fft));
title('Phase x_2[n]');

x3 = sinc(f2*(n-32)).* cos(2*pi*f2*n);      %Define function x3
%figure; plot(n,x3);
x3_fft = fftshift(fft(x3));                 %Take fft of x2
figure, subplot(2,1,1);                     %Plot magnitude of x3 in frequency domain
plot(nFreq, abs(x3_fft));
title('Magnitude x_3[n]');
subplot(2,1,2);                             %Plot phase of x3 in frequency domain
plot(nAngle,angle(x3_fft));
title('Phase x_3[n]');

x4 = sinc(f3*(n-32)).* cos(2*pi*f3*n);    %Define function x4
%figure; plot(n,x4);
x4_fft = fftshift(fft(x4));               %Take fft of x4
figure, subplot(2,1,1);                   %Plot magnitude of x4 in frequency domain
plot(nFreq, abs(x4_fft));
title('Magnitude x_4[n]');
subplot(2,1,2);                           %Plot phase of x4 in frequency domain
plot(nAngle,angle(x4_fft));
title('Phase x_4[n]');