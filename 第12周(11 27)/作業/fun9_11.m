function sum11 = fun9_11(n)
    sum11=0;
    i = 1;
    while i <= n
        sum11 = sum11 + i^2;
        i = i+1 ;    
    end
    fprintf(['1��' num2str(n) '�����A�Ҧ���ƪ�����Ȥ��`�M :\n']) 
end