%EE 341 Lab 2
%Assignment 3: Function to scale down an image using the averaging method
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

function scaledImg = scaleDownAverage(image, sFactor)

rows = size(image, 1);
columns = size(image, 2);

%Pad the image in both dimensions depending on the modulus of the
%height/width and scaling factor
rowPad = mod(rows,sFactor);
columnPad = mod(columns,sFactor);
image = padarray(image, [rowPad columnPad], 'replicate', 'post');

rows = size(image, 1);
columns = size(image, 2);
sum = 0;

%Complete the averaging
for i = 1:rows/sFactor 
    for j = 1:columns/sFactor
       for k = 1:sFactor
          for m = 1:sFactor
              sum = uint16(sum) + uint16(image(m+(i-1)*sFactor,k+(j-1)*sFactor));
              %Add the value of the (m,k)th element of the block to the sum
              %of the block
              %The block is defined by i and j
          end
       end
       scaledImg(i,j) = sum / (sFactor^2); %The ith and jth pixel of the new image is the average of the corresponding block
       sum = 0;                            %Reset sum
    end   
end

