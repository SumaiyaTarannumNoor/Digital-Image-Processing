clc
clear all
close all

% A = [1 2 4 4]
% F = fft(A)
% B = ifft(F)

footBall=imread('footBall_orig.jpg');
footBall=rgb2gray(footBall);

PQ = paddedsize(size(footBall));
F=fft2(double(footBall),PQ(1),PQ(2));

im = ifft2((F));
im2=im(1:size(footBall,1), 1:size(footBall,2));

% Display the Fourier Spectrum
Fc=fftshift(F); % F
% S2=abs(Fc);
% S3=angle(Fc); % phase angle
S2=log(1+abs(Fc));
S3=log(1+angle(Fc)); % phase angle



subplot(2,2,1);
imshow(footBall,[])

subplot(2,2,2);
imshow(im2,[])

subplot(2,2,3);
% imshow(S2,[]) % Fourier Spectrum
imshow(S2 .* S2,[]) % Power Spectrum

subplot(2,2,4);
imshow(S3,[]) % phase angle
