%% Features:
A = imread('figure(1).jpg');
I = imread('fname3.jpg');
J = imread('fname4.jpg');

figure(1)
imshow(A)
imhist(A)

figure(2)
imshow(I)

figure(3)
imshow(J)

%% make a function to draw the background so we can insert homogenous gray backgrounds in the range [0,255] (later we may add other things in the background) 
Agray = rgb2gray(A);
imshow(Agray);

Igray = rgb2gray(I);
imshow(Igray)

%level = graythresh(A); automatic
%Athresh = im2bw(A, level);

level = 125; %using histpgram
Athresh = im2bw(A, level/255);

figure(4)
imshowpair(A, Athresh, 'montage');
%% --make a function to add noise to the whole image with various parameters like the type of noise & parameters for that.  See link.
figure(5)

subplot(2,2,1);
imshow(A);
title('Original Image');

salt = imnoise(A, 'salt & pepper', 0.02);
subplot(2,2,2);
imshow(salt);
title('Salt & Pepper Image');

gau = imnoise(A, 'gaussian', 0, 0.01);
subplot(2,2,3);
imshow(gau);
title('Gaussian Image');

mynoise = 6 + sqrt(225)*randn(256,256);
subplot(2,2,4);
imshow(mynoise,[]);
title('Generated Gaussian Noise');