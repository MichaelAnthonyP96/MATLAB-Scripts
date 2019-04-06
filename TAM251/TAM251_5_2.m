ybar=56.25335120643432*10^-3;
format long;
h=.076;t1=.007;t2=.009;b=.089;
M=742;Iz=1.3429619582216266*10^-6;t=2*t1;V=12000;
ybartotop=h+t2-ybar;
sigmacomp=(M*ybartotop/Iz)*10^-6
y=((h*t1)+(b*t2))/(2*t1);
Aprime=2*((h-y)*t1)+(t2*b);
ybarprime=((2*((h-ybar)*t1*((h-ybar)/2))+(t2*b*((h-ybar)+t2/2)))/Aprime);
Q=Aprime*ybarprime;
tau=((V/Iz)*(Q/t))*10^-6