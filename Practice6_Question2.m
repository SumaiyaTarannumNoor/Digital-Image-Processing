clc;
clear all;
close all;
% Step 1: Read the input image
originalImage = imread('retina.jpg');
grayImage = rgb2gray(originalImage); % Convert to grayscale
% Step 2: Convert to binary using manual thresholding (imbw)
threshold = 0.5; % Adjust if needed
binaryImage = im2bw(grayImage, threshold);
% Step 3: Perform dilation
SE = strel('disk',2); % Structuring element
dilatedImage = imdilate(binaryImage, SE);
% Step 4: Perform opening (erosion followed by dilation)
openedImage = imopen(dilatedImage, SE);
% Display results
subplot(1,4,1), imshow(originalImage), title('Original Image');
subplot(1,4,2), imshow(binaryImage), title('Binary Image');
subplot(1,4,3), imshow(dilatedImage), title('Dilated Image');
subplot(1,4,4), imshow(openedImage), title('Opened Image');
