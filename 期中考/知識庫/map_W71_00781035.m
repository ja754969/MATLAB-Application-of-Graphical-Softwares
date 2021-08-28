%% 載入檔案
%需要的資料夾 : land_data、
clear;clc;clf
for i=1:56
s=['land_data\land' int2str(i) '.dat'];
c=['land' int2str(i)];
load(s);    %載入檔案
cc=eval(c); %把字串轉成可執行的指令
            %Execute MATLAB expression in text
fill(cc(:,1),cc(:,2),[77/255 137/255 37/255]);hold on; % fill : 塗色
plot(cc(:,1),cc(:,2),'k');hold on;
clear
end
%% 選定畫圖範圍
axis('image') %固定圖案的縮放
axis([121.73 121.84 25.12 25.21])
%% 設定圖軸性質
xlabel('Longitude',"FontSize",12,"FontName",'times')
ylabel('Latitude',"FontSize",12,"FontName",'times')
title('KEELUNG',"FontSize",14)

set(gca,'tickdir','out','xtick',[121.73:0.02:121.85],'ytick',[25.12:0.01:25.21])
set(gca,'LineWidth',4) %坐標軸設定粗細
plot([121.73 121.84 121.84 121.73 121.73],[25.12 25.12 25.21 25.21 25.12],'k') %在圖軸畫框

%% 畫圖中圖
get(gca,'position') % 左 底部 寬度 高度
axes('position',[0.062 0.5925 0.4 0.325])
hold on
load plot_KEELUNG.dat %載入檔案
lons = plot_KEELUNG(:,1); %取出經度
lats = plot_KEELUNG(:,2); %取出緯度
plot(lons,lats,'k')
% xlabel('Longitude',"FontSize",16,"FontName",'times')
% ylabel('Latitude',"FontSize",16,"FontName",'times')
% title()
axis('image') %讓圖形在縮放之後不會變形
axis([119 123 21.5 26])
text(120.25,23.5,'Taiwan','FontSize',9,'FontName','times','Color','b','rotation',0)%在圖中標示台灣
% set(gca,'LineWidth',4)%坐標軸設定粗細
set(gca,'XTick',[119:4:123],'YTick',[21.5:5.5:26],'yAxisLocation','right','xticklabels',{})
%改變 X 座標標示 119到123間隔4
%改變 Y 座標標示 21.5到26間隔5.5
set(gca,'xticklabels',{},'yticklabels',{})
plot([121.73 121.84 121.84 121.73 121.73],[25.12 25.12 25.21 25.21 25.12],'r')
%% 存圖
print('map_W71_00781035','-dpng')