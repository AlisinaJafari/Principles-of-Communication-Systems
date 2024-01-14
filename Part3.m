close all
clear
clc

N=50000;
t=0:3/N:3;

m = 10 + 5.*sin(3*pi*t) + 3.*(cos(pi*t)).^3+sin(pi*t/4);
figure
plot(t,m,LineWidth=1);
title("Original signal")
xlabel("t(s)")

%%%%%%%%%%%%%%%%%%%

n=101 ;
m_d=zeros(1,n);
counter = 1;

for i =1:500:N+1
    m_d(counter)=m(i);
    counter = counter +1 ;
end

t = 0:3/100:3;
figure
plot(t,m_d,LineWidth=1,Color='k');
title("Discrete signal")
xlabel("t(s)")
ylim([0 20])

%%%%%%%%%%%%%%%%%%%%%
m_q=zeros(1,101);
q=zeros(1,32);
l = max(m_d) - min(m_d)+0.001;
for i=1:length(q)
    q(i)=i*l/32;
end
q = q + min(m_d);

temp=zeros(1,32);
for i=1:length(m_d)
    for j=1:length(q)
        temp(j)=abs(m_d(i)-q(j));
    end
    [~,idx] = min(temp);
    m_q(i)=q(idx);
end

figure
plot(t,m_q,LineWidth=1,Color='g');
title("Quantized signal")
xlabel("t(s)")
ylim([2 20])

%%%%%%%%%%%%%%%%%%%%%

load p.mat

pulse_energy = sum(p.^2);

gray_code = cell(1,32);
gray_code{1}='00000';gray_code{2}='00001';gray_code{3}='00010';gray_code{4}='00011';gray_code{5}='00100';gray_code{6}='00101';gray_code{7}='00110';gray_code{8}='00111';
gray_code{9}='01000';gray_code{10}='01001';gray_code{11}='01010';gray_code{12}='01011';gray_code{13}='01100';gray_code{14}='01101';gray_code{15}='01110';gray_code{16}='01111';
gray_code{17}='10000';gray_code{18}='10001';gray_code{19}='10010';gray_code{20}='10011';gray_code{21}='10100';gray_code{22}='10101';gray_code{23}='10110';gray_code{24}='10111';
gray_code{25}='11000';gray_code{26}='11001';gray_code{27}='11010';gray_code{28}='11011';gray_code{29}='11100';gray_code{30}='11101';gray_code{31}='11110';gray_code{32}='11111';

a = cell(2,32);
for i=1:length(q)
    a{1,i}=q(i); a{2,i}=gray_code(i);
end


t=0:1/1000:101;
m_p= zeros(1,length(t));
counter = 1;
for i=1:1000:length(m_p)-1
    for j=1:32
        if(m_q(counter)==q(j))
            m_p(i:i+999)= (2*j-33).*p;
        end
    end
    counter = counter +1;
end

figure
plot(t,m_p,LineWidth=1,Color='r')
title("Pulse code signal")
xlabel("t(s)")
xlim([0 100])

%%%%%%%%%%%%%%%%

power = sum(m_p.^2)/length(m_p);
SNR=2;
p_n=power/(10^(SNR/10));
n_t = sqrt(p_n)*randn(1,length(m_p));
m_n = m_p + n_t;
figure
plot(t,m_n,LineWidth=1,Color='r')
title("Pulse code signal with noise")
xlabel("t(s)")
xlim([0 100])

energy = zeros(1,32);
for i=1:32
    energy(i)=sum((2*i-33).*p.*p);
end

%%%%%

m_q_n = zeros(1,length(m_q));
temp = zeros(1,32);
counter = 1;
for i=1:1000:length(m_n)-1
    for j=1:32
        temp(j)=abs(sum(m_n(i:i+999).*p)-energy(j));
    end
    [~,idx] = min(temp);
    m_q_n(counter)=a{1,idx};
    counter = counter + 1;
end

t = 0:3/100:3;
figure
plot(t,m_q_n,linewidth=1,Color='g');
title("Quantized signal after Demodulation")
xlabel("t(s)")
ylim([2 20])

%%%%%%%%%%%%%%%%

error = 0;
for i=1:length(m_q_n)
    if (m_q_n(i)~=m_q(i))
        error = error +1;
    end
end

error = error/length(m_q_n);

A = cell(101,5);
B = cell(101,5);

for i=1:length(m_q)
    for j=1:32
        if(q(j)==m_q(i))
            A{i,1} = extract(a{2,j},1);
            A{i,2} = extract(a{2,j},2);
            A{i,3} = extract(a{2,j},3);
            A{i,4} = extract(a{2,j},4);
            A{i,5} = extract(a{2,j},5);
        end
    end
end

for i=1:length(m_q_n)
    for j=1:32
        if(q(j)==m_q_n(i))
            B{i,1} = extract(a{2,j},1);
            B{i,2} = extract(a{2,j},2);
            B{i,3} = extract(a{2,j},3);
            B{i,4} = extract(a{2,j},4);
            B{i,5} = extract(a{2,j},5);
        end
    end
end

BER = 0;
for i=1:length(m_q)
    for j=1:5
        if (strcmp(A{i,j},B{i,j})==0)
            BER = BER + 1;
        end
    end
end

BER = BER / (101 * 5);

% Bonus part %

x = zeros(1,length(m_q_n));
counter = 1;
for i=1:500:length(m)
    x(counter) = i ;
    counter = counter + 1 ;
end
y = 10 + 5.*sin(3*pi*x) + 3.*(cos(pi*x)).^3+sin(pi*x/4);
xx=0:3/N:3;
yy=spline(x,y,xx);
figure
plot(x,y,'o',xx,yy)





