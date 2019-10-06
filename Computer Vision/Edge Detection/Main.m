img = double(rgb2gray(imread('ugur.jpg')));

figure, imshow(SobelEdgeDetection(img));
title('Sobel'); drawnow;
figure, imshow(PrewittEdgeDetection(img));
title('Prewitt'); drawnow;
figure, imshow(GaussianBlur(img));
title('Gauss'); drawnow;