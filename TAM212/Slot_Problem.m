syms Vq w; Vp = [2,-1,0]; Rpq = [2,3,0];
VQ = [Vq*cosd(45),Vq*sind(45),0]; W = [0,0,w];
eqn1 = (VQ == Vp + cross(W,Rpq));
[w, Vq] = solve(eqn1,[w,Vq])
