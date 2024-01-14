close all
clear 
clc

N = 100000;
x = -10:1/1000:10;
y = -10:1/1000:10;
z = 0:1/1000:5;
f_x = 1/sqrt(2*pi).*exp(-x.^2/2);
f_y = 1/sqrt(2*pi).*exp(-y.^2/2);
f_z = z.*exp((-z.^2)/2) ;

figure
subplot(3,1,1)
plot(x,f_x,LineWidth=1)
title("f_X(x)")
xlabel("x")
subplot(3,1,2)
plot(y,f_y,LineWidth=1)
title("f_Y(y)")
xlabel("y")
subplot(3,1,3)
plot(z,f_z,LineWidth=1)
title("f_Z(z)")
xlabel("z")

figure
subplot(3,1,1)
x = randn(1,N);
histogram(x,150,EdgeColor="b",FaceColor="b");
title('X')
subplot(3,1,2)
y = randn(1,N);
histogram(y,150,EdgeColor="r",FaceColor="r");
title('Y')
subplot(3,1,3)
z = sqrt(x.^2+y.^2);
histogram(z,150,EdgeColor="g",FaceColor="g");
title('Z')

m = mean(z)
v = var(z)






