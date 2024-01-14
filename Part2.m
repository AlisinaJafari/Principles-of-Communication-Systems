close all
clear
clc

N = 100000;
t=-0.5:1/100:0.5;


X = zeros(length(t),N) ;
for i=1:length(t)
    theta = 2*pi.*randn(1,N);
    for j=1:length(theta)
        X(i,j) = 10.*cos(5*pi.*t(i)+theta(j)) ;
    end
end

mean_theta = zeros(1,length(t));
for i=1:length(t)
    sum = 0;
    for j=1:length(theta)
        sum = sum + X(i,j);
    end
    mean_theta(i) = sum/N;
end

plot(t,mean_theta,LineWidth=1,Color='b')
title("E(X)")
xlabel("t(s)")
ylim([-2 2])
m = mean(mean_theta);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tau= -0.5:1/100:0.5;

X_t1 = zeros(length(t),length(tau),length(theta));
for i = 1:length(t)
    for j = 1:length(tau)
        for k = 1:length(theta)
            X_t1(i,j,k) = 10 * cos(5*pi *( t(i)+tau(j)) + theta(k));
        end
    end
end

X_t2 = zeros(length(t),length(tau),length(theta));
for i = 1:length(t)
    for j = 1:length(tau)
        for k = 1:length(theta)
            X_t2(i,j,k) = 10 * cos(5*pi *t(i) + theta(k));
        end
    end
end

E = X_t2.*X_t1;

M = mean(E,3);

figure
mesh(t,tau,M)
title("R_X(tau)")
xlabel("t(s)")
ylabel("tau(s)")
zlabel("theta(Rad)")


X_mean_theory = zeros(length(t));
R_x_theory = 50 * cos(5*pi*tau);

figure
plot(t,X_mean_theory,LineWidth=1)
title("E(X) theory")
xlabel("t(s)")

figure
plot(tau,R_x_theory,LineWidth=1)
title("R_X(tau) theory")
xlabel("t(s)")

R_m = mean(M,1);
plot(t,R_m,LineWidth=1)
title("R_Xmean(tau)")
xlabel("tau(s)")
ylim([-50 50])













