function y = AssembleStiffness3(K, ke, EC, j)
    dof1 = (2 * EC(j,1))-1;
    dof2 = (2 * EC(j,1));
    dof3 = (2 * EC(j,2))-1;
    dof4 = (2 * EC(j,2));
    K(dof1,dof1) = K(dof1,dof1) + ke(1,1);
    K(dof1,dof2) = K(dof1,dof2) + ke(1,2);
    K(dof1,dof3) = K(dof1,dof3) + ke(1,3);
    K(dof1,dof4) = K(dof1,dof4) + ke(1,4);
    K(dof2,dof1) = K(dof2,dof1) + ke(2,1);
    K(dof2,dof2) = K(dof2,dof2) + ke(2,2);
    K(dof2,dof3) = K(dof2,dof3) + ke(2,3);
    K(dof2,dof4) = K(dof2,dof4) + ke(2,4);
    K(dof3,dof1) = K(dof3,dof1) + ke(3,1);
    K(dof3,dof2) = K(dof3,dof2) + ke(3,2);
    K(dof3,dof3) = K(dof3,dof3) + ke(3,3);
    K(dof3,dof4) = K(dof3,dof4) + ke(3,4);
    K(dof4,dof1) = K(dof4,dof1) + ke(4,1);
    K(dof4,dof2) = K(dof4,dof2) + ke(4,2);
    K(dof4,dof3) = K(dof4,dof3) + ke(4,3);
    K(dof4,dof4) = K(dof4,dof4) + ke(4,4);
    y = K;
