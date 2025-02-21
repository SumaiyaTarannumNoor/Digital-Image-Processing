% Step 1: Read the Edge_Glow_in.jpg image (RGB image always has 3 channels)
 rgbImage = imread('Edge_Glow_in.jpg');

% Step 2: Perform first order derivative to get horizontal and vertical edges
% Convert the image to grayscale for edge detection
grayImage = rgb2gray(rgbImage);

% Calculate the gradient in the x (horizontal) and y (vertical) directions
[Gx, Gy] = imgradientxy(grayImage, 'sobel');

% Calculate the average of the gradients
avgGradient = (Gx + Gy) / 2;

% Display the average gradient image
figure(1);
imshow(avgGradient, []);
title('Average Gradient Image');

% Step 3: Invert the average gradient image
invertedAvgGradient = 255 - avgGradient;

% Display the inverted average gradient image
figure(2);
imshow(invertedAvgGradient, []);
title('Inverted Average Gradient Image');

% Step 4: Blur the inverted average gradient image
blurredImage = imgaussfilt(invertedAvgGradient, 2);

% Show figure 3 with the blurred image
figure(3);
imshow(blurredImage);
title('Blurred Image');

% Step 5: Merge the input image and blurred output image to create the final image
mergedImage = imfuse(rgbImage, blurredImage, 'blend');

% Show figure 4 with the final merged image
figure(4);
imshow(mergedImage);
title('Merged Image (Input and Blurred)');
