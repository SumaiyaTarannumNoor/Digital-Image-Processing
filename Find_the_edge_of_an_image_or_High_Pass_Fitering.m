% Collected Group Code

% Practice 3 Question 4

% Find the edge of an image / high pass filtering.
% F1 = [[-1,-2,-1],[0,0,0],[1,2,1]] F2 = [[-1,0,1],[-2,0,2],[-1,0,1]]
% The magnitude of vector ▽f, denoted as M(x,y)
% M(x,y) = mag(▽f)√(gx^2 +gy^2)



clc;
clear all;
close all;


im = imread('flower.jpg'); 
im = rgb2gray(im); 


I = double(im);

% Sobel Kernels
Gx = [-1  0  1;
      -2  0  2;
      -1  0  1];

Gy = [-1 -2 -1;
       0  0  0;
       1  2  1];


[m, n] = size(I);


Gx_result = zeros(m, n);
Gy_result = zeros(m, n);
M = zeros(m, n);


for i = 2:m-1
    for j = 2:n-1
        
        gx_value = 0;
        gy_value = 0;
        
        for k = -1:1
            for l = -1:1
                gx_value = gx_value + I(i+k, j+l) * Gx(k+2, l+2);
                gy_value = gy_value + I(i+k, j+l) * Gy(k+2, l+2);
            end
        end
        
        Gx_result(i, j) = gx_value;
        Gy_result(i, j) = gy_value;
        
        % gradient magnitude
        M(i, j) = sqrt(gx_value^2 + gy_value^2);
    end
end


M = uint8(M);

figure;
subplot(1,3,1); imshow(im); title('Original Image');
subplot(1,3,2); imshow(Gx_result, []); title('Gradient in X direction');
subplot(1,3,3); imshow(Gy_result, []); title('Gradient in Y direction');

figure;
imshow(M, []); title('Edge Magnitude');
