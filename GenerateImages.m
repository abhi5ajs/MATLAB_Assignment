% Parameters that define the behaviour.
sigma = 10;
beta = 8/3;
rho = 50;
% Dynamics of Lorentz attractor
s = 50; % Level of random excitation -- for. e.g. due to turbulence.
f = @(t,a)[-sigma*a(1) + sigma*a(2) + s*randn; 
    rho*a(1) - a(2) - a(1)*a(3) + s*randn; -beta*a(3) + a(1)*a(2) + s*randn];
% Simulate with two different initial conditions.
tf = 5; dt = 0.01;
[t,x1] = ode45(f,[0:dt:tf],[1 1 1]);       % Runge-Kutta 4th/5th order ODE solver
[t,x2] = ode45(f,[0:dt:tf],[-1 1 -1]);     % Runge-Kutta 4th/5th order ODE solver
% Show the trajectory.
h = figure('Color',[0.5 0.5 0.5]);
plot3(x1(:,1),x1(:,2),x1(:,3),'white'); hold on;
plot3(x2(:,1),x2(:,2),x2(:,3),'black'); view(0,90); axis off;
set(gcf,'InvertHardCopy','Off')
saveas(h,'figure(1).jpg');

%%
% Generate image frames from simulation.
% objectSize = 10;
visibility = 1; % High visibility. To choose lower visibility, choose number between [0,1]
for i = 1:length(t)
    figure(2); 
    clf;
    %--make a function to draw the dot with parameters for the dot's intensity (e.g., a number in [0,255])...
    %and also a parameter for it's radius from 1x1 to 10x10 (also a circle, not a 10x10 square)
    plot3(x1(i,1),x1(i,2),x1(i,3),'Markersize',10,'Marker','.','LineStyle','none','Color',([255 255 255]./255));...
        view(0,90);
    axis(1.1*ax);
    %-reverse the colors of the dot & background (it should be a light spot on a darker background)    
    set(gca, 'Color', ([127.5 127.5 127.5]./255)) % get the current axis 'colour', 'gray' 
    fname3 = sprintf('images1/frame%d.jpg',i); 
    set(gcf,'InvertHardCopy','Off')
%   exportgraphics(gcf,fname,'resolution',300);
    saveas(gcf, 'fname3.jpg');

    hold on;
    plot3(x2(i,1),x2(i,2),x2(i,3),'r','Markersize',10,'Marker','.','LineStyle','none','Color',([255 0 0]./255));...
        view(0,90);
    axis(1.1*ax);
    %-reverse the colors of the dot & background (it should be a light spot on a darker background) 
    set(gca, 'Color', ([127.5 127.5 127.5]./255)) % get the current axis 'colour', 'gray' (k)
    fname4 = sprintf('images2/frame%d.jpg',i);
    set(gcf,'InvertHardCopy','Off')
%   exportgraphics(gcf,fname,'resolution',300);
    saveas(gcf,'fname4.jpg');
end