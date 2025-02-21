My Simple Explanation:

Read grayscale image -> pass through high-pass filter to get the edges -> pass through low pass filter to blur -> use histogram equalization function (slide page - 31 )
Link - https://www.geeksforgeeks.org/histogram-equalization-in-digital-image-processing/

---

### **1. Initialization and Cleanup**
```matlab
clc;
clear;
close all;
```
- `clc;` → Clears the command window.
- `clear;` → Clears all variables from memory.
- `close all;` → Closes all open figure windows.

These commands ensure a clean workspace before executing the script.

---

### **2. Reading and Converting the Image**
```matlab
img = imread('footBall_orig.jpg');
gray_img = rgb2gray(img); % Convert to grayscale if it's a color image
[M, N] = size(gray_img); % Image dimensions
```
- `imread('footBall_orig.jpg')` → Reads the image file into a matrix.
- `rgb2gray(img)` → Converts the image to grayscale (if it's a color image).
- `[M, N] = size(gray_img);` → Extracts the dimensions of the grayscale image.

---

### **3. Displaying Original and Grayscale Images**
```matlab
figure, imshow(img), title('Original RGB Image');
figure, imshow(gray_img), title('Grayscale Image');
```
- `imshow(img)` → Displays the original color image.
- `imshow(gray_img)` → Displays the grayscale version.
- `title('...')` → Adds a title to each figure.

---

### **4. High-Pass Filtering (Edge Detection using Laplacian Filter)**
```matlab
hp_filter = [0 -1 0; -1 4 -1; 0 -1 0]; % Laplacian kernel
edges = imfilter(double(gray_img), hp_filter, 'replicate');
```
- **Laplacian kernel**: A second-order derivative filter used for edge detection.
- `imfilter(double(gray_img), hp_filter, 'replicate')`:
  - `double(gray_img)` → Converts the image to double precision for filtering.
  - `imfilter(..., 'replicate')` → Performs convolution while handling edge pixels by replicating the boundary values.
- The Laplacian filter enhances rapid intensity changes, highlighting edges.

#### **Displaying the Edge-Detected Image**
```matlab
figure, imshow(uint8(edges)), title('High-Pass Filter (Edges)');
```
- `imshow(uint8(edges))` → Converts filtered image back to `uint8` format and displays it.

---

### **5. Low-Pass Filtering (Image Blurring using Gaussian Filter)**
```matlab
lp_filter = fspecial('gaussian', [5 5], 1); % 5x5 Gaussian filter with σ=1
blurred = imfilter(double(gray_img), lp_filter, 'replicate');
```
- `fspecial('gaussian', [5 5], 1)`:
  - Creates a **5×5 Gaussian filter** with **σ = 1**.
- `imfilter(double(gray_img), lp_filter, 'replicate')`:
  - Applies the filter to blur the image.

#### **Displaying the Blurred Image**
```matlab
figure, imshow(uint8(blurred)), title('Low-Pass Filter (Blur)');
```
- Displays the smoothed image.

---

### **6. Computing Histogram and Probability Distribution**
```matlab
L = 256; % Intensity levels (0-255)
histogram = imhist(gray_img); % Compute histogram
pr = histogram / (M * N); % Probability distribution
```
- `imhist(gray_img)` → Computes the histogram of grayscale intensities.
- `pr = histogram / (M * N);` → Normalizes the histogram to get a probability distribution.

#### **Displaying the Original Histogram**
```matlab
figure, imhist(gray_img), title('Original Histogram');
```
- `imhist(gray_img)` → Plots the histogram of the original grayscale image.

---

### **7. Histogram Equalization**
```matlab
cdf = cumsum(pr); % Compute CDF
sk = round((L - 1) * cdf); % Transform function using CDF
```
- `cumsum(pr)` → Computes the **Cumulative Distribution Function (CDF)**.
- `sk = round((L - 1) * cdf);` → Maps pixel values using the transformation function.

#### **Applying the Transformation to the Image**
```matlab
equalized_img = sk(double(gray_img) + 1);
```
- The transformation `sk(double(gray_img) + 1)` applies histogram equalization.

#### **Displaying the Equalized Image**
```matlab
figure, imshow(uint8(equalized_img)), title('Histogram Equalized Image');
```
- Displays the enhanced image with a more balanced contrast.

#### **Displaying the Equalized Histogram**
```matlab
figure, imhist(uint8(equalized_img)), title('Equalized Histogram');
```
- Displays the histogram of the equalized image.

---

### **Summary of Operations**
| Step | Operation | Purpose |
|------|----------|---------|
| 1 | Read and convert image | Convert RGB to grayscale |
| 2 | Display images | Show original and grayscale images |
| 3 | High-pass filtering | Edge detection using Laplacian filter |
| 4 | Low-pass filtering | Smooth image using Gaussian filter |
| 5 | Compute histogram | Analyze intensity distribution |
| 6 | Histogram equalization | Improve image contrast |
