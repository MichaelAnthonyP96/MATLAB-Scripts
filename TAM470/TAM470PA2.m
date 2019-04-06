syms y  t F(y,t) G(y,t) U(y,t);
format long

F(y,t) = -y + t +1; %the approximate function 0<=t<=5
G(y,t) = exp(-t) + t;%the exact function

Y0 = 1;

h = 0.5; 
%h = 0.25; 
%h = 0.125;
length = 5/h;
time = linspace(0,5,length+1);

%Forward Euler Scheme
Yf = zeros(1,length);
Yf(1) = Y0;
for i = 1:length
    Yf(i+1) = Yf(i) + h * F(Yf(i),time(i));
end
%Yf

%Backward Euler Scheme
%after manipulating the Backward Euler scheme we get the below
%method of computing the next value in the sequence
Yb = zeros(1,length);
Yb(1) = Y0;
for i = 1:length
    Yb(i+1) = (Yb(i) + h * (time(i+1) + 1))/ (1 + h);
end
%Yb

%Exact Values of the function at the spaced intervals
%E = vpa(G(0,time))