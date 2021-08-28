function [len,area] = circle(r)
%輸入半徑計算圓周長和圓面積

fprintf('nargin = %d, ',nargin)
fprintf('nargout = %d\n',nargout)
len = 2.*r.*pi; %圓周長
area = r.^2.*pi;%圓面積
end