L = 1;
t = 0.5;
phi(1:(t/0.01) + 1,1:(L/0.1) + 1) = 0;
n = 11;

%initialize the tridiag matrix
B = zeros(11,11);
B(1,1) = 1;
B(11,11) = 1;
for i = 2:10
    B(i,i) = 3;
    B(i,i-1) = -1;
    B(i,i+1) = -1;
end    
Bi = inv(B);

%initializing the first row of phi, given the initial condition phi(x,0) =
%sin(pi*x)
for i = 2:10
   phi(1,i) = sin(pi*((i-1)/10));
end

%solving for each row of phi using backward Euler
for i = 1:50
   phi(i+1,1:11) = Bi * phi(i,1:11).';
end
