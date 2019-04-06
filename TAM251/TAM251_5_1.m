b=.023;t=.007;
Iz=(((2*t+4*b)*(6*t+4*b)^3)/12)-2*((((2*t+2*b)*(2*b)^3)/12)+((2*t+2*b)*(2*b)*(2*t+b)^2)+(2*t^4/12)+(2*t*t*(5*t/2+2*b)^2))
Aprime=(2*(2*b^2))+(2*(2*b*t))
ybarprime=((2*(2*b^2)*(b+2*t))+(2*(2*b*t)*(2*b+(5*t/2))))/Aprime
Q=ybarprime*Aprime
thick=2*b;V=29000;
tau=(V/Iz)*(Q/thick)
tau*10^-6