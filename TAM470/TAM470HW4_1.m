syms F(x) x G(x);
F(x) = (1/2)*sin(2*x) - (1/3)*cos(3*x) + 4/3;
%vpa(F(1));
G(x) = cos(2*x) + sin(3*x);
vpa(G(0.5))