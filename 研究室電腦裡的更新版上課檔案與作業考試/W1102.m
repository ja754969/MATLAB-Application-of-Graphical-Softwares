function W1102(a,b)

fprintf('nargin = %d, ',nargin)
fprintf('nargout = %d\n',nargout)
if nargin == 1
    xx = 1:length(a);
    plot(xx,a)
else
    plot(a,b)
end
end