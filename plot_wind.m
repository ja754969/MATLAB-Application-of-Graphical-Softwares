load vel_s23.dat
subplot(2,2,1)
u=vel_s23(:,2);
v=vel_s23(:,3);
vh=sqrt(u.*u+v.*v);
dir=atan2d(v,u);
cc=find(dir<0);
dir(cc)=dir(cc)+360;
wind_rose(dir,vh,'di',[0.0:0.25:2.0],'bcolor','k')
title('Tidal flow rose figure at Station 41','fontname','times','fontsize',14)
%
%subplot(2,2,2)
%u=fort(:,123);
%v=fort(:,124);
%vh=sqrt(u.*u+v.*v);
%dir=atan2d(v,u);
%cc=find(dir<0);
%dir(cc)=dir(cc)+360;
%wind_rose(dir,vh,'di',[0.0:0.25:2.0],'bcolor','k')
%title('Tidal flow rose figure at Station 38','fontname','times','fontsize',14)
%
%subplot(2,2,3)
%u=fort(:,125);
%v=fort(:,126);
%vh=sqrt(u.*u+v.*v);
%dir=atan2d(v,u);
%cc=find(dir<0);
%dir(cc)=dir(cc)+360;
%wind_rose(dir,vh,'di',[0.0:0.25:2.0],'bcolor','k')
%title('Tidal flow rose figure at Station 39','fontname','times','fontsize',14)
%
%subplot(2,2,4)
%u=fort(:,127);
%v=fort(:,128);
%vh=sqrt(u.*u+v.*v);
%dir=atan2d(v,u);
%cc=find(dir<0);
%dir(cc)=dir(cc)+360;
%wind_rose(dir,vh,'di',[0.0:0.25:2.0],'bcolor','k')
%title('Tidal flow rose figure at Station 40','fontname','times','fontsize',14)
