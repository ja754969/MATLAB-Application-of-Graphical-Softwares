function sum7 = fun9_7(n)
    m = 1:n;
    if mod(n,2) == 1 
        sum7=0;
        for i=1:2:n %�p��_���`�M
            sum7=sum7 + m(i);
        end %end for i
    end
    fprintf(['1+3+5+...+' num2str(n) '���`�M = ' num2str(sum7) '\n\n'])
end