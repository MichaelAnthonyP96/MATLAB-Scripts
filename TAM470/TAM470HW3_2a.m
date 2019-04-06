syms a b c d A h;
eqn1 = (-a/h -b/h -c/h -d/h == 0);
eqn2 = (1+ A -b -2*c -3*d == 0);
eqn3 = (A*h -b*h/2 -2*c*h -9*d*h/2 == 0);
eqn4 = ((A*h^2)/2 -(b*h^2)/6 -(4*c*h^2)/3 -(9*d*h^2)/2 == 0);

S = solve([eqn1,eqn2,eqn3,eqn4],[a,b,c,d])

a0 = S.a
b0 = S.b
c0 = S.c
d0 = S.d