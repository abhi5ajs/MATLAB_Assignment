function [salt, gau, mynoise] = Trial_7(Noise, m, d, var_gauss)
% Features -> Using imread to read the jpeg
%%
% User define the parameter for generating images with noise
    if Noise == 0
        original_pic_2 = IMAGE;
        imshow(original_pic_2)
        title('Image Without Noise');
        fname_2 = sprintf('images2/frame%d.png',i);
        saveas(gcf,'fname_2.png');
        IMAGE_1 = imread('fname_2.png');
        figure(2);
        Output = IMAGE_1;
        drawnow; % Force display to update immediately.
        imwrite(Output ,sprintf('IMAGE_Without_0%d.png',i)); % will create mask1, mask2,...
    elseif Noise == 1 % If we add different valur of "d"
        original_pic_3 = IMAGE;
        salt = imnoise(original_pic_3, 'salt & pepper', d);% adds salt and pepper noise, where d is the noise density. This affects approximately d*numel(Image_1) pixels.
        imshow(salt);
        title('Salt & Pepper Image');
        fname_3 = sprintf('images3/frame%d.png',i);
        saveas(gcf,'fname_3.png');
        figure(3);
        IMAGE_2 = imread('fname_3.png');
        Output = IMAGE_2;
        drawnow; % Force display to update immediately.
        imwrite(Output ,sprintf('IMAGE_With_Salt&Pepper_Noise_0%d.png',i)); % will create mask1, mask2,...
    elseif Noise == 2
        original_pic_4 = IMAGE;
        gau = imnoise(original_pic_4, 'gaussian');%adds zero-mean, Gaussian white noise with variance of 0.01 to grayscale image_1.
        imshow(gau);
        title('Gaussian Image');
        fname_4 = sprintf('images4/frame%d.png',i);
        saveas(gcf,'fname_4.png');
        figure(3);
        IMAGE_4 = imread('fname_4.png');
        Output = IMAGE_4;
        drawnow; % Force display to update immediately.
        imwrite(Output ,sprintf('IMAGE_With_Gaussian_Noise_0%d.png',i)); % will create mask1, mask2,...
    elseif Noise == 3
        original_pic_5 = IMAGE;
        mynoise = m + sqrt(var_gauss)*randn(size(original_pic_5)); %adds Gaussian white noise with mean m and variance var_gauss.
        imshow(mynoise,[]);
        title('Generated Gaussian Noise');
        fname_5 = sprintf('images5/frame%d.png',i);
        saveas(gcf,'fname_5.png');
        figure(4);
        IMAGE_5 = imread('fname_5.png');
        Output = IMAGE_5;
        drawnow; % Force display to update immediately.
        imwrite(Output ,sprintf('IMAGE_With_Generated_Gaussian_Noise_0%d.png',i)); % will create mask1, mask2,...
    elseif Noise == 4
        original_pic_6 = IMAGE;
        salt = imnoise(original_pic_6, 'salt & pepper', d);
        gau = imnoise(original_pic_6, 'gaussian');
        SP_GN = (salt + gau)/2;
        imshow(SP_GN);
        title('Salt & Pepper + Gaussian Noise');
        fname_5 = sprintf('images6/frame%d.png',i);
        saveas(gcf,'fname_6.png');
        figure(4);
        IMAGE_6 = imread('fname_6.png');
        Output = IMAGE_6;
        drawnow; % Force display to update immediately.
        imwrite(Output ,sprintf('IMAGE_With_Salt&Pepper_and_Gaussian_Noise_0%d.png',i)); % will create mask1, mask2,...
    else Noise == 5;
        original_pic_7 = IMAGE;
        salt = imnoise(original_pic_7, 'salt & pepper', d);
        mynoise = imnoise(original_pic_7, 'gaussian', m, var_gauss);
        SP_GGN = (salt + mynoise)/2;
        imshow(SP_GGN);
        title('Salt & Pepper + Generated Gaussian Noise');
        fname_5 = sprintf('images7/frame%d.png',i);
        saveas(gcf,'fname_7.png');
        figure(4);
        IMAGE_7 = imread('fname_7.png');
        Output = IMAGE_7;
        drawnow; % Force display to update immediately.
        imwrite(Output ,sprintf('IMAGE_With_Salt&Pepper_and_Generated_Gaussian_Noise_0%d.png',i)); % will create mask1, mask2,...    
    end
end