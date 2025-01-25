% By Sumaiya 
% Practice1_Question5
% Read the images
im1 = imread('flower.jpg');
im2 = imread('download.jpg'); 


im1 = double(im1);
im2 = double(im2);

% Get the size of the first image
[height1, width1, ~] = size(im1);

% Resize the second image to match the size of the first image
im2_resized = imresize(im2, [height1, width1]);

% Create a figure
figure;

% Display the first image in the first subplot
subplot(3, 3, 1); % 3 rows, 3 columns, first subplot
imshow(uint8(im1));
title('Image 1 (Flower)');

% Display the resized second image in the second subplot
subplot(3, 3, 2); % 3 rows, 3 columns, second subplot
imshow(uint8(im2_resized));
title('Image 2 (Resized to match Image 1)');

% Add blend mode
E_add = im1 + im2_resized;
subplot(3, 3, 3);
imshow(uint8(E_add));
title('Add Blend');

% Multiply blend mode
E_multiply = im1 .* im2_resized / 255;
subplot(3, 3, 4);
imshow(uint8(E_multiply));
title('Multiply Blend');

% Screen blend mode
E_screen = 255 - ((255 - im1) .* (255 - im2_resized)) / 255;
subplot(3, 3, 5);
imshow(uint8(E_screen));
title('Screen Blend');

% Overlay blend mode
E_overlay = (im2_resized / 255) .* (im2_resized + (2 * im1 / 255) .* (255 - im2_resized));
subplot(3, 3, 6);
imshow(uint8(E_overlay));
title('Overlay Blend');

% Dodge blend mode
E_dodge = 256 * im2_resized ./ ((255 - im1) + 1);
subplot(3, 3, 7);
imshow(uint8(E_dodge));
title('Dodge Blend');

% Burn blend mode
E_burn = 255 - (256 * (255 - im2_resized) ./ (im1 + 1));
subplot(3, 3, 8);
imshow(uint8(E_burn));
title('Burn Blend');
