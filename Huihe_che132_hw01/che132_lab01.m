
clc;clf,clearvars;
format long

set(0, 'DefaultLineLineWidth', 2);
xs = linspace(0,2,100);
ys = exp(-xs)-xs;

hold on
plot(xs,ys,'Color','b')
plot(xs,0*ys,'k--')
xlabel('x')
ylabel('y')
hold off

%% 

feval=@(xin) exp(-xin)-xin;
fplot(@(x) feval(x), [0 2], 'LineWidth',2,'Color','red')

p1 = fzero(@(x) feval(x),0.5);
fprintf('Converged solution of %8f was obtained via fzero \n', p1)


left = 0;
right = 2;
err = 2;
tol = 1e-6;
loop_count = 0;
if feval(left)*feval(right) > 0
    disp('no root in that range')
else
    while err>tol
        err_old=err;
        p1=(left+right)/2;
        if feval(left)*feval(p1)>0
            left = p1;
        else
            right = p1;
        end
        err=abs(left-right);
        loop_count=loop_count+1;
        iter=loop_count;
        fprintf('Estimate of root %9.8f Error %10.9d\n',p1,err)
        err2(loop_count)=err;
    end
    g=p1;
end    


semilogy(err2,'o')      
xlabel('iteration')
ylabel('error')
%%
