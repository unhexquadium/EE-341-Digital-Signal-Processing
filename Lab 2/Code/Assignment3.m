%EE 341 Lab 2
%Assignment 3: Testing the scaling an image to thumbnail-size using either a method of
%selecting certain pixels or averaging pixels
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

clear all; close all;

%Testing both methods with a pre-defined matrix
scaletest = reshape(1:36,6,6)
scaleDown(scaletest,2)
scaleDown(scaletest,3)
scaleDownAverage(scaletest,2)
scaleDownAverage(scaletest,3)

%Reading and displaying the original image
picture10 = imread('DailyShow', 'jpeg');
picture1 = rgb2gray(picture10);
imshow(picture1);
title('Original Image');

%Testing the Selection scaling method with a factor of 2 and 5
scaled2Easy = scaleDown(picture1, 2);
figure, imshow(scaled2Easy);
title('Scaled down by 2 using selection');
scaled5Easy = scaleDown(picture1, 5);
figure, imshow(scaled5Easy);
title('Scaled down by 5 using selection');

%Testing the 'averaging' scaling method with a factor of 2 and 5
scaled2Avg = scaleDownAverage(picture1, 2);
figure, imshow(uint8(scaled2Avg));
title('Scaled down by 2 using averaging');
scaled5Avg = scaleDownAverage(picture1, 5);
figure, imshow(uint8(scaled5Avg));
title('Scaled down by 5 using averaging');