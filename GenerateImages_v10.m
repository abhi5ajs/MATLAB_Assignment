function GenerateImages_v10(sigma, beta, rho, ObjectSize, s, visibility, noise, noise_density, noise_mean, var_gauss);
close all
% Parameters that define the behaviour.
sigma         = input('Please enter the value of sigma: ');                 %10
beta          = input('Please enter the value of beta: ');                  %8/3;
rho           = input('Please enter the value of rho: ');                   %50;
ObjectSize    = input('Please enter the value of object size: ');           %10;
s             = input('Please enter the value of level of excitation: ');   %50;
visibility    = input('Please enter the value of visibility: ');            %1 High visibility. To choose lower visibility, choose number between [0,1]
%% User define the parameter for generating images with noise
noise         = input('Please enter whether Stake of images is required with noise: '); %Without noise = 0, With Noise =1;
noise_density = input('Please enter the value of noise_density: ');                     %Default = 0.05
noise_mean    = input('Please enter the noise mean number: ');                          %Default = 0
var_gauss     = input('Please enter the guassian variance number: ');                   %Default = 0.01
%% Dynamics of Lorentz attractor
f = @(t,a)[-sigma*a(1) + sigma*a(2) + s*randn;
    rho*a(1) - a(2) - a(1)*a(3) + s*randn; -beta*a(3) + a(1)*a(2) + s*randn];
% Simulate with two different initial conditions.
tf = 5; dt = 0.01;
[~,x1] = ode45(f,[0:dt:tf],[1 1 1]);       % Runge-Kutta 4th/5th order ODE solver
[t,x2] = ode45(f,[0:dt:tf],[-1 1 -1]);     % Runge-Kutta 4th/5th order ODE solver
% Show the trajectory.
figure('Color',[0.5 0.5 0.5]);
plot3(x1(:,1),x1(:,2),x1(:,3),'white'); hold on;
plot3(x2(:,1),x2(:,2),x2(:,3),'black'); view(0,90); axis off;
set(gcf,'InvertHardCopy','Off')
ax = axis;
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
    
    Trial_7(i, 'fname_1.png', noise, noise_mean, noise_density, var_gauss)
end
end