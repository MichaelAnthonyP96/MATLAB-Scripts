Rp =[-1,-5,0]; Rq = [3,4,0];
Vp =[-6,-6,0]; Vq =[48,-30,0];
syms Rmx Rmy Omegaz
Omega = [0,0,Omegaz];
Rm = [Rmx,Rmy,0];
eqn1 = (Vp == cross(Omega,Rp - Rm));
eqn2 = (Vq == cross(Omega,Rq - Rm));
[Rmx,Rmy, Omegaz] = solve(eqn1,eqn2, [Rmx,Rmy,Omegaz])
