% Read the image
im = imread('footBall_orig.jpg');
% Make the image gray
im_gray = rgb2gray(image);

% Defining threshold value
T = 100;  

del_T = T; 

% Defining the changing step threshold
change_threshold = 0.00001; 

while true
    % Taking G1 and G2 from the image pixel values
    G1 = im_gray(im_gray > T); % Pixels that are greater than threshold T
    G2 = im_gray(im_gray <= T); % Pixels that are smaller than threshold T

    % Taking mean for G1 and G2
    m1 = mean(G1(:)); 
    m2 = mean(G2(:)); 

    % Calculation for New Threshold
    new_T = 0.5 * (m1 + m2);
    
    % Print the new  threshold
    fprintf('Current T: %.4f\n', new_T);
    
    % Defining condition for threshold change
    if abs(new_T - del_T) < change_threshold
        break;
    end
    
    % Replacing the old threshold value with new threshold value
    del_T = T; 
    T = new_T;
end

% Printing the final threshold value
disp(['Final Threshold (T) = ', num2str(T)]);

% Checking if the gray image value is greater than threshold
segmented_image = im_gray > T;

% Plotting Figure for Original image
figure;
subplot(1,2,1);
imshow(im_gray);
title('Original Image');

% Plotting Figure for Segmented image
subplot(1,2,2);
imshow(segmented_image);
title(['Segmented Image (T=' num2str(T) ')']);
 
