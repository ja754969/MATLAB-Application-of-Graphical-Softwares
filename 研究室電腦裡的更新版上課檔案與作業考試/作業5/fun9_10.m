function m10 = fun9_10(n)
    m10 = [];
    fprintf(['1到' num2str(n) '之間，可被9與7整除的數值 :\n']) 
    for i=1:n
        if mod(i,9) == 0 & mod(i,7) == 0
            
            m10(i) = i;
            fprintf('%d ',m10(i))
        end
        
    end 
    fprintf('\n\n')
end