format long
L = 1;
t = 0.5;
delt = 0.00125;
delx = 0.0125;
b = (delt/(2*(delx^2)));
U(1:((t/delt)+1),1:((L/delx)+1)) = 0;
 
A = full(gallery('tridiag',((L/delx)+1),-b,(1+2*b),-b));
A(1,1) = 1;
A(1,2) = 0;
A(((L/delx)+1),(L/delx)) = 0;
A(((L/delx)+1),((L/delx)+1)) = 1;
 
B = full(gallery('tridiag',((L/delx)+1),b,(1-2*b),b));
B(1,1) = 1;
B(1,2) = 0;
B(((L/delx)+1),(L/delx)) = 0;
B(((L/delx)+1),((L/delx)+1)) = 1;
 
for i = 2:(L/delx)
   U(1,i) = sin((pi*delx)*(i-1));
end
 
for i = 1:(t/delt)
    U(i+1,1:((L/delx)+1)) = A \ (B*U(i,1:((L/delx)+1)).');
end
U((t/delt)+1,((L/delx)/2)+1)