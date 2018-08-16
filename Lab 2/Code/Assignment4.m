%EE 341 Lab 2
%Assignment 4: Changing the orientation of an image
%Authors: Irina Golub, Kalvin Hallesy, Chenglong Li

%i: X(N -n+1, m] is flipped vertically because only rows are affected
%ii: X[n, M-m+1] is flipping horizontally because only columns are effected
%iii: X[N-n+1, M-m+1] is flipped horizontally and vertically because the
    %rows and columns are both being changed
    
picture1 = imread('DailyShow', 'jpeg');
grayPic1 = rgb2gray(picture1);
subplot(2,2,1), imshow(grayPic1, []);
title('Flip Using Matrix Manipulation');

N = size(grayPic1, 1);
M = size(grayPic1, 2);

for n = 1:N
   for m = 1:M
      vFlip(n,m) = grayPic1(N-n+1,m);
      hFlip(n,m) = grayPic1(n,M-m+1);
      bothFlip(n,m) = grayPic1(N-n+1,M-m+1);
   end
end

subplot(2,2,2), imshow(hFlip);
subplot(2,2,3), imshow(vFlip);
subplot(2,2,4), imshow(bothFlip);

figure;
subplot(2,2,1), imshow(grayPic1, []);
title('Flip Using Pre-defined Funtions');
grayPic2 = fliplr(grayPic1);
subplot(2,2,2), imshow(grayPic2)
grayPic3 = flipud(grayPic1);
subplot(2,2,3), imshow(grayPic3)
grayPic4 = fliplr(grayPic3);
subplot(2,2,4), imshow(grayPic4)

