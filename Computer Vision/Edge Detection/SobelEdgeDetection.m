function [gradientImage] = SobelEdgeDetection(image)
sobelX = [1 0 -1; 2 0 -2; 1 0 -1];
sobelY = [1 2 1; 0 0 0; -1 -2 -1];

GX = ConvolutionSum(image, sobelX);
GY = ConvolutionSum(image, sobelY);

edgeMagnitude = sqrt(GX.^2 + GY.^2);
thresh = edgeMagnitude  < 101;
edgeMagnitude(thresh) = 0;

gradientImage = edgeMagnitude;
