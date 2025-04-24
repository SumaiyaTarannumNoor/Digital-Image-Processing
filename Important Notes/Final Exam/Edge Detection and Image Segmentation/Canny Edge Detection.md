# Canny Edge Detection

Canny edge detection is a popular multi-stage algorithm used in image processing to identify and extract the edges of objects within an image. It was developed by John F. Canny and is known for its ability to:

- Minimize false edge detections
- Accurately locate edges
- Preserve edge continuity

---

## Stages of the Canny Edge Detection Algorithm

### 1. Noise Reduction
- The first step involves reducing noise in the image using a Gaussian filter.
- This step helps to prevent false edge detection caused by image noise.

### 2. Gradient Calculation
- The smoothed image is filtered with the Sobel operator in both the horizontal and vertical directions.
- This produces gradient magnitude and gradient direction at each pixel, indicating where the intensity changes most sharply.

### 3. Non-Maximum Suppression
- This step thins the detected edges by keeping only local maxima of the gradient magnitude in the gradient direction.
- It suppresses all other pixels to zero, producing thin edge lines.

### 4. Hysteresis Thresholding
- A double threshold technique is used:
  - **High Threshold**: Pixels with gradient magnitude above this value are considered strong edges.
  - **Low Threshold**: Pixels below this value are suppressed.
  - **Between Thresholds**: Pixels are considered weak edges and only retained if they are connected to strong edges.
- This step ensures edge continuity and reduces false positives.

---

## Summary Table

| Step                    | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| Noise Reduction         | Apply Gaussian blur to reduce noise                                        |
| Gradient Calculation    | Use Sobel operator to compute gradient magnitude and direction              |
| Non-Maximum Suppression | Thin the edges by keeping local maxima only                                 |
| Hysteresis Thresholding | Apply high and low thresholds to detect and connect edges accurately        |
