clear;clc;clf
cd('C:\Users\user\Documents\MATLAB\繪圖軟體應用_1081') % 設定檔案路徑
%% EX8-2
figure(1)
% x = linspace(-2,2,32);
% y = linspace(-2,2,32);
% [xx,yy] = meshgrid(x,y);
% zz = xx./(exp(xx.^2+yy.^2));
% [u , v] = gradient(zz);
% quiver(xx,yy,u,v)

ex8_2
print('EX8-2_00781035','-dpng')
%% EX8-6
gs50 = ex8_6(50)
%% EX8-18
figure(2)
g = @(x,y) y^2-x^2;
% [xx,yy]=meshgrid(-3:0.3:3,-3:0.3:3);
ezsurf(g,[-3,3,-3,3])
print('EX8-18_00781035','-dpng')