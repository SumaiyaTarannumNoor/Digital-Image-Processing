clc; clear; close all;

img = imread('Edge_Glow_in.jpg'); 
gray_img = rgb2gray(img); 

figure, imshow(img), title('Original RGB Image');
figure, imshow(gray_img), title('Grayscale Image');

% First-order derivatives using Sobel operators
gx = imfilter(double(gray_img), [-1 0 1; -2 0 2; -1 0 1], 'same');
gy = imfilter(double(gray_img), [-1 -2 -1; 0 0 0; 1 2 1], 'same');

% Display Gx and Gy
figure, imshow(uint8(abs(gx))), title('Gx (First-order Derivative)');
figure, imshow(uint8(abs(gy))), title('Gy (First-order Derivative)');

gradient_avg = (abs(gx) + abs(gy)) / 2;

% Display gradient average image
figure, imshow(uint8(gradient_avg)), title('Average of Gx and Gy');

% Apply Gaussian blur
blurred_img = imgaussfilt(gradient_avg, 2); 

% Display the blurred image
figure, imshow(uint8(blurred_img)), title('Blurred Image');

% Blend the input image and the blurred image
final_output = uint8(0.55 * double(img) + 0.36 * blurred_img);

% Display the final output
figure, imshow(final_output), title('Final Blended Output');
