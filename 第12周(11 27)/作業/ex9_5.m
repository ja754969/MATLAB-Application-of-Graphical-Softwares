function bmi=ex9_5(h,w)
bmi=w/(h^2);
if (bmi>=18.5 & bmi<=24)
    result=[num2str(bmi) ' 體重標準'];
    fprintf('%s \n',result)
elseif (bmi>=0 &bmi < 18.5)
    result=[num2str(bmi) ' 體重過輕'];
    fprintf('%s \n',result)
elseif (bmi > 24)
    result=[num2str(bmi) ' 體重過重'];
    fprintf('%s \n',result)
else
    result='請輸入正常值';
    fprintf('%s \n',result)
end