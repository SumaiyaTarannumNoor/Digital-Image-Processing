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
k = 2;
out2 = im + k*(im - out);

subplot(1,2,1)
imshow(mat2gray(im))
subplot(1,2,2)
imshow(mat2gray(out))



%% affine transformation

% A = [1 0 100    % Translation
%     0 1 10
%     0 0 1];

% A = [.8 0 1    % Sceling
%     0 1.2 1
%     0 0 1];


% rot = 30;
% A = [cosd(rot) -sind(rot) 1    % Rotation
%     sind(rot) cosd(rot) 1
%     0 0 1];

A = [1 .5 1    % Shear vertical
    0 1 1
    0 0 1];

% A = [1 0 1    % Shear horizontal
%     .6 1 1
%     0 0 1];

out = zeros(size(im));
for r = 1 : size(im,1)
    for c = 1 : size(im,2)
        loc = A * [r c 1]'; x = round(loc(1)); y = round(loc(2));
        x = max([1 x]);
        y = max([1 y]);
        x = min([x size(im,1)]);
        y = min([y size(im,2)]);
        out(x,y) = im(r,c);
    end
end

subplot(1,2,1)
imshow(mat2gray(im))
subplot(1,2,2)
imshow(mat2gray(out))
