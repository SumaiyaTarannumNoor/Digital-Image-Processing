clc;
clear all;
close all;

N = 100;
x = randn(1, N); 


X = FT(x);
Xfilter = X;
Xfilter(floor(N/2)+1:end) = 0;  % low freq

% inverse FFT
x_inv = IFT(Xfilter);
x_inv = real(x_inv);  % real 

D = sqrt(sum((x - x_inv).^2));


figure;
plot(x, 'b-', 'LineWidth', 1.5); hold on;
plot(x_inv, 'r-', 'LineWidth', 1.5);  
legend('Original Signal', 'Reconstructed Signal');
xlabel('Sample Index');
ylabel('Amplitude');
title(['Signal Reconstruction using Top 50% Frequency (ED = ' num2str(D) ')']);
grid on;

% FT
function X = FT(x)
    N = length(x);
    X = zeros(1, N);
    for k = 1:N
        sum_val = 0;
        for n = 1:N
            sum_val = sum_val + x(n) * exp(-1j * 2 * pi * (k-1) * (n-1) / N);
        end
        X(k) = sum_val;
    end
end

% IFT
function x = IFT(X)
    N = length(X);
    x = zeros(1, N);
    for n = 1:N
        sum_val = 0;
        for k = 1:N
            sum_val = sum_val + X(k) * exp(1j * 2 * pi * (k-1) * (n-1) / N);
        end
        x(n) = sum_val / N; 
    end
end
