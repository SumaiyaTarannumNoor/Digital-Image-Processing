clc;
clear;
close all;

% Read the image
img = imread('footBall_orig.jpg');
gray_img = rgb2gray(img); % Convert to grayscale if it's a color image
[M, N] = size(gray_img); % Image dimensions

% Display original and grayscale images
figure, imshow(img), title('Original RGB Image');
figure, imshow(gray_img), title('Grayscale Image');

% High-Pass Filtering (Edge Detection using Laplacian Filter)
hp_filter = [0 -1 0; -1 4 -1; 0 -1 0]; % Laplacian kernel
edges = imfilter(double(gray_img), hp_filter, 'replicate');

% Display high-pass filtered image (edges)
figure, imshow(uint8(edges)), title('High-Pass Filter (Edges)');

% Low-Pass Filtering (Blur using Gaussian Filter)
lp_filter = fspecial('gaussian', [5 5], 1); % 5x5 Gaussian filter with σ=1
blurred = imfilter(double(gray_img), lp_filter, 'replicate');

% Display low-pass filtered image (blurred)
figure, imshow(uint8(blurred)), title('Low-Pass Filter (Blur)');

% Compute Histogram and Probability Distribution
L = 256; % Intensity levels (0-255)
histogram = imhist(gray_img); % Compute histogram
pr = histogram / (M * N); % Probability distribution

% Display original histogram
figure, imhist(gray_img), title('Original Histogram');

% Compute Cumulative Distribution Function (CDF) for Histogram Equalization
cdf = cumsum(pr);
sk = round((L - 1) * cdf); % Using equation from the slide

% Apply Histogram Equalization Transformation
equalized_img = sk(double(gray_img) + 1);

% Display histogram equalized image
figure, imshow(uint8(equalized_img)), title('Histogram Equalized Image');

% Display equalized histogram
figure, imhist(uint8(equalized_img)), title('Equalized Histogram');
