clc
clear all
close all

%% Image read write
im = imread('flower.jpg');
% imgray = rgb2gray(im); %  0.299 * R + 0.587 * G + 0.114 * B

% imshow(im);
% imwrite(imgray, 'flower_gray.jpg');

% subplot(1,2,1)
% imshow(im)
% 
% subplot(1,2,2)
% imshow(imgray)


%% Visualization with subplot, to show how to save a subplot

% R = im(:,:,1);
% G = im(:,:,2);
% B = im(:,:,3);
% 
% subplot(2,2,1)
% imshow(R)
% 
% subplot(2,2,2)
% imshow(G)
% 
% subplot(2,2,3)
% imshow(B)
% 
% subplot(2,2,4)
% imshow(imgray)

%% Manually converting to gray
% [r,c,d] = size(im);
% imgray = zeros(r,c);
% for i = 1 : r
%     for j = 1 : c
%         red = im(i,j,1);
%         green = im(i,j,2);
%         blue = im(i,j,3);
%         imgray(i,j) = 0.299 * red + 0.587 * green + 0.114 * blue;
%     end
% end
% imgray = uint8(imgray);
% imshow(imgray);

%% alternatively
% red = im(:,:,1);
% green = im(:,:,2);
% blue = im(:,:,3);
% imgray = 0.299 * red + 0.587 * green + 0.114 * blue;
% imgray = uint8(imgray);
% % imshow(imgray);

%% Mean max min
% mean_value = mean2(imgray)
% min_value = min(min(imgray))
% max_value = max(max(imgray))
% 
% % imgray_ = (imgray + mean_value);
% imgray_ = imgray * 2; %imgray; % + - .* ./
% 
% imshow(imgray_)

%% find/count/replace pixels
% [row col] = find(imgray == 100); 
% length(row)
% 
% for i = 1 : length(row)
%     imgray(row(i),col(i)) = 255;
% end
% 
% imshow(imgray)

%% image generation

% im = uint8(255*ones(200,200));
% im(50:100, 50:100) = 0;
% imshow(im)
% imshow(imgray(50:200, 50:200))

% im_crop = imgray(50:100, 50:100);
% im_crop = imresize(im_crop, [2048 2048], 'nearest'); % bicubic bilinear nearest
% imshow(im_crop)

%% im2double
% im = im2double(im);
% imshow(im);

