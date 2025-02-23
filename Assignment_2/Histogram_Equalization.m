clc;
clear;
close all;

% Read the image
img = imread('footBall_orig.jpg');
[M, N] = size(img);

figure, imshow(img), title('Original RGB Image');

% High-Pass Filtering (Edge Detection using Laplacian Filter)
hp_filter = [0 -1 0; -1 4 -1; 0 -1 0]; % Laplacian kernel
edges = imfilter(double(img), hp_filter, 'replicate');

figure, imshow(uint8(edges)), title('High-Pass Filter (Edges)');

% Low-Pass Filtering (Blur using Gaussian Filter)
lp_filter = fspecial('gaussian', [5 5], 1); % 5x5 Gaussian filter with σ=1
blurred = imfilter(double(img), lp_filter, 'replicate');

figure, imshow(uint8(blurred)), title('Low-Pass Filter (Blur)');

% Compute Histogram and Probability Distribution
L = 256; % Intensity levels (0-255)
histogram = imhist(gray_img);
pr = histogram / (M * N);

figure, imhist(img), title('Original Histogram');

% Compute Cumulative Distribution Function (CDF)
cdf = cumsum(pr);
sk = round((L - 1) * cdf); 

equalized_img = sk(double(img) + 1);

figure, imshow(uint8(equalized_img)), title('Histogram Equalized Image');

figure, imhist(uint8(equalized_img)), title('Equalized Histogram');
