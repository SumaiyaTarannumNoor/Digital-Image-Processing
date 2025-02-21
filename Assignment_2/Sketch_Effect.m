% Load the RGB image
im = imread('sketch_in.jpg');

% Convert the image to double for processing
im_double = im2double(im);

% Step 1: Convert RGB image to grayscale
grayImage = rgb2gray(im_double);

% Compute the first order derivative on the grayscale image
% Define the Sobel operator for edge detection
sobelX = [-1 0 1; -2 0 2; -1 0 1];
sobelY = sobelX';

% Apply the Sobel operator to the grayscale image
edgeGray_X = conv2(grayImage, sobelX, 'same');
edgeGray_Y = conv2(grayImage, sobelY, 'same');

% Combine the edges
edgeGray = sqrt(edgeGray_X.^2 + edgeGray_Y.^2);

% Display the original grayscale and edge-detected images
figure(1);
subplot(1, 2, 1), imshow(grayImage), title('Original Grayscale Image');
subplot(1, 2, 2), imshow(edgeGray), title('First Order Derivative (Edge Detection)');

% Step 2: Invert the first order derivative image
invertedEdgeImage = 255 - uint8(edgeGray * 255);

% Display the first order derivative and its inversion
figure(3);
imshow(edgeGray), title('First Order Derivative (Edge Detection)');

figure(4);
imshow(invertedEdgeImage), title('Inverted First Order Derivative Image');

% Compute the second order derivative on the first order derivative image
% Define the Laplacian operator for second order derivative (edge detection)
laplacian = [0 -1 0; -1 4 -1; 0 -1 0];

% Apply the Laplacian operator to the first order derivative image
secondOrderDerivative = conv2(edgeGray, laplacian, 'same');

% Display the second order derivative image
figure(5);
imshow(secondOrderDerivative, []), title('Second Order Derivative (Edge Detection)');

% Step 3: Invert the second order derivative image
invertedSecondOrderDerivative = 255 - uint8(secondOrderDerivative * 255);

% Display the inverted second order derivative image
figure(6);
imshow(invertedSecondOrderDerivative, []), title('Inverted Second Order Derivative Image');

% Step 4: Blur the inverted second order derivative image
blurredImage = imgaussfilt(invertedSecondOrderDerivative, 2);

% Display the blurred inverted second order derivative image
figure(7);
imshow(blurredImage, []), title('Blurred Inverted Second Order Derivative Image');
