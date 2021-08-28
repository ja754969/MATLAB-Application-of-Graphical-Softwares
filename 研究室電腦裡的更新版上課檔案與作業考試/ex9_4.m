function ex9_4(month)
    %從月分判斷季節1
    if month<=12 & month>0 & isinteger(month)==1
        if (month >= 3 & month<=5)
            result=[num2str(month),' is spring'];
            fprintf('%s \n',result)
        elseif (month <= 8 & month>=6)
            result=[num2str(month),' is summer'];
            fprintf('%s \n',result)
        elseif (month<=11 & month>=9)
            result=[num2str(month),' is fall'];
            fprintf('%s \n',result)
        elseif (month<=2 | month==12)
            result=[num2str(month),' is winter'];
            fprintf('%s \n',result)
        else
        result=[num2str(month),' is not in a year'];
        fprintf('%s \n',result)
        end
    else
        result=[num2str(month),' is not in a year'];
        fprintf('%s \n',result)
end