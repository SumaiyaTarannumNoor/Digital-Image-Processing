% Image Histogram Creation. Normalize it and show it side by side.

im = imread('flower.jpg'); 



%% Manually converting to grayscale

[r, c, d] = size(im);  % Get the size of the image

imgray = zeros(r, c);   % Initialize a matrix for the grayscale image



% Loop through each pixel and apply the RGB to grayscale conversion formula

for i = 1:r

    for j = 1:c

        red = im(i,j,1);      % Red channel

        green = im(i,j,2);    % Green channel

        blue = im(i,j,3);     % Blue channel

        % Grayscale conversion formula

        imgray(i,j) = 0.299 * red + 0.587 * green + 0.114 * blue;

    end

end



% Convert to uint8 format

imgray = uint8(imgray);



%% Compute the histogram of the grayscale image

% The range of pixel values is 0 to 255 for a grayscale image

original_hist = zeros(1, 256);  % Initialize the histogram array



% Count the occurrences of each pixel value

for i = 1:r

    for j = 1:c

        pixel_value = imgray(i,j);  % Get the pixel value

        original_hist(pixel_value + 1) = original_hist(pixel_value + 1) + 1;  % Increment the corresponding bin

    end

end



% Normalize the histogram

num_pixels = r * c;  % Total number of pixels

normalized_hist = original_hist / num_pixels;  % Normalize by the total number of pixels



%% Display the original and normalized histograms side by side

figure;

subplot(1, 2, 1);

bar(0:255, original_hist, 'histc');  % Plot the original histogram

title('Original Histogram');

xlabel('Intensity Levels');

ylabel('Frequency');



subplot(1, 2, 2);

bar(0:255, normalized_hist, 'histc');  % Plot the normalized histogram

title('Normalized Histogram');

xlabel('Intensity Levels');

ylabel('Normalized Frequency');

