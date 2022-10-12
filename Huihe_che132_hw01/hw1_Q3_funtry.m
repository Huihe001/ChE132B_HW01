function [g,,err,iter] = bracketing(left,right,g_root,tol)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
outputArg1 = inputArg1;
outputArg2 = inputArg2;

p1 = f2(@(T,m) f2(T,m));
%guess_root = 0.5;
dx_left = left;
dx_right = right;
%tol = 1e-6;
loop_count = 0;
%%
if f2(a,dx_left)*f2(b,dx_right) > 0
    disp('no root in that range')
else
    while err>tol
        err_old=err;
        p1=(a+b)/2;
        if f2(dx_left)*f2(p1)>0
            dx_left = p1;
        else
            dx_right = p1;
        end
        err=abs(dx_left-dx_right);
        loop_count=loop_count+1;
        iter=loop_count;
        fprintf('Estimate of root %9.8f Error %10.9d\n',p1,err)
        err2(loop_count)=err;
    end
    g=p1;
    
end

%%

T21 = (((m1*Cp1*(T11-T12))/(m*Cp2))+T22);

getf = @(T12) m1*Cp1*(T12-T11) +...
    U*A*(((T22-T12)-(T21-T11))/log((T22-T12)/(T21-T11)));

if getf(left)*getf(right) > 0
    disp('no root in that range')
else
    while err>tol
        getf(left)*getf(right)<0
          mid=(left+right)/2;

          if getf(left)*getf(mid)>0
              left = mid;
          elseif getf(right)*getf(mid)>0
              right = mid;
          end    

          T12 = mid;

          if abs(getf(mid)) < tol
              break
          end    
    end
end
end
%%
if getf(left)*getf(right) > 0
    disp('no root in that range')
else
    while err>tol
        mid=(left+right)/2;
          if getf(left)*getf(mid)>0
              left = mid;
          else
              right = mid;
          end
          err=abs(left-right);            
          T12 = mid;
          if err < tol
              break
          end    
    end
end
end
