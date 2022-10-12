%% Q1 

clc;clf,clearvars;

V0 = 10;                %L
k1 = 3;                 %L/mol*min
k2f = 0.1;              %1/min
k2r = 0.05;             % 1/min
ca0 = 0;
cb0 = 0; 
cc0 = 0;
cd0 = 0;
va = 1;
vb = 0.6;
na = 0.2*va;
nb = 0.45*vb;
T = 300;
ta = 50;
tb1 = 10;
tb2 = 50;
dt = 0.5;
numsteps = 600;
times = (0:dt:T);


ca = zeros(1,numsteps+1);
cb = zeros(1,numsteps+1);
cc = zeros(1,numsteps+1);
cd = zeros(1,numsteps+1);
V = zeros(1,numsteps+1);

ca(1) = ca0;
cb(10) = cb0;
cc(1) = cc0;
cd(1) = cd0;
V(1) = 0;

for i=1:numsteps
    if times(i)<ta
        ca(i+1)=ca(i)+dt*((na/(V0+1*times(i)))- k1*ca(i)*cb(i));
        if (tb1<times(i)) && (times(i)<ta)
            ca(i+1)=ca(i)+dt*((na/(V0+1.6*times(i))) - k1*ca(i)*cb(i));
        end
    else
        ca(i+1)=ca(i)+dt*(- k1*ca(i)*cb(i));
    end
    

    if times(i)<tb2
       cb(i+1)=cb(i)+dt*((nb/(V0+1.6*times(i))) - k1*ca(i)*cb(i));
       if times(i)<tb1
           cb(i) = 0;
           cb(i+1) = cb(i);
       end
    else 
        cb(i+1)=cb(i)+dt*(- k1*ca(i)*cb(i));
    end
    
    cc(i+1) = cc(i)+ dt*( k1*ca(i)*cb(i) -k2f*cc(i) + k2r*cd(i));
    cd(i+1) = cd(i)+ dt*( k2f*cc(i) - k2r*cd(i));
end

clf
hold on
plot(times,ca,'ko');
plot(times,cb,'bo');
plot(times,cc,'ro');
plot(times,cd,'go');
legend('ca','cb','cc','cd');
xlabel('Time in s');
ylabel('Conc. in mol/L');
hold off