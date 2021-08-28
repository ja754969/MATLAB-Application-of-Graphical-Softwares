%% ���J�ɮ�
%�ݭn����Ƨ� : land_data�B
clear;clc;clf
for i=1:56
s=['land_data\land' int2str(i) '.dat'];
c=['land' int2str(i)];
load(s);    %���J�ɮ�
cc=eval(c); %��r���ন�i���檺���O
            %Execute MATLAB expression in text
fill(cc(:,1),cc(:,2),[77/255 137/255 37/255]);hold on; % fill : ���
plot(cc(:,1),cc(:,2),'k');hold on;
clear
end
%% ��w�e�Ͻd��
axis('image') %�T�w�Ϯת��Y��
axis([121.73 121.84 25.12 25.21])
%% �]�w�϶b�ʽ�
xlabel('Longitude',"FontSize",12,"FontName",'times')
ylabel('Latitude',"FontSize",12,"FontName",'times')
title('KEELUNG',"FontSize",14)

set(gca,'tickdir','out','xtick',[121.73:0.02:121.85],'ytick',[25.12:0.01:25.21])
set(gca,'LineWidth',4) %���жb�]�w�ʲ�
plot([121.73 121.84 121.84 121.73 121.73],[25.12 25.12 25.21 25.21 25.12],'k') %�b�϶b�e��

%% �e�Ϥ���
get(gca,'position') % �� ���� �e�� ����
axes('position',[0.062 0.5925 0.4 0.325])
hold on
load plot_KEELUNG.dat %���J�ɮ�
lons = plot_KEELUNG(:,1); %���X�g��
lats = plot_KEELUNG(:,2); %���X�n��
plot(lons,lats,'k')
% xlabel('Longitude',"FontSize",16,"FontName",'times')
% ylabel('Latitude',"FontSize",16,"FontName",'times')
% title()
axis('image') %���ϧΦb�Y�񤧫ᤣ�|�ܧ�
axis([119 123 21.5 26])
text(120.25,23.5,'Taiwan','FontSize',9,'FontName','times','Color','b','rotation',0)%�b�Ϥ��Хܥx�W
% set(gca,'LineWidth',4)%���жb�]�w�ʲ�
set(gca,'XTick',[119:4:123],'YTick',[21.5:5.5:26],'yAxisLocation','right','xticklabels',{})
%���� X �y�мХ� 119��123���j4
%���� Y �y�мХ� 21.5��26���j5.5
set(gca,'xticklabels',{},'yticklabels',{})
plot([121.73 121.84 121.84 121.73 121.73],[25.12 25.12 25.21 25.21 25.12],'r')
%% �s��
print('map_W71_00781035','-dpng')