% Read the image
im = imread('flower.jpg');

% Convert the image to double
im_double = im2double(im);

% Define the number of Colours for posterization
colours = 4;

% Quantize the image
posterized_im = round(im_double * (colours - 1)) / (colours - 1);

% Convert back to uint8 for display
posterized_im_uint8 = im2uint8(posterized_im);

% Display the original and posterized images
figure;
subplot(1, 2, 1);
imshow(im);
title('Original Image');

subplot(1, 2, 2);
imshow(posterized_im_uint8);
title(['Posterized Image']);
