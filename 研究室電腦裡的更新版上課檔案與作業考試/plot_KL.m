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
axis('image') %
axis([121.73 121.84 25.12 25.21])

set(gca,'tickdir','out','xtick',[121.73:0.01:121.85],'ytick',[25.12:0.01:25.21])
plot([121.73 121.84 121.84 121.73 121.73],[25.12 25.12 25.21 25.21 25.12],'k')