% Read the image
im = imread('flower.jpg');

% Split the image into R, G, B channels
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

% Apply the transformations
% Output R = Input G / 2
R_out = G / 2;

% Output B = 2 x Output R
B_out = 2 * R_out;

% Output G = 2 x Output B
G_out = 2 * B_out;

% Combine the channels into a new image
nightvision_im = cat(3, R_out, G_out, B_out);

% Convert the image back to uint8
nightvision_im_uint8 = im2uint8(nightvision_im);

% Display the original and nightvision images
figure;
subplot(1, 2, 1);
imshow(im);
title('Original Image');

subplot(1, 2, 2);
imshow(nightvision_im_uint8);
title('Nightvision Effect');
