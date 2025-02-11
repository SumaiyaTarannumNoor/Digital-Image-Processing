% Collected Group Code
% Practice 3 Question 1 
clc;
clear all;
close all;


im = imread('tiger.png'); 


[m, n, c] = size(im); 
if c == 3  
    im = 0.2989 * im(:, :, 1) + 0.5870 * im(:, :, 2) + 0.1140 * im(:, :, 3); % 
else
    im = double(im); 
end


[m, n] = size(im);

medianf = zeros(m, n);
minf = zeros(m, n);
maxf = zeros(m, n);
% Applying filter 
for i = 2:m-1
    for j = 2:n-1
        
        s = [
            im(i-1, j-1) im(i-1, j) im(i-1, j+1);
            im(i, j-1)   im(i, j)   im(i, j+1);
            im(i+1, j-1) im(i+1, j) im(i+1, j+1)
        ];


        % median 
        sort = sort(s(:)); 
        medianf(i, j) = sort(5); 

        % min and max
        minf(i, j) = sort(1); 
        maxf(i, j) = sort(9); 
    end
end


medianf = uint8(medianf);
minf = uint8(minf);
maxf = uint8(maxf);


figure;
subplot(2,2,1); imshow(uint8(im)); title('Original Image');
subplot(2,2,2); imshow(medianf, []); title('Median Filter');
subplot(2,2,3); imshow(minf, []); title('Min Filter');
subplot(2,2,4); imshow(maxf, []); title('Max Filter');
