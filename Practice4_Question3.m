clc
clear all
close all

img = imread('footBall_orig.jpg');
img = double(rgb2gray(img));

[M, N] = size(img); 
avg_spatial = sum(img(:)) / (M * N);

% Fouirer
F = fft2(img);
F_00 = F(1,1); 

avg_freq = F_00 / (M * N);

fprintf('Average in spatial domain: %.5f\n', avg_spatial);
fprintf('Average using F(0,0): %.5f\n', avg_freq);

% Verify equality
if abs(avg_spatial - avg_freq) < 1e-6
    disp('Equation verified');
else
    disp('Equation not verified');
end



