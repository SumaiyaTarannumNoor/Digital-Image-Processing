% Read the image
im = imread('flower.jpg');

% Reverse the order of the pixels in each row to create a mirror image
mirror_im = im(:, end:-1:1, :);

% Display the original and mirrored images
figure;
subplot(1, 2, 1);
imshow(im);
title('Original Image');

subplot(1, 2, 2);
imshow(mirror_im);
title('Mirror Image');
