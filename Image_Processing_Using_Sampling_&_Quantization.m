% Step 1: Read an image
image = imread('example.jpg'); % Replace 'example.jpg' with your image file

% Convert to grayscale if the image is in color
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Display original image
figure;
subplot(1, 3, 1);
imshow(image);
title('Original Image');

% Step 2: Downsample the image
downsample_factor = 2; % Change this factor to control the level of downsampling
downsampled_image = image(1:downsample_factor:end, 1:downsample_factor:end);

% Display downsampled image
subplot(1, 3, 2);
imshow(downsampled_image);
title('Downsampled Image');

% Step 3: Quantize the image
num_levels = 16; % Change this to control the number of quantization levels
quantized_image = round(double(downsampled_image) / 255 * (num_levels - 1)) * (255 / (num_levels - 1));

% Display quantized image
subplot(1, 3, 3);
imshow(uint8(quantized_image));
title('Quantized Image');
