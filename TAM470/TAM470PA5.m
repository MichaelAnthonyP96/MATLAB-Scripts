%Calculating the exact value
syms Ue(x,y) x y;
Ue(x,y) = (x*exp(y));
Uexact = vpa(Ue(1.0,0.5)); 
%format long
xlen = 2;
ylen = 1;
delx = 0.0625;
dely = 0.0625;
M = (xlen/delx);%Number of x intervals
N = (ylen/dely);%Number of y intervals
xNodes = zeros(M+1,1);
yNodes = zeros(N+1,1);
%initializing the A matrix to be size ((M+1)(N+1) * (M+1)(N+1))
A(1:(M+1)*(N+1),1:(M+1)*(N+1)) = 0;
%initializing the F matrix to be size ((M+1)(N+1) * 1)
F = zeros((M+1)*(N+1), 1);
%creating the xNodes and yNodes vectors
for f = 2:(M+1)
   xNodes(f) = (xNodes(f-1) + delx);
end
for f = 2:(N+1)
   yNodes(f) = (yNodes(f-1) + dely);
end
%Using the xNodes and yNodes vectors to construct the b vector
for i = 1:((xlen/delx)+1)
   for j = 1:((ylen/dely)+1)
       F(j + (i-1)*(N+1)) = (xNodes(i)*exp(yNodes(j)));
   end
end
%Applying the boundary condition u(0,y) = 0 to the A matrix
for P = 1:(M+1)
    A(P,P) = 1;
end
%Applying the boundary condition u(2,y) = 2e^y to the A matrix
for P = (N*(M+1)+1):((M+1)*(N+1))
   A(P,P) = 1;
end
%Applying the boundary condition u(x,0) = x to the A matrix
for P = (M+2):(N+1):((M+1)*(N) - N)
    A(P,P) = 1;
end
%Applying the boundary condition u(x,1) = xe^1 to the A matrix
for P = (2*(M+1)):(M+1):((M+1)*(N))
    A(P,P) = 1;
end
%Applying the interior node conditions to the A matrix
for i = 2:M
    for j = 2:N
        P = j + (i-1)*(N+1);
        Q = j + (i)*(N+1);
        S = j+1 + (i-1)*(N+1);
        R = j + (i-2)*(N+1);
        T = j-1 + (i-1)*(N+1);
        A(P,P) = (-2/(delx.^2) -2/(dely.^2));
        A(P,Q) =+ 1/(delx.^2);
        A(P,S) =+ 1/(dely.^2);
        A(P,R) =+ 1/(delx.^2);
        A(P,T) =+ 1/(dely.^2);
    end
end
%Solving Ax = b
U = A\F;
%Extracting the U value corresponding to x = 1 y = 0.5
Val = ((M+1)*(N+1)+1)/2;
U(Val)