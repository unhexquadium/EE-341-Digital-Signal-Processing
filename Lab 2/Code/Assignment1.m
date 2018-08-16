%EE 341 Lab 2
%Assignment 1: Vertical and Horizontal edge detection of an image
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

clear all;
close all;

picture1 = imread('DailyShow', 'jpeg');             %Read the image
imshow(picture1);
title('Original Image');
grayPic1 = rgb2gray(picture1);                      %Convert image to grayscale
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

%Reverse the grayscale of the edge images
hEdgeReversed = reverse(absHorizontal);
vEdgeReversed = reverse(absVertical);
tEdgeReversed = reverse(absTotal);
figure;
subplot(1,3,1), imshow(hEdgeReversed);
subplot(1,3,2), imshow(vEdgeReversed);
subplot(1,3,3), imshow(tEdgeReversed);
