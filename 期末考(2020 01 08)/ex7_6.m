function expp = ex7_6(x)
expo = 0;
for n = 1:20
    expo = expo + (x^n)/factorial(n);
end
fprintf('exp(x) = %d',expo)
end