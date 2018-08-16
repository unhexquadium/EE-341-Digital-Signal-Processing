%EE 341 Lab 2
%Assignment 3: Function to scale down an image using the selection method
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

function scaledImg = scaleDown(image, sFactor)

if(mod(sFactor,2) == 0)                                          %If the scaling factor is even, select the first pixel of every block
    scaledImg = image(1:sFactor:end , 1:sFactor:end);
else
    midpoint = (sFactor - 1)/2 + 1;                              %If odd, select the center pixel of every bock
    scaledImg = image(midpoint:sFactor:end , midpoint:sFactor:end);
end
    
    