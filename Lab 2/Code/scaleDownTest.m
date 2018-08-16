%EE 341 Lab 2
%Assignment 3: 
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

function scaledImg = scaleDownTest(image, sFactor)

if(mod(sFactor,2) == 0) 
    scaledImg = image(1:sFactor:end , 1:sFactor:end);
else
    midpoint = (sFactor - 1)/2 + 1;
    scaledImg = image(midpoint:sFactor:end , midpoint:sFactor:end);
end