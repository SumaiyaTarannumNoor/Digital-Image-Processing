% Read the image
im = imread('MY_IMAGE.jpg');

% Get the dimensions of the image
[rows, cols, ~] = size(im);

% Calculate the center of the image
center_x = floor(cols / 2);
center_y = floor(rows / 2);

% Calculate the maximum distance (M) from the center to any corner
M = sqrt(center_x^2 + center_y^2);

% Initialize the output image
output_im = zeros(size(im), 'like', im);

% Apply the vignette effect
for i = 1:rows
    for j = 1:cols
        % Calculate the distance (D) from the current pixel to the center
        D = sqrt((j - center_x)^2 + (i - center_y)^2);
        
        % Calculate the darkness weight
        weight = 1 - D / M;
        
        % Apply the weight to each channel of the pixel
        output_im(i, j, :) = weight * double(im(i, j, :));
    end
end

% Convert the output image back to uint8 for display
output_im_uint8 = uint8(output_im);

% Display the original and vignetted images
figure;
subplot(1, 2, 1);
imshow(im);
title('Original Image');

subplot(1, 2, 2);
imshow(output_im_uint8);
title('Vignetting Effect');
