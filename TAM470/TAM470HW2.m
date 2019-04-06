syms a0 a1 a2 b0 b1 b2 c0 c1 c2 d0 d1 d2 x S0(x) S1(x) S2(x);
x0 = 0.1; x1 = 0.2; x2 = 0.3; x3 = 0.4;
fx0 = -0.62049958; fx1 = -0.28398668; fx2 = 0.00660095; fx3 = 0.24842440;

S0(x) = a0 + b0*(x-x0) + c0*(x-x0)^2 + d0*(x-x0)^3;
S1(x) = a1 + b1*(x-x1) + c1*(x-x1)^2 + d1*(x-x1)^3;
S2(x) = a2 + b2*(x-x2) + c2*(x-x2)^2 + d2*(x-x2)^3;
%Derivatives of the symbolic S0 S1 S2 functions
S0prime(x) = diff(S0,x);
S1prime(x) = diff(S1,x);
S2prime(x) = diff(S2,x);
S0dprime(x) = diff(S0prime,x);
S1dprime(x) = diff(S1prime,x);
S2dprime(x) = diff(S2prime,x);
%12 condition statements to solve for the 
eqn1 = ( S0(x0) == fx0);
eqn2 = ( S0(x1) == fx1);
eqn3 = ( S1(x1) == fx1);
eqn4 = ( S1(x2) == fx2);
eqn5 = ( S2(x2) == fx2);
eqn6 = ( S2(x3) == fx3);
eqn7 = ( S0prime(x1) == S1prime(x1));
eqn8 = ( S1prime(x2) == S2prime(x2));
eqn9 = ( S0dprime(x0) == 0);
eqn10 = ( S2dprime(x3) == 0);
eqn11 = ( S0dprime(x1) == S1dprime(x1));
eqn12 = ( S1dprime(x2) == S2dprime(x2));
%Solve for the unknown variables
[a0,a1,a2,b0,b1,b2,c0,c1,c2,d0,d1,d2] = solve([eqn1,eqn2,eqn3,eqn4,eqn5,eqn6,eqn7,eqn8,eqn9,eqn10,eqn11,eqn12],[a0,a1,a2,b0,b1,b2,c0,c1,c2,d0,d1,d2]);
A0 = vpa(a0)
A1 = vpa(a1)
A2 = vpa(a2)
B0 = vpa(b0)
B1 = vpa(b1)
B2 = vpa(b2)
C0 = vpa(c0)
C1 = vpa(c1)
C2 = vpa(c2)
D0 = vpa(d0)
D1 = vpa(d1)
D2 = vpa(d2)
S1_(x) = A1 + B1*(x-x1) + C1*(x-x1)^2 + D1*(x-x1)^3;
S1_(0.25)