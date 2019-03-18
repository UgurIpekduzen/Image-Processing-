% + In image choise(1)
%   image name = ugur.jpg
% + In matrix choise(2)
%   X = [2 1 2; 3 4 1; 1 5 6];

% Filters(H)
% h1 = [1 1; -1 -1];
% h2 = [1 -1; 1 -1];
% h3 = [0 255; 0 255];
% h4 = [1 -1; -1 1];
% h5 = [2 1; 5 2];
% h6 = [0.75 0.75; 0.75 0.75];
% h7 = [0.5 0.5; 0.5 0.5];

function customConv2
    filterSize = input('Enter filter size: ');
    H = zeros(filterSize,filterSize);
    
    for x = 1 : filterSize
        for y = 1 : filterSize
            value = input(['Enter [' num2str(x) ',' num2str(y) '] value: ']);
            H(x, y) = value;
        end
    end
    
    choice = input('For image: 1, for matrix: 2 ');
    if(choice == 1) 
        message = 'enter image name: ';
        imgName = input(message,'s');
        img = imread(imgName);
        
        figure(1);
        imshow(img);
        title('Original');
        figure(2);
        imgNew = conv2Filter(double(img),double(H));
        imshow(uint8(imgNew));
        title('With 2D Convoluiton Sum');
    
    elseif(choice == 2)
        matrixSize = input('Enter matrix size: ');
        X = zeros(matrixSize,matrixSize);
        
        for a = 1 : matrixSize
            for b = 1 : matrixSize
                value = input(['Enter [' num2str(a) ',' num2str(b) '] value: ']);
                X(a, b) = value;
            end
        end
        disp('Result: ');
        conv2Filter(X,H)
    end
    
    function Y = conv2Filter(X, H)
        temp = H(1,2);
        H(1,2)= H(2,1);
        H(2,1) = temp;

        [M1, M2] = size(X);
        [N1, N2] = size(H);

        mulMatrix = zeros((N1-1)*2 + M1, (N2-1)*2 + M2);

        for i = 1 : M1
            for j = 1 : M2
                mulMatrix(N1 - 1 + i, N2 - 1 + j) = X(i, j);
            end
        end

        Y = zeros(N1 + M1 - 1, N2 + M2 - 1);
        for n1 = 1 : N1 + M1 - 1
            for n2 = 1: N2 + M2 - 1
                t = 0;
                for k1 = 1: N1 
                    for k2 = 1: N2 
                        t = t + H(k1, k2) * mulMatrix(k1 - 1 + n1,k2 - 1 + n2);
                    end
                end
                Y(n1, n2) = t;
            end
        end
    end
end
