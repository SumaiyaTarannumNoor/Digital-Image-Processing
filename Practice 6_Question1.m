clc;
clear all;
close all;
img = imread('lincoln.tif');
% (a) Internal Boundary Extraction
se = strel('disk', 1);
eroded = imerode(img, se);
internal_boundary = img - eroded;
% (b) External Boundary Extraction
dilated = imdilate(img, se);
external_boundary = dilated - img;
% Display the results
figure;
subplot(2, 2, 1);
imshow(img);
title('Original Binary Image');
subplot(2, 2, 3);
imshow(internal_boundary);
title('Internal Boundary');
subplot(2, 2, 4);
imshow(external_boundary);
title('External Boundary');
