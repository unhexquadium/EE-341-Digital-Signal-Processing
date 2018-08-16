%EE 341 Lab 2
%Assignment 5: Testing the function that scales an image up by 2
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

picture1 = imread('DailyShow', 'jpeg');
grayPic1 = rgb2gray(picture1);
figure, imshow(grayPic1);
title('Grayscaled version of original image');
size(grayPic1)

grayPicScaled = scaleUpBy2(grayPic1);
figure, imshow(uint8(grayPicScaled));
title('Scaled up by 2');
size(grayPicScaled)