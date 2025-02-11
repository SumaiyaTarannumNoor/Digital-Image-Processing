% % Collected Group Code
% Practice 3 Question 2

img = imread('flower.jpg');
if size(img, 3) == 3
   img = uint8(0.2989 * double(img(:,:,1)) + 0.5870 * double(img(:,:,2)) + 0.1140 * double(img(:,:,3)));
end
% Boost factor
A = 1.5;
f_size = [3, 5, 7, 9, 11];
figure;
subplot(2,3,1), imshow(img), title('Original Image');
for i = 1:length(f_size)
   n = f_size(i); 
  
   % mean
   h = fspecial('average', [n n]); 
  
   [rows, cols] = size(img);
   blur = zeros(rows, cols, 'double');
  
   for r = floor (n/2) +1:rows- floor(n/2)
       for c = floor(n/2) +1:cols- floor(n/2)
           s = double(img(r- floor(n/2):r + floor(n/2), c-floor(n/2):c+ floor(n/2)));
           blur(r, c) = sum(s(:) .* h(:));
       end
   end
  
   % High pass
   mask = double(img) - blur;
  
   % High-Boost Filtering
   h_boost_im = uint8(double(img) + A * mask);
   h_boost_im = min(max(h_boost_im, 0), 255);
   subplot(2,3,i+1), imshow(h_boost_im, []), title(['n = ' num2str(n)]);
end
