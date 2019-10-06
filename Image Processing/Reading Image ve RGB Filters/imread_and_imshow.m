clear
clc
close all

img = imread('ugur.jpg');

blackAndWhite = img(:,:,1);

redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);

allBlack = zeros(size(img,1), size(img,2), 'uint8')

justRed = cat(3, redChannel, allBlack, allBlack);
justGreen = cat(3, allBlack, greenChannel, allBlack);
justBlue = cat(3, allBlack, allBlack, blueChannel);
recombinedRGB = cat(3, redChannel, greenChannel, blueChannel);

subplot(1,6,1);
imshow(blackAndWhite); 

subplot(1,6,2);
imshow(justRed);

subplot(1,6,3);
imshow(justGreen);

subplot(1,6,4);
imshow(justBlue);

subplot(1,6,5);
imshow(recombinedRGB);



