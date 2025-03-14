clc
clear all
close all

% originalBW = imread('circles.png');
% 
% % https://www.mathworks.com/help/images/ref/strel.html
% % SE = strel('diamond',5)
% SE = strel('disk',5)
% % SE = strel('rectangle',[5 3])
% % SE = strel('square',2);
% 
% SEim = mat2gray(SE.Neighborhood);
% 
% % BW2 = imdilate(originalBW,SE);
% % BW2 = imerode(originalBW,SE);
% 
% % openning
% % BW2 = imerode(originalBW,SE);
% % BW2 = imdilate(BW2,SE);
% % BW2 = imopen(originalBW,SE);
% 
% % closing
% % BW2 = imdilate(originalBW,SE);
% % BW2 = imerode(BW2,SE);
% BW2 = imclose(originalBW,SE);
% 
% subplot(1,3,1);
% imshow(originalBW);
% 
% subplot(1,3,2);
% imshow(SEim);
% 
% subplot(1,3,3);
% imshow(BW2);



% noise removal using openning and closing
% c=imread('circles.png');
% x=rand(size(c));
% d1=find(x<=0.05);
% d2=find(x>=0.95);
% c(d1)=0;
% c(d2)=1;
% subplot(1,3,1);
% imshow(c)
% 
% sq=ones(3,3);
% cf1=imclose(imopen(c,sq),sq);
% subplot(1,3,2);
% imshow(cf1)
% 
% cr=[0 1 0;1 1 1;0 1 0];
% cf2=imclose(imopen(c,cr),cr);
% subplot(1,3,3);
% imshow(cf2)

% Connected Components
BW = logical ([1     1     1     0     0     0     0     0
               1     1     1     0     1     1     0     0
               1     1     1     0     1     1     0     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     0     1     0
               1     1     1     0     0     1     1     0
               1     1     1     0     0     0     0     0]);
L = bwlabel(BW,8) % 4 or 8     

