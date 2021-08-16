% function () = GenerateImage[];
close all
% Parameters that define the behaviour.
sigma = 10;
beta = 8/3;
rho = 50;
ObjectSize = 10;
%% User define the parameter for generating images with noise
noise         = input('Please enter whether Stake of images is required with noise: '); %Without noise = 0, With Noise =1;
noise_density = input('Please enter the value of noise_density: '); %Default = 0.05
noise_mean    = input('Please enter the noise mean number: '); %Default = 0
var_gauss     = input('Please enter the guassian variance number: '); %Default = 0.01
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

    [salt, gau, mynoise] = Switch_Trial(noise, noise_mean, noise_density, var_gauss);
end