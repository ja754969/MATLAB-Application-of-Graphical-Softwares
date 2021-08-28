%% EX-5-11
clear;clc;clf
x1 = linspace(0,2*pi,100);
y1 = sin(x1)./(x1+1);
plot(x1,y1)
title('my plot');xlabel('time');ylabel('speed')
print('EX-5-11_00781035','-dpng')
%% EX-5-12
clear;clc;clf
x2 = linspace(0,pi,100);
y21 = sin(x2).*exp(-0.5);
plot(x2,y21)
hold on 
y22 = cos(x2).*exp(-0.5);
plot(x2,y22)
hold off
title('plot 5-12');xlabel('x');ylabel('y');
legend('sin(x)*exp(-0.5)','cos(x)*exp(-0.5)')
print('EX-5-12_00781035','-dpng')
%% EX-5-14
clear;clc;clf
% (a)
figure(1)
ezplot('x^4+6*x^3+7*x+3',[-7,4,-200,400])
title('plot 5-14-a');xlabel('x');ylabel('y')
print('EX-5-14-a_00781035','-dpng')
% (b)
figure(2)
ezplot('sin(y)+cos(x+y)-1',[-5,2,-2,4])
title('plot 5-14-b');xlabel('x');ylabel('y')
print('EX-5-14-b_00781035','-dpng')
%% EX-5-15
clear;clc;clf
% (a)
x3 = linspace(0,pi,50);
y3 = cos(x3).*exp(-0.5.*x3);
plot(x3,y3)
% (b)
plot(x3,y3,'r--o','MarkerFaceColor','b','MarkerSize',20)
% (c)
plot(x3,y3,'r--o','MarkerFaceColor','b','MarkerSize',20)
title('\it my plot','FontSize',14,'FontName','Helvetica')    % ±×Åé : ¨Ï¥Î\it
print('EX-5-15_00781035','-dpng')