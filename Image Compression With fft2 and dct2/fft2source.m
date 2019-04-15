close all;
clear all;
clc;

matrix = [2 4 ; 67 -19; 13 34 ; 89 -55; 10 0];
% x = imread('ugur.jpg');
% x = x(: , : , 1);
% figure(1);
% imshow(x);
% x = double(x);
x = matrix;
[M,N] = size(x);

result = zeros(M,N);

for m = 0 : M - 1
    for n = 0 : N - 1
        sum = 0;
        for p = 0: M - 1
            for q = 0: N - 1
                col = x(p + 1, q + 1) * exp(-1i * 2 * pi * (m*p/M + n*q/N)); 
                sum = sum + col; 
            end
        end
        result(m + 1, n + 1) = sum; 
    end
end
result
fft2(x)
% figure(2);
% result = abs(fftshift(result));
% imshow(uint8(result));
% 
% figure(3);
% F = abs(fftshift(fft2(x)));
% imshow(uint8(F));

