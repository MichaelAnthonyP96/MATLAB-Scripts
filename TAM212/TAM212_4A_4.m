Rop = [1 1 0]; W1 = -3; a1 = [0 0 -2];
Rpq = [0 2 0]; W2 = 3; a2 = [0 0 2];
Ap = cross(a1,Rop) -(W1^2)*Rop;
Aq = Ap + cross(a2,Rpq) -(W2^2)*Rpq;
Aq