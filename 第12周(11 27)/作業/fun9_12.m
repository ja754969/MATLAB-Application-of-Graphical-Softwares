function sum12 = fun9_12(n)
    sum12=0;
    for i=1:n
        sum12 = sum12 + (i^2)*((-1)^(i-1));
    end    
end