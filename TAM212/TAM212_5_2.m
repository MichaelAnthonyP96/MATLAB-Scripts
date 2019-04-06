m1 = 7; m2 = 1; m3 = 8;
syms r2x r2y;
r1 = [5 4]; r2 = [r2x r2y]; r3 = [-2 3];
rc = [10 5];
eqn = (rc == (m1*r1 + m2*r2 +m3*r3)/(m1 + m2 + m3));
[r2x r2y] = solve([eqn],[r2x,r2y])