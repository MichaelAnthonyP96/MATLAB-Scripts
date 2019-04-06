format long
g = 9.8; m = 7; v=2; x =8;
vp = 6*cos(1.5*x);
vx = sqrt((v^2)/((vp^2) +1));
syms ax ay
eqn1 = (ay==(-9*sin(1.5*x)*(vx^2) + 6*cos(1.5*x)*ax));
eqn2 = (ay^2 + ax^2 ==0);
[ax,ay] = solve([eqn1,eqn2],[ax,ay]);
Ax = double(ax);
Ay = double(ay);
Fw = m*[Ax, Ay+g]