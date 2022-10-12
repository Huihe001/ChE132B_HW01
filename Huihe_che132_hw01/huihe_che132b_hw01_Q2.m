clc;clf,clearvars;
format long

e = 1;
x = 10^10;
list1 = [];
list2=[];

for i = 1:10
    e = e/10;
    list1 = [list1 e];
    R = x;
    for j = 1:(e^-1)
        R = R+e;
    end
    R = R-x;
    list2=[list2 R];
    fprintf(' The value of R = %9.8f as a function of small number e = %9.8f \n',R,e )    
end

semilogx(list1,list2) 
xlabel('Small numer e');
ylabel=('Final result R');


    
