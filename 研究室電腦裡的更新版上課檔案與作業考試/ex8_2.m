function ex8_2
% ��צV�q��
% M�ɮ�

x = linspace(-2,2,32);
y = linspace(-2,2,32);
[xx,yy] = meshgrid(x,y);
zz = xx./(exp(xx.^2+yy.^2));
[u , v] = gradient(zz);
quiver(xx,yy,u,v)
end