function sum11 = fun9_11(n)
    sum11=0;
    i = 1;
    while i <= n
        sum11 = sum11 + i^2;
        i = i+1 ;    
    end
    fprintf(['1到' num2str(n) '之間，所有整數的平方值之總和 :\n']) 
end