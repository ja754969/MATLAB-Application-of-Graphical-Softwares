function [x1,x2,x3] = W1101(a1,a2)

fprintf('nargin = %d, ',nargin)
fprintf('nargout = %d\n',nargout)
if nargin == 1
    a2 = 0;
end
x1 = a1+a2;
x2 = a1-a2;
x3 = (a1+a2)/2;
end