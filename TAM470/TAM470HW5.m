syms y t F(y,t)
F(y,t) = y - t^2 + 1;
%RK4 coefficient calculation
y1 = 0.9204711914;
t1 = 0.25;
k1 = F(y1,t1);
k2 = F(y1 + (0.25/2)*k1,t1 + 0.25/2);
k3 = F(y1 + (0.25/2)*k2,t1 + 0.25/2);
k4 = F(y1 + 0.25*k3,t1 + 0.25);
vpa(k1);
vpa(k2);
vpa(k3);
vpa(k4);
vpa(k1+2*k2+2*k3+k4)