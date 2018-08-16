%Assignment3.m
%This module 
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

close all; clear all;

Fsc = 44100;

[musicRead, Fs] = audioread('music.wav');
music = musicRead(:,1) + musicRead(:,2);

t = 0:1/Fsc:length(music)/Fsc - 1/Fsc;

musicFiltered = equalize(0,0,0,music);

figure;
subplot(2,1,1); plot(t,music); title('Original song'); axis([0 20 -3 3]);
subplot(2,1,2); plot(t,musicFiltered); title('Filtered Song 0dB/0dB/0dB gain'); axis([0 20 -3 3]);

music100 = equalize(0,-1000,-1000,music);
music010 = equalize(-1000,0,-1000,music);
music001 = equalize(-1000,-1000,0,music);

figure;
subplot(3,1,1); plot(t,music100); title('Filtered Song 0dB/-1000dB/-1000dB gain'); axis([0 20 -3 3]);
subplot(3,1,2); plot(t,music010); title('Filtered Song -1000dB/0dB/-1000dB gain'); xlim([0 20]);
subplot(3,1,3); plot(t,music001); title('Filtered Song -1000dB/-1000dB/0dB gain'); xlim([0 20]);


%sound(music,Fsc);