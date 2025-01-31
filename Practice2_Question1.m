% Question 1) Apply the following filters on a gray level image.
% 1st Filter = 1/9 [[1,1,1], [1,1,1], [1,1,1]]
% 2nd Filter = 1/16 [[1,2,1], [2,4,2], [1,2,1]]

clc;
clear all;
close all;


im = imread('flower.jpg'); 
if size(im,3) == 3
    im = rgb2gray(im);
end
im = double(im);

% Define 1st Filter 
first_filter = (1/9) * ones(3,3);

% Define 2nd Filter 
second_filter = (1/16) * [1 2 1; 2 4 2; 1 2 1];

% replicate padding
p_im = padarray(im, [1 1], 'replicate', 'both');

% Initialize output images
out_1 = zeros(size(im));
out_2 = zeros(size(im));

% Apply 1st Filter 
for row = 2 : size(p_im,1) - 1
    for col = 2 : size(p_im,2) - 1
        sub_block = p_im(row-1:row+1, col-1:col+1);
        out_1(row-1,col-1) = sum(sum(sub_block .* first_filter));
    end
end

% Apply 2nd Filter 
for row = 2 : size(p_im,1) - 1
    for col = 2 : size(p_im,2) - 1
        sub_block = p_im(row-1:row+1, col-1:col+1);
        out_2(row-1,col-1) = sum(sum(sub_block .* second_filter));
    end
end

figure;

% Original Image
subplot(1,3,1);
imshow(mat2gray(im));
title('Original Image');

% 1st Filter Output 
subplot(1,3,2);
imshow(mat2gray(out_1));
title('1st Filtered Image');

% 2nd Filter Output 
subplot(1,3,3);
imshow(mat2gray(out_2));
title('2nd Filtered Image');
