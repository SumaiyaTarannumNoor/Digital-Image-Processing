% Practice 1 - Q3


im = imread('flower.jpg');  



%% Manually converting to grayscale

[r, c, d] = size(im);  

imgray = zeros(r, c);   



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



%% Intensity-Level Slicing

r_min = 100;  

r_max = 150;  

output_value = 255;  



% Create the output image by slicing the intensities

sliced_img = zeros(r, c); 



% Apply the slicing condition

for i = 1:r

    for j = 1:c

        if imgray(i, j) >= r_min && imgray(i, j) <= r_max

            sliced_img(i, j) = output_value;  

        else

            sliced_img(i, j) = 0;  % Set pixel to 0 (background)

        end

    end

end



% Convert to uint8 format

sliced_img = uint8(sliced_img);



%% Displaying the original and sliced images

figure;

subplot(1, 2, 1);

imshow(imgray);  

title('Original Grayscale Image');



subplot(1, 2, 2);

imshow(sliced_img);  

title('Intensity-Level Sliced Image');
