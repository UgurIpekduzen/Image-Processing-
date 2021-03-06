close all;
clear all;
clc;

ci = 0; cj = 0;
x = imread('ugur.jpg');
x = x(: , : , 1);
figure(1);
imshow(x);
x = double(x);

[M,N] = size(x);

result = zeros(M,N);

for m = 0 : M - 1
    for n = 0 : N - 1
        if (m == 0) 
                ci = 1 / sqrt(M); 
        else
            ci = sqrt(2) / sqrt(M); 
        end
        if (n == 0) 
            cj = 1 / sqrt(N); 
        else
            cj = sqrt(2) / sqrt(N); 
        end
        
        sum = 0;
        for i = 0: M - 1
            for j = 0: N - 1
                col = x(i + 1, j + 1) * cos((2 * i + 1) * m * pi / (2 * M)) *  cos((2 * j + 1) * n * pi / (2 * N)); 
                sum = sum + col; 
            end
        end
        result(m + 1, n + 1) = ci * cj * sum; 
    end
end

compressedImg = zeros(100,100);
compressedImg(1:50,1:50) = result(1:50,1:50);
compressedImg = uint8(idct2(compressedImg));
figure(2);
imshow(compressedImg);