i = imread('MRI3.jpeg');
subplot(1,3,1)
imshow(i);
title('Original Image');
%Find fft of image
grayi = rgb2gray(i);
fftimage = fftshift(fft2(grayi));
subplot(1,3,2)
fftshow = mat2gray(log(1+abs(fftimage)));
imshow(fftshow)
title('FFT of Image');
%Take ifft of image
inverse = abs(ifft2(fftimage));
inverse = mat2gray(inverse);
subplot(1,3,3)
imshow(inverse);
title('IFFT of Image');