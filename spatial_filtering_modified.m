clc
clear all
close all

im = imread('flower.jpg'); % tiger.png flower.jpg
% im = imread('tiger.png'); % tiger.png flower.jpg

% im = imresize(im,.5);

if size(im,3) == 3 % if input is rgb
    im = rgb2gray(im);
end
im = double(im);


%% Highboost Filtering
out = zeros(size(im));
n = 5;
filter = (1/(5*5))*ones(n,n);

% sigma = 7;
% filter = fspecial('gaussian',[5,5],sigma);

for row = 3 : size(im,1) - 2
    for col = 3 : size(im,2) - 2
        
        temp1 = row - 2;
        temp2 = col - 2;
        sub_block = im(temp1:temp1 + 4,temp2:temp2 + 4);
        
        val = sum(sum(sub_block .* filter));
            
        out(row,col) = val;
        
    end
end
k = 5;
out2 = im + k*(im - out);

% subplot(1,2,1)
% imshow(mat2gray(im))
% subplot(1,2,2)
% imshow(mat2gray(out))


subplot(1,3,1)
imshow(mat2gray(im))
subplot(1,3,2)
imshow(mat2gray(out))
subplot(1,3,3)
imshow(mat2gray(out2))
