function wg=ex9_6(h)
if h<=60 & h>0
    wg=100*h;
    result=['實領薪資' num2str(wg) ];
    fprintf('%s \n\n',result)
elseif (h>=61 & h <= 75)
    wg=60*100+(h-60)*100*1.5;
    result=['實領薪資' num2str(wg) ];
    fprintf('%s \n\n',result)
elseif h>76
    wg=60*100+15*100*1.5+(h-75)*100*2.5;
    result=['實領薪資' num2str(wg) ];
    fprintf('%s \n\n',result)
else 
    wg=0;
    fprintf('沒去工作\n\n')
end
end