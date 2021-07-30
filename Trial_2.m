function [original_pic, salt, gau, mynoise] = Trial(Image_1, Image_2, Image_3)
%% Features -> Using imread to read the jpeg
% The function input are the .jpg/.png files which is required to be read in Matlab format. 
% Replace the 'Filename' with the image whihc needs to be imported in form of .jpg/.png format

% For e.g., in our case: 
%'Filename_1.jpg' = 'figure_1.jpg'; %'Filename_2.jpg' = 'fname_3.jpg'; 'Filename_3.jpg' = 'fname_4.jpg'

Image_1 = imread('Filename_1.jpg'); 
Image_2 = imread('Filename_2.jpg'); 
Image_3 = imread('Filename_3.jpg'); 

% We generate histogram to read the respnating point of the image on x-axis
figure(1);          % GENERATING IMAGE_1
imhist(Image_1);    % Generating histogram to find the resonating level on x-axis
figure(2);          % GENERATING IMAGE_2
imhist(Image_2);    % Generating histogram to find the resonating level on x-axis
figure(3);          % GENERATING IMAGE_3
imhist(Image_3);    % Generating histogram to find the resonating level on x-axis
%% make a function to draw the background so we can insert homogenous gray backgrounds in the range [0,255] (later we may add other things in the background) 
Image_1_gray = rgb2gray(Image_1);    % Changing Image_1 to Gray Scale 
imshow(Image_1_gray);                % To see the Image_1 in Gray Scale
Image_2_gray = rgb2gray(Image_2);    % Changing Image_2 to Gray Scale  
imshow(Image_2_gray);                % To see the Image_2 in Gray Scale
Image_3_gray = rgb2gray(Image_3);    % Changing Image_3 to Gray Scale  
imshow(Image_3_gray);                % To see the Image_3 in Gray Scale

% level = 125; % Manually finding resonating point from histogram of A 
% Athresh = im2bw(A, level/255);

level_1 = graythresh(Image_1);       % Automatic way to find the resonating point/threshold point from histogram
Athresh = im2bw(Image_1, level_1);   % Converting Image_1 to Binary Image based on threshold
level_2 = graythresh(Image_2);       
Bthresh = im2bw(Image_2, level_2);   % Converting Image_2 to Binary Image based on threshold
level_3 = graythresh(Image_3);       
Cthresh = im2bw(Image_3, level_3);   % Converting Image_3 to Binary Image based on threshold

figure(4);               
imshowpair(Image_1, Athresh,'montage');   % Comparing images with different homogenous background
figure(5);                                % Try removing 'montage'
imshowpair(Image_2, Bthresh, 'montage');  % Comparing images with different homogenous background
figure(6);               
imshowpair(Image_3, Cthresh, 'montage');  % Comparing images with different homogenous background
%% --make a function to add noise to the whole image with various parameters like the type of noise & parameters for that.  See link.
% Parameters that define the Noise_Behavior.
d = 0.05;               % Creating a high and low noise density; Default = 0.05  
m = 0;                  % To create guassian effect with high & low mean; Default = 0
var_gauss = 0.01;       % TO create guassian effect with high & Low variance; Default = 0.01 

figure(7);
%1 Original Pic
subplot(2,2,1);
original_pic = Image_1;
imshow(original_pic);
title('Original Image');
%2 With Salt & Pepper Noise
salt = imnoise(original_pic, 'salt & pepper', d);% adds salt and pepper noise, where d is the noise density. This affects approximately d*numel(Image_1) pixels.
subplot(2,2,2);
imshow(salt);
title('Salt & Pepper Image'); 
%3 With Gaussian Noise
gau = imnoise(original_pic, 'gaussian');        %adds zero-mean, Gaussian white noise with variance of 0.01 to grayscale image_1.
subplot(2,2,3);
imshow(gau);
title('Gaussian Image');
%4 Gaussian Noise with variable mean and variance 
mynoise = m + sqrt(var_gauss)*randn(size(original_pic)); %adds Gaussian white noise with mean m and variance var_gauss.
subplot(2,2,4);
imshow(mynoise,[]);
title('Generated Gaussian Noise');

%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(8);
%1 Original Pic
subplot(2,2,1);
original_pic_2 = Image_2;
imshow(original_pic_2);
title('Original Image');
%2 With Salt & Pepper Noise
salt = imnoise(original_pic_2, 'salt & pepper', d);% adds salt and pepper noise, where d is the noise density. This affects approximately d*numel(Image_1) pixels.
subplot(2,2,2);
imshow(salt);
title('Salt & Pepper Image'); 
%3 With Gaussian Noise
gau = imnoise(original_pic_2, 'gaussian');        %adds zero-mean, Gaussian white noise with variance of 0.01 to grayscale image_1.
subplot(2,2,3);
imshow(gau);
title('Gaussian Image');
%4 Gaussian Noise with variable mean and variance 
mynoise = m + sqrt(var_gauss)*randn(size(original_pic_2)); %adds Gaussian white noise with mean m and variance var_gauss.
subplot(2,2,4);
imshow(mynoise,[]);
title('Generated Gaussian Noise');

%%%%%%%%%%%%%

figure(9);
%1 Original Pic
subplot(2,2,1);
original_pic_3 = Image_3;
imshow(original_pic_3);
title('Original Image');
%2 With Salt & Pepper Noise
salt = imnoise(original_pic_3, 'salt & pepper', d);% adds salt and pepper noise, where d is the noise density. This affects approximately d*numel(Image_1) pixels.
subplot(2,2,2);
imshow(salt);
title('Salt & Pepper Image'); 
%3 With Gaussian Noise
gau = imnoise(original_pic_3, 'gaussian');        %adds zero-mean, Gaussian white noise with variance of 0.01 to grayscale image_1.
subplot(2,2,3);
imshow(gau);
title('Gaussian Image');
%4 Gaussian Noise with variable mean and variance
mynoise = m + sqrt(var_gauss)*randn(size(original_pic_3)); %adds Gaussian white noise with mean m and variance var_gauss.
subplot(2,2,4);
imshow(mynoise,[]);
title('Generated Gaussian Noise');
end 