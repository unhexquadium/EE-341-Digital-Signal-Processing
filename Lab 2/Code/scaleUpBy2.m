%EE 341 Lab 2
%Assignment 5: Scaling an image up by 2 using linear interpolation
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

function scaledImage = scaleUpBy2(image)

scaledImage = interp2(double(image),'linear');