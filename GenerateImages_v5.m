clear all
close all
% Parameters that define the behaviour.
sigma = 10;
beta = 8/3;
rho = 50;
ImageSize = 1000; %ATM the image size is 875 x 656 (default)

% Parameters that defines the Noise in the images:
m = 0;
d = 0.05;
var_gauss = 0.01;
ObjectSize = 10;

% Dynamics of Lorentz attractor
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

% Generate Stakes of Images and Save with Noises
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
    IMAGE_1 = imread('fname_1.png');
    Output = IMAGE_1;
    drawnow; % Force display to update immediately.
    imwrite(Output ,sprintf('IMAGE_0%d.png',i)); % will create mask1, mask2,...
    
    IMAGE = imread('fname_1.png');
    %Image_2_gray = rgb2gray(IMAGE);    % Changing Image_2 to Gray Scale
    %imshow(Image_2_gray);                % To see the Image_2 in Gray Scale
    %level_2 = graythresh(IMAGE);
    %Bthresh = im2bw(IMAGE, level_2);   % Converting Image_2 to Binary Image based on threshold
    %imshowpair(IMAGE, Bthresh, 'montage');  % Comparing images with different homogenous background
    
    figure(3);
    subplot(2,2,1);
    original_pic_2 = IMAGE;
    imshow(original_pic_2);
    title('Original Image');
    %2 With Salt & Pepper Noise
    salt = imnoise(original_pic_2, 'salt & pepper', d);% adds salt and pepper noise, where d is the noise density. This affects approximately d*numel(Image_1) pixels.
    subplot(2,2,2);
    imshow(salt);
    title('Salt & Pepper Image');
    %3 With Gaussian Noise
    gau = imnoise(original_pic_2, 'gaussian');%adds zero-mean, Gaussian white noise with variance of 0.01 to grayscale image_1.
    subplot(2,2,3);
    imshow(gau);
    title('Gaussian Image');
    %4 Gaussian Noise with variable mean and variance
    mynoise = m + sqrt(var_gauss)*randn(size(original_pic_2)); %adds Gaussian white noise with mean m and variance var_gauss.
    subplot(2,2,4);
    imshow(mynoise,[]);
    title('Generated Gaussian Noise');
    
    fname_2 = sprintf('images2/frame%d.png',i);
    saveas(gcf,'fname_2.png');
    IMAGE_2 = imread('fname_2.png');
    Output = IMAGE_2;
    drawnow; % Force display to update immediately.
    imwrite(Output ,sprintf('IMAGE_With_Noise_0%d.png',i)); % will create mask1, mask2,...
end
