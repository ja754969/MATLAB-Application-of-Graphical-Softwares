%% 載入 taiwan.dat
clear;clc;clf
load taiwan.dat
taiwan(taiwan >= 0) = nan; %去除海平面以上的值
%% 建立經緯度資料
LONLIM = [105 135]; LATLIM = [15 35];
lon = LONLIM(1):5/60:LONLIM(2);
lat = LATLIM(2):-5/60:LATLIM(1); %因為原本的緯度資料上下顛倒
%% 畫圖
[xx,yy] = meshgrid(lon,lat);
pcolor(xx,yy,taiwan);shading flat
% contourf(xx,yy,taiwan);shading flat
set(gca,'tickdir','out','LineWidth',4);
% set(gca,'xtick',[LONLIM(1):6:LONLIM(2)],'ytick',[LATLIM(1):6:LATLIM(2)]);
% m_grid('box','fancy')
colormap('jet')
colorbar
axis('image') %讓圖形在縮放之後不會變形
title('\it Relief Model of Taiwan','FontSize',20,'FontName','Agency FB');
xlabel('Longtitude','FontName','Algerian');ylabel('Latitude','FontName','Algerian');
print('map_W101_00781035','-dpng')