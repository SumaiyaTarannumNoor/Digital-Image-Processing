clc
clear all
close all

fontSize = 15;

footBall=imread('footBall_orig.jpg');
footBall=rgb2gray(footBall);

[rows, columns, numberOfColorChannels] = size(footBall);


PQ = paddedsize(size(footBall));
% F=fft2(double(footBall),PQ(1),PQ(2));

% sigma = 3; n = 9;
% hz = fspecial('gaussian',[9,9],sigma);

n = 9;
hz = (1/(n*n))*ones(n,n);

tic
HZ=fftshift(fft2(double(hz), PQ(1), PQ(2)));


% dist = distmatrix(PQ(1), PQ(2));
% dist = fftshift(dist);
% % HZ = double(dist <=50); % low pass
%  HZ = double(dist > 50); % high pass

% Fourier transform the noisy image.
freqDomainImage = fftshift(fft2(footBall, PQ(1), PQ(2)));

% Now do filtering in the frequency domain
filteredFreqDomain = freqDomainImage .* HZ; %gaussianFreqFilter;

% Now transform back to spatial domain:
spatialImage = abs(ifft2(ifftshift(filteredFreqDomain),PQ(1), PQ(2)));  %abs abstract
toc %tic tok time count

% Display results:
subplot(2, 2, 1); imshow(footBall, []); title('Freq Domain Filter', 'FontSize', fontSize); axis on;
% subplot(2, 2, 1); imshow(mat2gray(out), []);
subplot(2, 2, 2); imshow(log(abs(freqDomainImage)), []); title('Original Freq Domain Image', 'FontSize', fontSize); axis on;
subplot(2, 2, 3); imshow(log(abs(filteredFreqDomain)), []);  title('Filtered Freq Domain Image', 'FontSize', fontSize); axis on;
subplot(2, 2, 4); imshow(spatialImage(1:size(footBall,1), 1:size(footBall,2)), []); % cropping of g(x,y)
title('Back in Spatial Domain', 'FontSize', fontSize); axis on;



