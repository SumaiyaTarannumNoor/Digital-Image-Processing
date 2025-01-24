% Load the image. Replace 'your_image.jpg' with your actual image file
image = imread('your_image.jpg');

% Convert the image to grayscale if it is not already
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Calculate the histogram
histogram = zeros(1, 256);
for i = 1:numel(image)
    histogram(image(i) + 1) = histogram(image(i) + 1) + 1;
end

% Normalize the histogram
normalized_histogram = histogram / numel(image);

% Plot the original histogram
subplot(1, 2, 1);
bar(0:255, histogram, 'k');
title('Original Histogram');
xlabel('Pixel Value');
ylabel('Frequency');

% Plot the normalized histogram
subplot(1, 2, 2);
bar(0:255, normalized_histogram, 'k');
title('Normalized Histogram');
xlabel('Pixel Value');
ylabel('Normalized Frequency');

% Display the original and normalized histograms side-by-side
figure;
subplot(1, 2, 1);
bar(0:255, histogram, 'k');
title('Original Histogram');
xlabel('Pixel Value');
ylabel('Frequency');

subplot(1, 2, 2);
bar(0:255, normalized_histogram, 'k');
title('Normalized Histogram');
xlabel('Pixel Value');
ylabel('Normalized Frequency');
