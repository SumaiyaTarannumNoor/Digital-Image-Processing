
im = imread('sketch_in.jpg');
im_double = im2double(im);
im_gray = rgb2gray(im_double);
% Blurring to reduce noise
im_blur = imgaussfilt(im_gray, 0.5);
% Step 1: Apply the Sobel operator for edge detection
sobelX = [-1 0 1; -2 0 2; -1 0 1];
sobelY = sobelX';
% Apply the Sobel operator to get edges
edgeX = conv2(im_blur, sobelX, 'same');
edgeY = conv2(im_blur, sobelY, 'same');
% Combine the edges
edges = sqrt(edgeX.^2 + edgeY.^2);
% Normalize edge intensities
edges = edges / max(edges(:));
% Display the edge detection result
figure(1);
imshow(edges), title('Edge Detection Result');
% Step 2: Invert to get white background
invertedEdges = 1 - edges;
% Display the inverted edges
figure(2);
imshow(invertedEdges), title('Inverted Edges');
