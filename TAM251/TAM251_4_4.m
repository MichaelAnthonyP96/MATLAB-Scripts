h = 156*10^-3;
t1=21*10^-3;
t2=22*10^-3;
b=247*10^-3;
A1 = t2*(b+(2*t1));
A2 = A1;
A3 = h*t1;
A4 = A3;
y1 = t2 + h + (t2/2);
y2 = t2/2;
y3 = t2 + (h/2);
y4 = y3;
Yb = (A1*y1 + A2*y2 + A3*y3 + A4*y4)/(A1+A2+A3+A4);
I1 = (1/12)*(2*t1 +b)*(t2)^2;
I2 =I1;
I3 = (1/12)*(t1)*(h^3);
I4 = I3;
Iz = I1 + I2 + I3 + I4 + A1*(y1 - Yb)^2 + A2*((y2-Yb)^2) + A3*((y3 - Yb)^2) + A4*((y4-Yb)^2);
M = 1315;