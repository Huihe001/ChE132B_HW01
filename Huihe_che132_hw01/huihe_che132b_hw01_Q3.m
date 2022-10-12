
%% Q3 PartB Bisection Method
clc;clf,clearvars;
format long

Tchanger(5); % output = 50.002597784623504

function T12 = Tchanger(m)
% This function using Bisecion Method illustrate how the change of the flowrate of cooling
% fluid will affect the temperature of inner flow output.

T11 = 100;
T22 = 15;
A = 6.957047792;
U = 1;
m1 = 3;
Cp1 = 2.3;
Cp2 = 4;
tol = 10^(-6);
left = 0;
right = 150;

getf = @(T12) m1*Cp1*(T12-T11) - U*A*(((T22-T12)-((((m1*Cp1*(T11-T12))/...
    (m*Cp2))+T22)-T11))/log((T22-T12)/((((m1*Cp1*(T11-T12))/(m*Cp2))+T22)-T11)));

if getf(left)*getf(right) > 0
    disp('no root in that range')
else
    while getf(left)*getf(right) < 0
        
          mid=(left+right)/2;

          if getf(left)*getf(mid) > 0
              left = mid;
          else
              right = mid;
          end    

          T12 = mid;

          if abs(getf(mid)) < tol
              break
          end    
    end
end
end



