%EE 341 Lab 2
%Assignment 1: Inverting the images so that the darkest colors appear the lightest and the lightest colors appear the darkest 
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

function invertedPic = reverse(image)

rows = size(image, 1);
columns = size(image, 2);

invertedPic = image;                   %Setting the output dimensions to match the input image dimensions
totalsize = rows*columns;
for i = 1:totalsize                    %traversing the image matrix
   invertedPic(i) = 255 - image(i);    %reversing the value
end