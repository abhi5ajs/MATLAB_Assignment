% function () = GenerateImage[];
close all
% Parameters that define the behaviour.
sigma = 10;
beta = 8/3;
rho = 50;
ObjectSize = 10;
%% User define the parameter for generating images with noise
Noise     = input('Please enter whether Stake of images is required with Noise: '); %Without noise = 0, With Noise =1;
d         = input('Please enter the value of d: '); %Default = 0.05
m         = input('Please enter the mean number: '); %Default = 0
var_gauss = input('Please enter the guassian variance number: '); %Default = 0.01
%% Dynamics of Lorentz attractor
s = 50; % Level of random excitation -- for. e.g. due to turbulence.
f = @(t,a)[-sigma*a(1) + sigma*a(2) + s*randn;
    rho*a(1) - a(2) - a(1)*a(3) + s*randn; -beta*a(3) + a(1)*a(2) + s*randn];
% Simulate with two different initial conditions.
tf = 5; dt = 0.01;
[~,x1] = ode45(f,[0:dt:tf],[1 1 1]);       % Runge-Kutta 4th/5th order ODE solver
[t,x2] = ode45(f,[0:dt:tf],[-1 1 -1]);     % Runge-Kutta 4th/5th order ODE solver
% Show the trajectory.
h = figure('Color',[0.5 0.5 0.5]);
plot3(x1(:,1),x1(:,2),x1(:,3),'white'); hold on;
plot3(x2(:,1),x2(:,2),x2(:,3),'black'); view(0,90); axis off;
set(gcf,'InvertHardCopy','Off')
ax = axis;
% Generate image frames from simulation.
visibility = 1;
% High visibility. To choose lower visibility, choose number between [0,1]

% Specify the folder where the files are: Change the folder location when
% running on personal computer!!!
myFolder = 'C:\Users\DELL XPS\Dropbox\01_Quantum_Venture_Inc\Project_3_Generate_Images\Final';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
        % User clicked Cancel
        return;
    end
end



%% Generate Stakes of Images and Save with Noises
for i = 1:length(t)
    figure(2); clf;
    plot3(x1(i,1),x1(i,2),x1(i,3),'Markersize',[10],'Marker','.','LineStyle','none','Color',([255 255 255]./255));...
        view(0,90);
    axis(1.1*ax);
    axis off
    set(gcf,'InvertHardCopy','Off', 'Color', [0.5 0.5 0.5])
    hold on;
    plot3(x2(i,1),x2(i,2),x2(i,3),'r','Markersize',[10],'Marker','.','LineStyle','none','Color',([170 170 170]./255));...
        view(0,90);
    axis(1.1*ax);
    axis off
    set(gcf,'InvertHardCopy','Off', 'Color', [0.5 0.5 0.5])
    fname_1 = sprintf('images1/frame%d.png',i);
    saveas(gcf,'fname_1.png');
    IMAGE = imread('fname_1.png');
    imshow(IMAGE);
    
    [salt, gau, mynoise] = Trial_7;
    
%     if Noise == 0
%         original_pic_2 = IMAGE;
%         imshow(original_pic_2)
%         title('Image Without Noise');
%         fname_2 = sprintf('images2/frame%d.png',i);
%         saveas(gcf,'fname_2.png');
%         IMAGE_1 = imread('fname_2.png');
%         figure(2);
%         Output = IMAGE_1;
%         drawnow; % Force display to update immediately.
%         imwrite(Output ,sprintf('IMAGE_Without_0%d.png',i)); % will create mask1, mask2,...
%     elseif Noise == 1 % If we add different valur of "d"
%         original_pic_3 = IMAGE;
%         salt = imnoise(original_pic_3, 'salt & pepper', d);% adds salt and pepper noise, where d is the noise density. This affects approximately d*numel(Image_1) pixels.
%         imshow(salt);
%         title('Salt & Pepper Image');
%         fname_3 = sprintf('images3/frame%d.png',i);
%         saveas(gcf,'fname_3.png');
%         figure(3);
%         IMAGE_2 = imread('fname_3.png');
%         Output = IMAGE_2;
%         drawnow; % Force display to update immediately.
%         imwrite(Output ,sprintf('IMAGE_With_Salt&Pepper_Noise_0%d.png',i)); % will create mask1, mask2,...
%     elseif Noise == 2
%         original_pic_4 = IMAGE;
%         gau = imnoise(original_pic_4, 'gaussian');%adds zero-mean, Gaussian white noise with variance of 0.01 to grayscale image_1.
%         imshow(gau);
%         title('Gaussian Image');
%         fname_4 = sprintf('images4/frame%d.png',i);
%         saveas(gcf,'fname_4.png');
%         figure(3);
%         IMAGE_4 = imread('fname_4.png');
%         Output = IMAGE_4;
%         drawnow; % Force display to update immediately.
%         imwrite(Output ,sprintf('IMAGE_With_Gaussian_Noise_0%d.png',i)); % will create mask1, mask2,...
%     elseif Noise == 3
%         original_pic_5 = IMAGE;
%         mynoise = m + sqrt(var_gauss)*randn(size(original_pic_5)); %adds Gaussian white noise with mean m and variance var_gauss.
%         imshow(mynoise,[]);
%         title('Generated Gaussian Noise');
%         fname_5 = sprintf('images5/frame%d.png',i);
%         saveas(gcf,'fname_5.png');
%         figure(4);
%         IMAGE_5 = imread('fname_5.png');
%         Output = IMAGE_5;
%         drawnow; % Force display to update immediately.
%         imwrite(Output ,sprintf('IMAGE_With_Generated_Gaussian_Noise_0%d.png',i)); % will create mask1, mask2,...
%     elseif Noise == 4
%         original_pic_6 = IMAGE;
%         salt = imnoise(original_pic_6, 'salt & pepper', d);
%         gau = imnoise(original_pic_6, 'gaussian');
%         SP_GN = (salt + gau)/2;
%         imshow(SP_GN);
%         title('Salt & Pepper + Gaussian Noise');
%         fname_5 = sprintf('images6/frame%d.png',i);
%         saveas(gcf,'fname_6.png');
%         figure(4);
%         IMAGE_6 = imread('fname_6.png');
%         Output = IMAGE_6;
%         drawnow; % Force display to update immediately.
%         imwrite(Output ,sprintf('IMAGE_With_Salt&Pepper_and_Gaussian_Noise_0%d.png',i)); % will create mask1, mask2,...
%     else Noise == 5;
%         original_pic_7 = IMAGE;
%         salt = imnoise(original_pic_7, 'salt & pepper', d);
%         mynoise = imnoise(original_pic_7, 'gaussian', m, var_gauss);
%         SP_GGN = (salt + mynoise)/2;
%         imshow(SP_GGN);
%         title('Salt & Pepper + Generated Gaussian Noise');
%         fname_5 = sprintf('images7/frame%d.png',i);
%         saveas(gcf,'fname_7.png');
%         figure(4);
%         IMAGE_7 = imread('fname_7.png');
%         Output = IMAGE_7;
%         drawnow; % Force display to update immediately.
%         imwrite(Output ,sprintf('IMAGE_With_Salt&Pepper_and_Generated_Gaussian_Noise_0%d.png',i)); % will create mask1, mask2,...
%     end
end