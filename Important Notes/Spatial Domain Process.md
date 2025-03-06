# Spatial Domain Processing  

## Introduction  
**Spatial domain processing** refers to image processing techniques that operate directly on pixel values in an image. These techniques modify the intensity values of pixels based on their spatial location, enabling tasks such as image enhancement, filtering, and noise reduction.  

## Key Concepts  

### 1. Pixel Manipulation  
Spatial domain techniques work by altering the **pixel values** of an image using mathematical operations. The general form of a spatial transformation is:  

\[
g(x, y) = T[f(x, y)]
\]

Where:  
- \( f(x, y) \) is the original image.  
- \( g(x, y) \) is the processed image.  
- \( T \) is a transformation function applied to the pixels.  

### 2. Point Processing  
Point processing involves modifying individual pixels **without considering neighboring pixels**. Common operations include:  
- **Contrast adjustment**: Scaling pixel values to enhance details.  
- **Thresholding**: Converting an image to binary based on intensity values.  
- **Histogram equalization**: Enhancing image contrast using histogram distribution.  

### 3. Neighborhood Processing (Filtering)  
Neighborhood processing modifies a pixel based on surrounding pixels using a **filter kernel (mask or window)**. Common types include:  
- **Smoothing filters** (Low-pass filters): Reduce noise and blur the image (e.g., Gaussian filter, averaging filter).  
- **Sharpening filters** (High-pass filters): Enhance edges and details (e.g., Laplacian filter, Sobel filter).  
- **Edge detection**: Identifying boundaries between objects (e.g., Prewitt, Canny edge detectors).  

### 4. Convolution Operation  
Filtering operations in spatial domain processing often use **convolution**, which applies a kernel to an image. The convolution operation is defined as:  

\[
g(x, y) = \sum_{i=-m}^{m} \sum_{j=-n}^{n} f(x+i, y+j) \cdot h(i, j)
\]

Where:  
- \( f(x, y) \) is the input image.  
- \( h(i, j) \) is the filter kernel.  
- \( g(x, y) \) is the output image.  

## Applications of Spatial Domain Processing  
- **Image enhancement** (contrast stretching, sharpening).  
- **Noise reduction** (smoothing, median filtering).  
- **Feature extraction** (edge detection, texture analysis).  
- **Image segmentation** (thresholding, region-based processing).  

## Advantages  
- Direct manipulation of pixel values allows for intuitive processing.  
- Efficient and widely used in real-time applications.  
- Works well for enhancing local image details.  

## Disadvantages  
- Some transformations may cause **loss of fine details**.  
- Sensitive to noise, especially in edge detection.  
- Large kernel sizes can lead to high computational costs.  

Spatial domain processing is fundamental in **computer vision, medical imaging, and digital photography**, providing essential tools for analyzing and improving image quality.  


# How to Normalize a Histogram in MATLAB?
- https://www.geeksforgeeks.org/how-to-normalize-a-histogram-in-matlab/
