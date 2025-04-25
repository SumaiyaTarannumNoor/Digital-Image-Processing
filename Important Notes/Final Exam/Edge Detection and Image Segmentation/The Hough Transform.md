# Hough Transform

The **Hough Transform** is a feature extraction technique used in:

- Image analysis  
- Computer vision  
- Pattern recognition  
- Digital image processing  

Its primary purpose is to **detect imperfect instances of objects** that belong to a certain class of shapes, such as lines, circles, or ellipses.

---

## How It Works

The Hough Transform operates through a **voting procedure**:

- Each point in the image space casts votes in a parameter space.
- Accumulated votes indicate the likelihood of a particular shape (e.g., line, circle) being present in the image.
- Peaks in the accumulator space correspond to detected shapes.

---

## Common Use Cases

- Detecting **lines** in edge-detected images.
- Identifying **circles** (Hough Circle Transform).
- Shape recognition in noisy or occluded images.

---

## Summary

| Property              | Description                                                  |
|-----------------------|--------------------------------------------------------------|
| Technique Type        | Feature extraction                                           |
| Based On              | Voting in parameter space                                    |
| Detects               | Lines, circles, ellipses, or other parametric shapes         |
| Advantage             | Robust to noise and partial occlusion                        |


## Link 
- https://homepages.inf.ed.ac.uk/rbf/HIPR2/hough.htm
