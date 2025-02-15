% Sumaiya
im = imread('footBall_orig.jpg');
gim = rgb2gray(im);
F = fft2(gim);
F_real = real(F);  
reconstructed_real = ifft2(F_real);   % Inverse FFT
F_imag = imag(F);   %  imaginary part
reconstructed_imag = ifft2(F_imag);
subplot(1, 3, 1);
imshow(gim);
title('Original Image');
subplot(1, 3, 2);
imshow(abs(reconstructed_real), []); 
title('Reconstructed (Real Part)');
subplot(1, 3, 3);
imshow(abs(reconstructed_imag), []); 
title('Reconstructed (Imaginary Part)');
