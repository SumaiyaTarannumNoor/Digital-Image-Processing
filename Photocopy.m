% Read the image
im = imread('flower.jpg');

% Convert the image to grayscale
gray_im = rgb2gray(im);

% Define the threshold
threshold = 100;

% Initialize the output image
output_im = zeros(size(gray_im));

% Apply the threshold transformation
for i = 1:size(gray_im, 1)
    for j = 1:size(gray_im, 2)
        if gray_im(i, j) > threshold
            output_im(i, j) = 255;
        else
            output_im(i, j) = gray_im(i, j) * (threshold - gray_im(i, j)) / (threshold^2);
        end
    end
end

% Convert the output image to uint8 for display
output_im_uint8 = uint8(output_im);

% Display the original, grayscale, and transformed images
figure;
subplot(1, 3, 1);
imshow(im);
title('Original Image');

subplot(1, 3, 2);
imshow(gray_im);
title('Grayscale Image');

subplot(1, 3, 3);
imshow(output_im_uint8);
title('Photocopy Effect');
