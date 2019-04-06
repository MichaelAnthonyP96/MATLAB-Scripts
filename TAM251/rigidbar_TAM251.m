format long

h=112;
b=100;
theta1=atan(h/b);
theta2=atan(h/(2*b));
delta_ratio=sin(theta1)/(2*sin(theta2));
E1=152;
E2=169;
d=28;
l1=sqrt(h^2+b^2);
l2=sqrt(h^2+4*b^2);
A=pi*d^2/4;
f1=l1/(E1*A);
f2=l2/(E2*A);
force_ratio= (f2*sin(theta1))/(2*f1*sin(theta2));
w=50;
F2=(((3/2)*b*w)/((b*f2*sin(theta1)^2)/(2*f1*sin(theta2))+2*b*sin(theta2)));
F1=(F2*f2*sin(theta1))/(2*f1*sin(theta2));
s1=F1/A;
s2=F2/A;