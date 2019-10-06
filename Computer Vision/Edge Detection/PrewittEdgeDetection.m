function [gradientImage] = PrewittEdgeDetection(image)
prewittX = [1 0 -1; 1 0 -1; 1 0 -1];
prewittY = [1 1 1; 0 0 0; -1 -1 -1];

GX = ConvolutionSum(image, prewittX);
GY = ConvolutionSum(image, prewittY);

edge = sqrt(GX.^2 + GY.^2);
thresh = edge < 101;
edge(thresh) = 0;

gradientImage = edge;
