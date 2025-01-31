% Question 2) Modify the code to apply the following filters on a gray level image.
% 1/273 [[1,4,7,4,1], [4, 16, 26, 16, 4], [7,26,41,26,7],[4,16,26,16,4],[1,4,7,4,1]]

clc;
clear all;
close all;

im = imread('flower.jpg'); 
im = imresize(im,.25);
if size(im,3) == 3
    im = rgb2gray(im);
end
im = double(im);

% Modify 5×5 Filter
filter = (1/273) * [1  4  7  4  1;
                        4 16 26 16  4;
                        7 26 41 26  7;
                        4 16 26 16  4;
                        1  4  7  4  1];

% replicate padding 
p_im = padarray(im, [2 2], 'replicate', 'both');

% Initialize output image
out = zeros(size(im));


for row = 3 : size(p_im,1) - 2
    for col = 3 : size(p_im,2) - 2
        sub_block = p_im(row-2:row+2, col-2:col+2);
        out(row-2,col-2) = sum(sum(sub_block .* filter));
    end
end

figure;

% Given Image
subplot(1,2,1);
imshow(mat2gray(im));
title('Given Image');

% 5x5 Filtered Image
subplot(1,2,2);
imshow(mat2gray(out));
title('Modified Filtered Image');

