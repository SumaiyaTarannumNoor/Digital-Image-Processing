% Read the image
img = imread('flower.jpg');

% Convert the image to double precision
img_double = im2double(img);

% Define the number of levels for posterization
levels = 4;

% Quantize the image
posterized_img = round(img_double * (levels - 1)) / (levels - 1);

% Convert back to uint8 for display
posterized_img_uint8 = im2uint8(posterized_img);

% Display the original and posterized images
figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(posterized_img_uint8);
title(['Posterized Image (', num2str(levels), ' levels)']);
