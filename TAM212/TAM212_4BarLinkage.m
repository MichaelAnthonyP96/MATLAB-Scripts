syms w1 w2 Vdx Vdy Vcx Vcy
Rab = [1,0,0]; Rcd = [-2,-1,0]; Rbc = [1,2,0]; Rda = [0,-1,0];
Vc = [Vcx Vcy 0]; Vd = [Vdx Vdy 0]; Va = [0,0,0];
W1 = [0,0,w1]; W2 = [0,0,w2]; W3 = [0,0,1];
eqn1 = (Vc == cross(W2,Rbc)); eqn2 = (Vd == Vc + cross(W3,Rcd));
eqn3 = (Va == Vd + cross(W1,Rda));
[w1,w2,Vdx,Vdy,Vcx,Vcy] = solve([eqn1,eqn2,eqn3],[w1, w2, Vdx, Vdy, Vcx, Vcy])