function bmi=ex9_5(h,w)
bmi=w/(h^2);
if (bmi>=18.5 & bmi<=24)
    result=[num2str(bmi) ' �魫�з�'];
    fprintf('%s \n',result)
elseif (bmi>=0 &bmi < 18.5)
    result=[num2str(bmi) ' �魫�L��'];
    fprintf('%s \n',result)
elseif (bmi > 24)
    result=[num2str(bmi) ' �魫�L��'];
    fprintf('%s \n',result)
else
    result='�п�J���`��';
    fprintf('%s \n',result)
end