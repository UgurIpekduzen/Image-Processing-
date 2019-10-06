
function blurredImage = GaussianBlur(image)
I = double(image);

%Design the Gaussian Kernel
%Standard Deviation
sigma = 1;
%Window size
sz = 2;
[x,y]=meshgrid(-sz:sz,-sz:sz);

expComp = -(x.^2+y.^2)/(2*sigma*sigma);
kernel= exp(expComp)/(2*pi*sigma*sigma);
 
%Pad the vector with zeros
I = padarray(I,[sz sz]);

blurredImage = ConvolutionSum(I, kernel);
%Image without Noise after Gaussian blur
blurredImage = uint8(blurredImage);
