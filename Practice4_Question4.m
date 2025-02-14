A = [1, 2, 4, 4];  
M = 4;             

F = zeros(1, M);   

for u = 0:M-1
    sum = 0;  
    for i = 0:M-1
        sum = sum + A(i+1) * exp(-1j * 2 * pi * u * i / M);
    end
    F(u+1) = sum;
end

disp('Fourier Spectrum:');
disp(F);
