function Trial_7(i, image, noise, noise_mean, noise_density, var_gauss)
% Features -> Using imread to read the jpeg
%%
% User define the parameter for generating images with noise
image_1 = imread(image);
imshow(image_1);

if noise == 0
    original_pic_2 = image;
    imshow(original_pic_2);
    title('image Without noise');
    fname_2 = sprintf('images2/frame%d.png',i);
    saveas(gcf,'fname_2.png');
    image_1 = imread('fname_2.png');
    figure(2);
    Output = image_1;
    drawnow; % Force display to update immediately.
    imwrite(Output ,sprintf('image_Without_Noise0%d.png',i)); % will create mask1, mask2,...

elseif noise == 1 % If we add different valur of "d"
    original_pic_3 = image;
    salt = imnoise(original_pic_3, 'salt & pepper', noise_density);% adds salt and pepper noise, where d is the noise density. This affects approximately d*numel(image_1) pixels.
    imshow(salt);
    title('Salt & Pepper image');
    fname_3 = sprintf('images3/frame%d.png',i);
    saveas(gcf,'fname_3.png');
    figure(3);
    image_2 = imread('fname_3.png');
    Output = image_2;
    drawnow; % Force display to update immediately.
    imwrite(Output ,sprintf('image_With_Salt&Pepper_noise_0%d.png',i)); % will create mask1, mask2,...

elseif noise == 2
    original_pic_4 = image;
    gau = imnoise(original_pic_4, 'gaussian');%adds zero-mean, Gaussian white noise with variance of 0.01 to grayscale image_1.
    imshow(gau);
    title('Gaussian image');
    fname_4 = sprintf('images4/frame%d.png',i);
    saveas(gcf,'fname_4.png');
    figure(3);
    image_4 = imread('fname_4.png');
    Output = image_4;
    drawnow; % Force display to update immediately.
    imwrite(Output ,sprintf('image_With_Gaussian_noise_0%d.png',i)); % will create mask1, mask2,...

elseif noise == 3
    original_pic_5 = image;
    mynoise = noise_mean + sqrt(var_gauss)*randn(size(original_pic_5)); %adds Gaussian white noise with mean m and variance var_gauss.
    imshow(mynoise,[]);
    title('Generated Gaussian noise');
    fname_5 = sprintf('images5/frame%d.png',i);
    saveas(gcf,'fname_5.png');
    figure(4);
    image_5 = imread('fname_5.png');
    Output = image_5;
    drawnow; % Force display to update immediately.
    imwrite(Output ,sprintf('image_With_Generated_Gaussian_noise_0%d.png',i)); % will create mask1, mask2,...
elseif noise == 4
    original_pic_6 = image;
    salt = imnoise(original_pic_6, 'salt & pepper', noise_density);
    gau = imnoise(original_pic_6, 'gaussian');
    SP_GN = (salt + gau)/2;
    imshow(SP_GN);
    title('Salt & Pepper + Gaussian noise');
    fname_5 = sprintf('images6/frame%d.png',i);
    saveas(gcf,'fname_6.png');
    figure(4);
    image_6 = imread('fname_6.png');
    Output = image_6;
    drawnow; % Force display to update immediately.
    imwrite(Output ,sprintf('image_With_Salt&Pepper_and_Gaussian_noise_0%d.png',i)); % will create mask1, mask2,...

else noise = 5;
    original_pic_7 = image;
    salt = imnoise(original_pic_7, 'salt & pepper', noise_density);
    mynoise = imnoise(original_pic_7, 'gaussian', noise_mean, var_gauss);
    SP_GGN = (salt + mynoise)/2;
    imshow(SP_GGN);
    title('Salt & Pepper + Generated Gaussian noise');
    fname_5 = sprintf('images7/frame%d.png',i);
    saveas(gcf,'fname_7.png');
    figure(4);
    image_7 = imread('fname_7.png');
    Output = image_7;
    drawnow; % Force display to update immediately.
    imwrite(Output ,sprintf('image_With_Salt&Pepper_and_Generated_Gaussian_noise_0%d.png',i)); % will create mask1, mask2,...
end
end