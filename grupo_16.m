%poten=tensao_pot.signals.values;
%strain=tensao_strain.signals.values;
%time_scale=input.time;
time_max = 0.02;
strain=strain/2.7382;
strain=strain*3.8297;

%u = input.signals.values;
sum_signal=poten+strain;
y = detrend(sum_signal);


T=120;
f=0.4;
fs=50;
t=0:1/fs:T;

%pru=idinput(length(t),'RBS',[0.05 0.1]*f,[-1 1]);
%pru= [t' pru];


k = 0.8;
Afilt = [1 -k];
Bfilt = (1-k)*[1 -1];
% Filtering
yf = filter(Bfilt,Afilt,y);

%ARMAX
z = [yf u];
na = 3; % AR part
nb = 2; % X part
nc = na; % MA part
nk = 1; % pure delay
nn = [na nb nc nk];
th = armax(z,nn); % th is a structure in identification toolbox format

[den1,num1] = polydata(th);
yfsim = filter(num1,den1,u); % Equivalent to idsim(u,th);
[num,den] = eqtflength(num1,conv(den1,[1 -1]));
plot(yfsim);

[A,B,C,D] = tf2ss(num,den);
Q=C'*C;
R=200;
N=0;

[K,S,CLP] = dlqr(A,B,Q,R,N);

sys = ss(A,B,C,D);
[num,den] = ss2tf(A,B,C,D);
num = conv(num,fliplr(num));
den = conv(den,fliplr(den));
sys = tf(num,den,-1);
rlocus(sys);
zgrid
axis('equal')

I = eye(4);
G=1*I;
Qe=100*I;
Re=20;
[M,P,Z,E] = dlqe(A,G,C,Qe,Re);

% N = inv([A-eye(4,4), B; C,0])*[zeros(4,1);1];
% Nx = N(1:5,:);
% Nu = N(6,:);
% Nbar = Nu+KNx;
NBar = inv(C*inv(eye(4)-A+B*K)*B);


