%EE 341 Lab 2
%Assignment 2: Vertical and Horizontal edge detection of an image of our
%choice
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

clear all;
close all;

picture1 = imread('Fire', 'jpeg');
imshow(picture1);
title('Original Image');
grayPic1 = rgb2gray(picture1);
figure, imshow(grayPic1, []);
title('Grayscaled version of original image');
size(grayPic1)

h1 = [-1 0 1; -2 0 2; -1 0 1];   %Sobel vertical edge detection convolution kernel
h2 = [1 2 1; 0 0 0; -1 -2 -1];   %Sobel horizontal edge detection convolution kernel
rowGradient1 = conv2(double(grayPic1), double(h1));
columnGradient1 = conv2(double(grayPic1), double(h2));

absHorizontal = uint8(abs(rowGradient1) .* (255/1002));                         %Horizontal edges
absVertical = uint8(abs(columnGradient1) .* (255/964));                         %Vertical edges
absTotal = uint8(sqrt(double(absHorizontal).^2 + double(absVertical).^2));      %Horizontal and Vertical edges
figure, imshow(absHorizontal);
title('Horizontal Edge Detection');
figure, imshow(absVertical);
title('Vertical Edge Detection');
figure, imshow(absTotal);
title('Overall Edge Detection Gradient');