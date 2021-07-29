function [A, B,J] = Trial(salt, gau, mynoise);
%% Features:
% Using imread to read the jpeg
A = imread('figure(1).jpg');
I = imread('fname3.jpg');
J = imread('fname4.jpg');

figure(1); % GENERATING IMAGE A
imshow(A);
imhist(A); % Generatinh histogram

figure(2); % GENERATING IMAGE I
imshow(I);

figure(3); % GENERATING IMAGE J
imshow(J);

% make a function to draw the background so we can insert homogenous gray backgrounds in the range [0,255] (later we may add other things in the background) 
Agray = rgb2gray(A);    % Changing Image A to Gray Scale 
imshow(Agray);          

Igray = rgb2gray(I);    % Changing Image I to Gray Scale  
imshow(Igray);           

Jgray = rgb2gray(J);    % Changing Image J to Gray Scale  
imshow(Jgray);  

%level = graythresh(A); % Automatic way to find the resonating point from histogram
%Athresh = im2bw(A, level);

level = 125;            % Manually finding resonating point from histogram of A 
Athresh = im2bw(A, level/255);

figure(4);               
imshowpair(A, Athresh, 'montage'); % Comparing images with different homogenous background
%% --make a function to add noise to the whole image with various parameters like the type of noise & parameters for that.  See link.
%--> Using imnoise function: 
%variable: 
image_size = 256;       % Image size is 256x256; can be changed
noise_denisty = 0.02;   % Creating a noise density
mean_1 = 0;             % To create guassian effect with no mean  
variance_1 = 0.01;      % TO create guassian effect with low variance
mean_2 = 6;             % To create guassian effect with high mean
variance_2 = 225;       % TO create guassian effect with high variance

figure(5);
%1
subplot(2,2,1);
original_pic = imresize(A,[image_size image_size],'nearest');
imshow(original_pic);
title('Original Image');
%2
salt = imnoise(original_pic, 'salt & pepper', noise_denisty);% why 0.02
subplot(2,2,2);
imshow(salt);
title('Salt & Pepper Image');
%3
gau = imnoise(original_pic, 'gaussian', mean_1, variance_1); 
subplot(2,2,3);
imshow(gau);
title('Gaussian Image');
%4
mynoise = mean_2 + sqrt(variance_2)*randn(image_size,image_size);
subplot(2,2,4);
imshow(mynoise,[]);
title('Generated Gaussian Noise');
end 