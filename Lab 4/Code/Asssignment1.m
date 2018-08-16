%Assignment1.m
%This module applies a low pass filter to a pool of stock price data for
%Microsoft over a 4-year period using two different methods: The 'conv'
%function, and the 'filter' function.
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

clear all; close all;

%Load and plot stock info from .txt file
stockInfo = importdata('microsoft_stock.txt');
plot(stockInfo)
xlabel('Days of 4-year Period');
ylabel('Stock Price');
title('Microsoft Stock Price 2000-2004 (filter)');
hold on

%Implement the 30-day moving average filter using the 'filter' function
a = [30, zeros(1,29)];
b = ones(1,30);
stock30DayFilter = filter(b, a, stockInfo);
plot(stock30DayFilter);
hold off

%Implement the 30-day moving average fitler using the 'conv' function
h = (1/30)*ones(1,29);
stock30DayFilter2 = (30/29)*conv(h,stockInfo);
figure;
plot(stockInfo)
xlabel('Days of 4-year Period');
ylabel('Stock Price');
title('Microsoft Stock Price 2000-2004 (conv)');
hold on
plot(stock30DayFilter2);
hold off

%Plotting the filter h[n]
figure;
w = -pi:2*pi/29:pi - 2*pi/29;
h_fft = abs(fftshift(fft(h)));
plot(w, h_fft);
title('Filter h[n] = 1/30(u[n]-u[n-30])');
xlabel('Normalized Frequency (rad)');
ylabel('|H(jw)|');

