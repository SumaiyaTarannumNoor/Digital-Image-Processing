clc;
clear;
close all;
im = imread('footBall_orig.jpg');
im = rgb2gray(im);
im = double(im);
filsize = [5, 9, 15, 21];
filn = length(filsize);
[r, c] = size(im);
spatialtime = zeros(1, filn);
freqtime = zeros(1, filn);
for f = 1:filn
   n = filsize(f);
   fil = ones(n, n) / (n * n);
   pad = floor(n / 2);
   padim = zeros(r + 2 * pad, c + 2 * pad);
   padim(pad+1:end-pad, pad+1:end-pad) = im;
   for i = 1:pad
       padim(i, pad+1:end-pad) = im(1, :);
       padim(end-i+1, pad+1:end-pad) = im(end, :);
   end
   for j = 1:pad
       padim(:, j) = padim(:, pad+1); 
       padim(:, end-j+1) = padim(:, end-pad);
   end
   fspatialim = zeros(r, c);
   tic;
   for i = 1:r
       for j = 1:c
           rg = padim(i:i+n-1, j:j+n-1);
           fspatialim(i, j) = sum(sum(rg .* fil));
       end
   end
   spatialtime(f) = toc;
   fftsize = 2^nextpow2(max(r, c));
   padim_fft = zeros(fftsize, fftsize);
   padim_fft(1:r, 1:c) = im;
   F_im = fft2(padim_fft);
   filpad = zeros(fftsize, fftsize);
   filpad(1:n, 1:n) = fil;
   F_fil = fft2(filpad);
   tic;
   Fout = F_im .* F_fil;
   filim_freq = real(ifft2(Fout));
   filim_freq = filim_freq(1:r, 1:c);
   freqtime(f) = toc;
   figure;
   subplot(1,3,1); imshow(uint8(im)); title(['Original Image (n = ', num2str(n), ')']);
   subplot(1,3,2); imshow(uint8(fspatialim)); title(['Spatial Filtering (n = ', num2str(n), ')']);
   subplot(1,3,3); imshow(uint8(filim_freq)); title(['Frequency Filtering (n = ', num2str(n), ')']);
end
disp('Filter Size   Spatial Domain Time   Frequency Domain Time');
for f = 1:filn
   disp([num2str(filsize(f)), '               ', num2str(spatialtime(f)), '                 ', num2str(freqtime(f))]);
end
