plot_kuroshio
fname='2012070200_2012070300_daily-ifremer-L3-MWF-GLO-20120704102056-01.0.nc';
nc_dump(fname);
u=nc_varget(fname,'eastward_wind');
v=nc_varget(fname,'northward_wind');
x=-179.875:0.25:179.875;
y= -79.875:0.25: 80.125;
[x1 y1]=meshgrid(x,y);
quiver(x1(1:2:end,1:2:end),y1(1:2:end,1:2:end),u(1:2:end,1:2:end),v(1:2:end,1:2:end),2.5)
hold on

axis('image')
axis([115 130 15 30])
plot([115 130 130 115 115],[15 15 30 30 15],'k')
title('2012-07-02 Daily mean wind','fontsize',20)
xlabel('longitude','fontsize',16)
ylabel('latitude','fontsize',16)

fid=fopen('d20120702_wind.dat','w');
%fid1=fopen('d200712_wind_u.dat','w');
%fid2=fopen('d200712_wind_v.dat','w');
for i=1:1440
for j=1:641
if x1(j,i)<= 130.5 && x1(j,i) >= 114.5
if y1(j,i)<=30.5 && y1(j,i) >= 14.5
if isnan(u(j,i)) == 0
fprintf(fid,'%12.4f %12.4f %12.4f %12.4f\n',x1(j,i),y1(j,i),u(j,i),v(j,i));
end
%if isnan(u(j,i)) == 0
%fprintf(fid1,'%12.4f %12.4f %12.4f\n',x1(j,i),y1(j,i),u(j,i));
%fprintf(fid2,'%12.4f %12.4f %12.4f\n',x1(j,i),y1(j,i),v(j,i));
end
end 
end 
end
%end
fclose(fid);
%fclose(fid1);
%fclose(fid2);

%figure
%plot_kuroshio
%load d20120702_wind.dat
%x=reshape(d20120702_wind(:,1),60,60);
%y=reshape(d20120702_wind(:,2),60,60);
%u=reshape(d20120702_wind(:,3),60,60);
%v=reshape(d20120702_wind(:,4),60,60);
%quiver(x(1:1:end,1:1:end),y(1:1:end,1:1:end),u(1:1:end,1:1:end),v(1:1:end,1:1:end),1.5)
%axis('image')
%axis([115 130 15 30])
%plot([115 130 130 115 115],[15 15 30 30 15],'k')
