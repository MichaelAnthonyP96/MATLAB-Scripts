[n_node, n_elem, N,   E,   F,   C] = read_input_file('PA3Example1.txt');
ME471PreprocessPA3;
K = zeros(2*n_node,2*n_node);
for j=1:n_elem
    ke = ElementStiffness3(he(j),YM(j),A(j),LX(j),LY(j));
    K = AssembleStiffness3(K,ke,EC,j);
end
f = zeros(2*n_node,1);
%assembly Forces
for b=1:size(F,1)
    f( (F(b,1)*2 -1) ,1) = F(b,2);
    f( (F(b,1)*2) ,1) = F(b,3);
end
% Set the values for the prescribed BCs; VBC(i) = g
BC = zeros(2*n_node,1);
VBC = zeros(2*n_node,1);
for h=1:size(C,1)
    %X boundary conditions
    BC(2*C(h,1)-1) = C(h,2);
    VBC(2*C(h,1)-1) = C(h,4);
    %Y boundary conditions
    BC(2*C(h,1)) = C(h,3);
    VBC(2*C(h,1)) = C(h,5);
end
%apply the BC's
for i=1:2*n_node
   if BC(i) > 0
    for j=1:2*n_node
        f(j,1) = f(j,1) - K(j,i)*VBC(i);
    end
    K(i,:) = 0;
    K(:,i) = 0;
    K(i,i) = 1.0;
    f(i,1) = VBC(i,1);
   end
end
%Solve the system, d is the displacement at each node
d = K\f;
%Solve for the Element forces
D = zeros(4,1);
for j=1:n_elem
    ke = ElementStiffness3(he(j),YM(j),A(j),LX(j),LY(j));
    %extracting the correct D's to use with the ke's for Element Forces
    D(1,1) = d( (min( EC(j,1), EC(j,2)) * 2)-1,1 );
    D(2,1) = d( (min( EC(j,1), EC(j,2)) * 2),1 );
    D(3,1) = d( (max( EC(j,1), EC(j,2)) * 2)-1,1 );
    D(4,1) = d( (max( EC(j,1), EC(j,2)) * 2),1 );
    %Calculate the Element Forces, unsuppress to see each value
    EF = ke * D;
    %Calculate the Axial Forces, unsuppress to see each value
    AF = sqrt(EF(1).^2+EF(2).^2);
end