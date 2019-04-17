close all;
clear all;
clc;

x = imread('ugur.jpg');
x = x(: , : , 1);
figure(1);
imshow(x);
x = double(x);
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
compressedImg = zeros(100,100);
compressedImg(1:50,1:50) = result(1:50,1:50);
compressedImg = uint8(abs(ifft2(compressedImg)));
figure(2);
imshow(compressedImg);



