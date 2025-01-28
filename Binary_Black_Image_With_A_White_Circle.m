% Practice 1 Question 6
% Create a binary black image of size 512x512. Then, write a nested loop to draw a white (filled) circle with a radius of 100 pixels at the center of the image

% Create a  black image of size 512x512
im = zeros(512, 512);

center_i = 512/2;
center_j = 512/2;
radius = 100;

% nested loop 
for i = 1:512
    for j = 1:512
        % Calculate the distance from the current pixel to the center
        distance = sqrt((i - center_i)^2 + (j - center_j)^2);
        
        % If the distance is less than or equal to the radius, color the pixel white
        if distance <= radius
            im(i, j) = 1; % White color in binary image
        end
    end
end

% Display the image
imshow(im);
