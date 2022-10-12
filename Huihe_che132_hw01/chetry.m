clc;clf,clearvars;
e=1;
e_list=[];
R_list=[];


for i=1:10
e=e/10;
e_list=[e_list e];
x=10^10;
R=x;
for j=1:(e^-1)
R=R+e;
end
R=R-x;
R_list=[R_list R];
fprintf('when epsilon=%.10f=10^-%d R=%.10f\n',e,i,R)
end


semilogx(e_list,R_list) 
xlabel('e');
ylabel=('R');