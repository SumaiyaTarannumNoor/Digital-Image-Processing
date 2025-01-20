% MATLAB Script: Upload Image and Apply Vignetting Effect

% Clear workspace and command window
clc;
clear;
close all;

% Step 1: Upload Image
[filename, pathname] = uigetfile({'*.*', 'All Files'; '*.jpg;*.png;*.bmp', 'Image Files'}, 'Select an Image');
if isequal(filename, 0)
    disp('User canceled the operation.');
    return;
end
imagePath = fullfile(pathname, filename);
inputImage = imread(imagePath);

% Display original image
figure;
imshow(inputImage);
title('Original Image');

% Step 2: Convert Image to Grayscale (if needed)
if size(inputImage, 3) == 3
    grayImage = rgb2gray(inputImage); % Convert to grayscale for simplicity
else
    grayImage = inputImage;
end

% Step 3: Generate Vignetting Mask
[rows, cols] = size(grayImage);
[x, y] = meshgrid(1:cols, 1:rows);

% Calculate the center of the image
centerX = cols / 2;
centerY = rows / 2;

% Calculate the distance of each pixel from the center
distance = sqrt((x - centerX).^2 + (y - centerY).^2);

% Normalize distance values to range [0, 1]
maxDistance = max(distance(:));
vignetteMask = 1 - (distance / maxDistance);

% Adjust mask strength (optional)
vignetteStrength = 0.6; % Adjust this value (0 to 1) to control the strength
vignetteMask = vignetteMask .^ vignetteStrength;

% Step 4: Apply Vignetting Effect
if size(inputImage, 3) == 3
    % For RGB images, apply mask to each channel
    vignettedImage = zeros(size(inputImage), 'like', inputImage);
    for channel = 1:3
        vignettedImage(:,:,channel) = uint8(double(inputImage(:,:,channel)) .* vignetteMask);
    end
else
    % For grayscale images
    vignettedImage = uint8(double(grayImage) .* vignetteMask);
end

% Step 5: Display Results
figure;
imshow(vignettedImage);
title('Image with Vignetting Effect');

% Optional: Save the vignetted image
outputPath = fullfile(pathname, 'vignetted_image.png');
imwrite(vignettedImage, outputPath);
disp(['Vignetted image saved at: ', outputPath]);
