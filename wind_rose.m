function varargout = wind_rose(D,F,varargin)
%WIND ROSE   Wind rose of direction and intensity
% 
%   Syntax:
%      HANDLES = WIND_ROSE(D,I,VARARGIN)
%
%   Inputs:
%      D   Directions
%      I   Intensities
%      VARARGIN:
%       -n, number of D subdivisons
%       -di, intensities subdivisons, default is automatic
%       -ci, percentage circles to draw, default is automatic
%       -labtitle, main title
%       -lablegend, legend title
%       -cmap, colormap [jet]
%       -quad, Quadrant to show percentages [1]
%       -ri, empty internal radius, relative to size of higher
%            percentage [1/30]
%       -legtype, legend type: 1, continuous, 2, separated boxes [2]
%       -bcolor, full rectangle border color ['none']
%       -lcolor, line colors for axes and circles ['k']
%       -percbg, percentage labels bg ['w']
%
%   Output:
%      HANDLES   Handles of all lines, fills, texts
%
%   Examle:
%      d=rand(1,200)*360;;
%      v=sin(rand(1,200)*360);
%      figure
%      wind_rose(d,v)
%      wind_rose(d,v,'ci',[5 10 15])
%
%   MMA 26-11-2007, mma@odyle.net

%   IEO, Instituto Español de Oceanografía
%   La Coruña, España

%   10-12-2007 - Added varargin ci and n (nAngles removed as input)

%figure;
handles=[];

% varargin options:
nAngles=36;
ri=1/30;
quad=1;
legType=2;
percBg='w';
titStr='';
legStr='';
cmap=jet;
Ag=[]; % intensity subdivs.
ci=[]; % percentage circles
lineColors='k';
borderColor='none';

vin=varargin;
for i=1:length(vin)
  if isequal(vin{i},'n')
    nAngles=vin{i+1};
  elseif isequal(vin{i},'ri')
    ri=vin{i+1};
  elseif isequal(vin{i},'quad')
    quad=vin{i+1};
  elseif isequal(vin{i},'legtype')
    legType=vin{i+1};
  elseif isequal(vin{i},'percbg')
    percBg=vin{i+1};
  elseif isequal(vin{i},'labtitle')
    titStr=vin{i+1};
  elseif isequal(vin{i},'lablegend')
    legStr=vin{i+1};
  elseif isequal(vin{i},'cmap')
    cmap=vin{i+1};
  elseif isequal(vin{i},'di')
    Ag=vin{i+1};
  elseif isequal(vin{i},'ci')
    ci=vin{i+1};
  elseif isequal(vin{i},'lcolor')
    lineColors=vin{i+1};
  elseif isequal(vin{i},'bcolor')
    borderColor=vin{i+1};
  end
end

% other options:
% size of the full rectangle:
rs=1.2;
rl=1.7;

% angles subdivisons:
D(D==360)=0;
Ay=linspace(0,360,nAngles+1)-0.5*360/nAngles;

% calc instensity subdivisions:
if isempty(Ag)
  % gen Ag:
  f=figure('visible','off');
  plot(F); axis tight;
  yl=get(gca,'ytick');
  close(f)
  dyl=diff(yl); dyl=dyl(1);
  if min(F)>yl(1),   yl=[yl(1)-dyl yl];   end
  if max(F)>yl(end), yl=[yl yl(end)+dyl]; end
  Ag=yl;
end

IncHiLow=1; % include values higher and lower that the limits of Ag.
for i=1:length(Ay)-1
  I=find(D>=Ay(i) & D<Ay(i+1));
  b=F(I);

  for j=1:length(Ag)-1
    J=find(b>=Ag(j) & b<Ag(j+1));
    E(i,j)=length(J);
  end

  if IncHiLow
    E(i,1)=length(find(b<Ag(2)));
    E(i,end)=length(find(b>=Ag(end-1)));
  end
end
b=sum(E,2)/length(D)*100;

% check if has values higher or lower than the Ag limits
hasH=length(find(F>=Ag(end)));
hasL=length(find(F<Ag(1)));

% calc number of percentage circles to draw:
if isempty(ci)
  dcircles=[1 2 5 10 15 20 25 30 50];
  ncircles=3;
  d=abs(1./(dcircles/max(b))-ncircles);
  i=find(d==min(d));
  d=dcircles(i);
  if d*ncircles<max(b)
    ncircles=ncircles+1;
  end
  ci=[1:ncircles]*d;
  g=ncircles*d;
else
  ncircles=length(ci);
  g=max(max(ci),max(b));
end


% plot axes, percentage circles and percent. data:
ri=g*ri;
handles(end+1)=fill([-rs*g rl*g rl*g -rs*g],[-rs*g -rs*g rs*g rs*g],'w',...
                     'EdgeColor',borderColor);
hold on
handles(end+1)=plot([-g-ri -ri nan ri g+ri nan 0 0 nan 0 0],...
                    [0 0 nan 0 0 nan -g-ri -ri nan ri g+ri],':','color',lineColors);
t0=[0:360]*pi/180;
labs=[];
Ang=[1/4 3/4 5/4 7/4]*pi;
Valign={'top' 'top' 'bottom' 'bottom'};
Halign={'right' 'left' 'left' 'right'};
for i=1:ncircles
  x=(ci(i)+ri)*cos(t0);
  y=(ci(i)+ri)*sin(t0);

  handles(end+1)=plot(x,y,':','color',lineColors);

  labs(i)=text((ci(i)+ri)*cos(Ang(quad)),(ci(i)+ri)*sin(Ang(quad)),[num2str(ci(i)),'%'],...
      'VerticalAlignment',Valign{quad},'HorizontalAlignment',Halign{quad},...
      'BackgroundColor',percBg,'FontSize',8);
end
handles=[handles labs];

% calc colors:
cor={};
for j=1:length(Ag)-1
  cor{j}=caxcolor(Ag(j),[Ag(1) Ag(end-1)],cmap);
end

% fill data:
n=sum(E,2);
for i=1:length(Ay)-1
  if n(i)
    t=linspace(Ay(i),Ay(i+1),20)*pi/180;
    r1=ri;
    for j=1:length(Ag)-1
      r2=E(i,j)/n(i) *b(i) +r1;

      x=[r1*cos(t(1)) r2*cos(t) r1*cos(fliplr(t))];
      y=[r1*sin(t(1)) r2*sin(t) r1*sin(fliplr(t))];

      if E(i,j)>0, handles(end+1)=fill(x,y,cor{j}); end
      r1=r2;
    end
  end
end
axis equal
axis off
uistack(labs,'top')

% N S E W labels:
bg='none';
args={'BackgroundColor',bg,'FontSize',8};
h(1)=text(-g-ri, 0,'WEST', 'VerticalAlignment','top',   'HorizontalAlignment','left', args{:});
h(2)=text( g+ri, 0,'EAST', 'VerticalAlignment','top',   'HorizontalAlignment','right',args{:});
h(3)=text( 0,-g-ri,'SOUTH','VerticalAlignment','bottom','HorizontalAlignment','left', args{:});
h(4)=text( 0, g+ri,'NORTH','VerticalAlignment','top',   'HorizontalAlignment','left', args{:});
handles=[handles h];

% scale legend:
L=(g*rl-g-ri)/7;
h=(g+ri)/10;
dy=h/3;

x0=g+ri+(g*rl-g-ri)/7;
x1=x0+L;
y0=-g-ri;

if legType==1 % contimuous.
  for j=1:length(Ag)-1
    lab=num2str(Ag(j));
    if j==1 & hasL & ~IncHiLow
      lab='';
    end
    y1=y0+h;
    handles(end+1)=fill([x0 x1 x1 x0],[y0 y0 y1 y1],cor{j});
    handles(end+1)=text(x1+L/4,y0,lab,'VerticalAlignment','middle','fontsize',8);
    y0=y1;
  end
  if ~ (hasH & ~IncHiLow)
    handles(end+1)=text(x1+L/4,y0,num2str(Ag(end)),'VerticalAlignment','middle','fontsize',8);
  end
elseif legType==2 % separated boxes.
  for j=1:length(Ag)-1
    lab=[num2str(Ag(j)) ' - ' num2str(Ag(j+1))];
    if j==1 & hasL & ~IncHiLow
      lab=['<',num2str(Ag(2))];
    end
    if j==length(Ag)-1 & hasH & ~IncHiLow
      lab=['>=',num2str(Ag(j))];
    end
    y1=y0+h;
    handles(end+1)=fill([x0 x1 x1 x0],[y0+dy y0+dy y1 y1],cor{j});
    handles(end+1)=text(x1+L/4,(y0+dy+y1)/2,lab,'VerticalAlignment','middle','fontsize',8);
    y0=y1;
  end

end

% title and legend label:
x=mean([-g*rs,g*rl]);
y=mean([g+ri,g*rs]);
handles(end+1)=text(x,y,titStr,'HorizontalAlignment','center');

x=x0;
y=y1+dy;
handles(end+1)=text(x,y,legStr,'HorizontalAlignment','left','VerticalAlignment','bottom');

if nargout==1
  varargout{1}=handles;
end

function cor = caxcolor(val,cax,cmap)
%CAXCOLOR   Caxis color for value
%   Find the color for a given value in a colormap.
%
%   Syntax:
%     COLOR = CAXCOLOR(VALUE,CAXIS,COLORMAP)
%
%   Inputs:
%      VALUE
%      CAXIS   Default is current caxis
%      COLORMAP   Default is current colormap
%
%   Output:
%      COLOR   RGB color vector
%
%   Example:
%      figure
%      pcolor(peaks)
%      color=caxcolor(0);
%      set(gcf,'color',color)
%
%   MMA 28-5-2007, martinho@fis.ua.pt

% Department of Physics
% University of Aveiro, Portugal

if nargin < 3
  cmap = get(gcf,'colormap');
end
if nargin < 2
  cax = caxis;
end

n=size(cmap,1);
i= (val-cax(1))/diff(cax) * (n-1) +1;
a=i-floor(i);
i=floor(i);

i=min(i,n);
i=max(i,1);

if i==n
  cor=cmap(n,:);
elseif i==1
  cor=cmap(1,:);
else
  cor=cmap(i,:)*(1-a) + cmap(i+1,:)*a;
end
