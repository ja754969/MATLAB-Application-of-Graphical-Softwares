%% ���J taiwan.dat
clear;clc;clf
load taiwan.dat
taiwan(taiwan >= 0) = nan; %�h���������H�W����
%% �إ߸g�n�׸��
LONLIM = [105 135]; LATLIM = [15 35];
lon = LONLIM(1):5/60:LONLIM(2);
lat = LATLIM(2):-5/60:LATLIM(1); %�]���쥻���n�׸�ƤW�U�A��
%% �e��
[xx,yy] = meshgrid(lon,lat);
pcolor(xx,yy,taiwan);shading flat
% contourf(xx,yy,taiwan);shading flat
set(gca,'tickdir','out','LineWidth',4);
% set(gca,'xtick',[LONLIM(1):6:LONLIM(2)],'ytick',[LATLIM(1):6:LATLIM(2)]);
% m_grid('box','fancy')
colormap('jet')
colorbar
axis('image') %���ϧΦb�Y�񤧫ᤣ�|�ܧ�
title('\it Relief Model of Taiwan','FontSize',20,'FontName','Agency FB');
xlabel('Longtitude','FontName','Algerian');ylabel('Latitude','FontName','Algerian');
print('map_W101_00781035','-dpng')