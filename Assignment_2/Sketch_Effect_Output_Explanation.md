My Simple Explanation:

RGB -> GRAY Scale -> Noise Reduction using Blur Effect -> First Order Derivative (Applying Sobel Operator for vertival and horizontal edges) -> Merge them -> Normalize them -> Dispaly
----------> Invert (We are subtracting from 1, instead of 255 to change the dark edges to light) -> Final Output

1. Image Loading and Initial Conversion:
```matlab
% Load the RGB image
im = imread('sketch_in.jpg');
```
- `imread` reads the image file 'sketch_in.jpg' into MATLAB
- The image is loaded as a 3D matrix where each layer represents R, G, and B channels
- Values are integers from 0-255

```matlab
% Convert the image to double for processing
im_double = im2double(im);
```
- Converts the image from uint8 (0-255) to double format (0-1)
- This is necessary for mathematical operations
- Each pixel value is now between 0 (black) and 1 (white)

2. Grayscale Conversion:
```matlab
% Convert to grayscale for better edge detection
im_gray = rgb2gray(im_double);
```
- Converts the RGB image to grayscale
- Uses weighted sum of R, G, B channels (0.2989 * R + 0.5870 * G + 0.1140 * B)
- Results in a 2D matrix where each value represents brightness

3. Noise Reduction:
```matlab
% Apply initial blur to reduce noise
im_blur = imgaussfilt(im_gray, 0.5);
```
- Applies Gaussian blur to reduce image noise
- The 0.5 parameter is the standard deviation of the Gaussian filter
- Smaller values = less blur, larger values = more blur
- Helps prevent detecting noise as edges

4. Edge Detection Setup:
```matlab
% Step 1: Apply the Sobel operator for edge detection
sobelX = [-1 0 1; -2 0 2; -1 0 1];
sobelY = sobelX';
```
- Creates Sobel operators for detecting edges
- `sobelX` detects vertical edges
- `sobelY` is the transpose, detects horizontal edges
- These are 3x3 convolution kernels

5. Edge Detection Application:
```matlab
% Apply the Sobel operator to get edges
edgeX = conv2(im_blur, sobelX, 'same');
edgeY = conv2(im_blur, sobelY, 'same');
```
- `conv2` applies 2D convolution
- `edgeX` finds vertical edges
- `edgeY` finds horizontal edges
- 'same' parameter keeps output size same as input

6. Edge Combination:
```matlab
% Combine the edges
edges = sqrt(edgeX.^2 + edgeY.^2);
```
- Combines horizontal and vertical edges using Pythagorean theorem
- `.^2` squares each element
- `sqrt` takes square root
- Creates magnitude of edge response at each pixel

7. Edge Normalization:
```matlab
% Normalize edge intensities
edges = edges / max(edges(:));
```
- Divides all values by the maximum value
- `max(edges(:))` finds maximum value in entire matrix
- Scales all values to range 0-1
- Makes image display consistently

8. First Display:
```matlab
% Display the edge detection result
figure(1);
imshow(edges), title('Edge Detection Result');
```
- Creates new figure window
- Displays edge detection result
- Adds title to the figure
- Dark pixels = edges, light pixels = non-edges

9. Edge Inversion:
```matlab
% Step 2: Invert to get white background
invertedEdges = 1 - edges;
```
- Subtracts each pixel value from 1
- Inverts the image
- Changes dark edges to light and vice versa
- Prepares for pencil sketch look

10. Second Display:
```matlab
% Display the inverted edges
figure(2);
imshow(invertedEdges), title('Inverted Edges');
```
- Creates another figure window
- Shows inverted edge image
- Adds descriptive title
- Light pixels = edges, dark pixels = non-edges

This code creates the foundation for a pencil sketch effect by:
- Cleaning up the image with blur
- Finding edges using Sobel operators
- Processing the edges to create the right contrast
- Inverting the image for a white background

The key parameters you can adjust are:
- Gaussian blur amount (0.5 in imgaussfilt)
- Sobel operator values for edge sensitivity
- Normalization method for contrast control
