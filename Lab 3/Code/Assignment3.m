%EE 341 Lab 3
%Assignment 3
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

clear all; close all;
[sound1, Fs1] = audioread('blm.wav');  %Higher Frequency content sound
[sound2, Fs2] = audioread('mmm.wav');  %Lower frequency content sound
soundsc(sound1, Fs1);
pause(1);
soundsc(sound2, Fs2);
pause(1);

%Print sampling rate, amount of samples, and duration of both sounds
Fs1
samples1 = size(sound1, 1)
duration1 = size(sound1,1)/Fs1
Fs2
samples2 = size(sound2, 1)
duration2 = size(sound2,1)/Fs2
 
% %Plot sound 1 in time
t1 = 0:samples1 - (1/Fs1);
subplot(1,2,1);
plot(t1, sound1);
title('Sound 1 in time');
%Plot sound 1 in Frequency
w1 = ((-samples1/2:(samples1/2)-1)*2*pi*Fs1/samples1)';
%w1 = (-0.5:1/samples1:0.5 - 1/samples1)';
sound1_fft = abs(fftshift(fft(sound1)));
subplot(1,2,2);
plot(w1, sound1_fft);
title('Sound 1 in Frequency');
xlabel('Frequency (radians)');

%Plot sound 2 in time
t2 = 0 : samples2 - (1/Fs1);
figure, subplot(1,2,1);
plot(t2, sound2);
title('Sound 2 in time');
%Plot sound 2 in Frequency
w2 = ((-samples2/2:(samples2/2)-1)*2*pi*Fs2/samples2)';
%w2 = (-0.5 : 1/samples2 : 0.5 - 1/samples2)';
sound2_fft = abs(fftshift(fft(sound2)));
subplot(1,2,2);
plot(w2, sound2_fft);
title('Sound 2 in Frequency');
xlabel('Frequency (radians)');

%------------------------Part A: FREQUENCY SHIFT---------------------------
n1 = [1:samples1]';              %Create a column vector of amount of samples for sound 1
n2 = [1:samples2]';              %Create a column vector of amount of samples for sound 2
s1mod = sound1 .* ((-1).^n1);    %Multiply each sound by (-1)*n
s2mod = sound2 .* ((-1).^n2);
soundsc(s1mod, Fs1);             %Play the sounds
pause(1);
soundsc(s2mod, Fs2);
pause(1);
figure, subplot(1,2,1);         %Plot sound 1 in the frequency domain
plot(w1,abs(fftshift(fft(s1mod))));
title('Sound 1 Frequency Shift');
subplot(1,2,2);                 %Plot sound 2 in the frequency domain
plot(w2,abs(fftshift(fft(s2mod))));
title('Sound 2 Frequency Shift');

%Save both new sounds as .wav file
audiowrite('blmA.wav',s1mod,Fs1);
audiowrite('mmmA.wav',s2mod,Fs2);

%------------------------Part B: TIME SHIFT--------------------------------
s1scale = sound1(1:2:end);          %Speed up the sound by using every other value in the sound vector
s2scale = sound2(1:2:end);
soundsc(s1scale, Fs1);              %Play the sounds
pause(1);
soundsc(s2scale, Fs2);
pause(1);
w1_scale = w1(1:2:end);             %Compute frequency axis by using every other value in frequency vector
w2_scale = w2(1:2:end);
figure, subplot(1,2,1);             %Plot sound 1 in the frequency domain
plot(w1_scale,abs(fftshift(fft(s1scale)))); 
title('Sound 1 Time Shift');    
subplot(1,2,2);                     %Plot sound 2 in the frequency domain
plot(w2_scale,abs(fftshift(fft(s2scale)))); 
title('Sound 2 Time Shift');

%Save both new sounds as .wav file
audiowrite('blmB.wav',s1scale,Fs1);
audiowrite('mmmB.wav',s2scale,Fs2);

%------------------Part C: HIGH PASS FILTER--------------------------------
%Using the high-pass filtered signals from Part A
s1modfft = abs(fftshift(fft(s1mod)));
s2modfft = abs(fftshift(fft(s2mod)));
s1modfft(samples1/2 - samples1/4 : samples1/2 + samples1/4) = 0;    %Set indexes from -0.25 <= f <= 0.25 to equal 0
s2modfft(samples2/2 - samples2/4 : samples2/2 + samples2/4) = 0;
figure, subplot(1,2,1);                                             %Plot sound 1 in the frequency domain
plot(w1,s1modfft);
title('Sound 1 Improved High Pass');
subplot(1,2,2);                                                     %Plot sound 2 in the frequency domain
plot(w2,s2modfft);
title('Sound 2 Improved High Pass');
s1mod_HP = real(ifft(fftshift(s1modfft)));                          %Compute inverse FFT by re-shifting, then taking the real portion of the output
s2mod_HP = real(ifft(fftshift(s2modfft)));

%NOTE: can't figure out how to amplify the sound. Multiplying by 2 doesn't


soundsc(s1mod_HP,Fs1);                                              %Play the sounds
pause(1);
soundsc(s2mod_HP,Fs2);

%Save both new sounds as .wav file
audiowrite('blmC.wav',int16(s1mod_HP),Fs1);     %Convert sounds to int16 so they are not clipped           
audiowrite('mmmC.wav',int16(s2mod_HP),Fs2);



