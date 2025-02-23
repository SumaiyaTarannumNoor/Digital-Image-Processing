% Step 1: Read the image and apply sepia filter
im = imread('flower.jpg');

[rows, cols] = size(im(:,:,1));

% Sepia filter matrix
sepia_filter = [0.393, 0.769, 0.189;
                0.349, 0.686, 0.168;
                0.272, 0.534, 0.131];

sepia_im = zeros(rows, cols, 3);

% Apply the sepia filter using nested loops
for i = 1:rows
    for j = 1:cols
        R = im(i, j, 1);
        G = im(i, j, 2);
        B = im(i, j, 3);

        sepia_im(i, j, 1) = sepia_filter(1, 1) * R + sepia_filter(1, 2) * G + sepia_filter(1, 3) * B;
        sepia_im(i, j, 2) = sepia_filter(2, 1) * R + sepia_filter(2, 2) * G + sepia_filter(2, 3) * B;
        sepia_im(i, j, 3) = sepia_filter(3, 1) * R + sepia_filter(3, 2) * G + sepia_filter(3, 3) * B;
    end
end

sepia_im = uint8(min(sepia_im, 255));

% Step 2: Show the original and sepia images separately
figure(1);
imshow(im);
title('Original Image');

figure(2);
imshow(sepia_im);
title('Sepia Effect');

% Step 3: Create Gaussian noise and show it
noise = imnoise(zeros(size(sepia_im)), 'gaussian', 0, 0.01);

figure(3);
imshow(noise, []);
title('Gaussian Noise');

% Step 4: Blend the sepia image with Gaussian noise
old_im = im2double(sepia_im) + noise;

old_im = min(max(old_im, 0), 1);

% Display the blended image (old image effect) separately
figure(4);
imshow(old_im);
title('Old Image Effect');
