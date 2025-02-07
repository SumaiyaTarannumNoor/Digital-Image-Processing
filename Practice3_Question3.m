% Done by Sumaiya
clc
clear all
close all

im = imread('tiger.png'); 

% Affine matrix
A = [1 0 100   
     0 1 10
     0 0 1];

% Inverse affine transformation matrix
A_inv = inv(A);


out = zeros(size(im));

for r = 1 : size(im,1)
    for c = 1 : size(im,2)
        loc = A_inv * [r; c; 1];
        x = round(loc(1)); 
        y = round(loc(2));
        x = max([1 x]);
        y = max([1 y]);
        x = min([x size(im,1)]);
        y = min([y size(im,2)]);
        out(r,c) = im(x,y);
    end
end

subplot(1,2,1)
imshow(mat2gray(im))
title('Original Image')
subplot(1,2,2)
imshow(mat2gray(out))
title('Affine Image')