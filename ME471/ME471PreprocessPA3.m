he = zeros(n_elem,1);
EC = zeros(n_elem,2);
YM = zeros(n_elem,1);
A = zeros(n_elem,1);
LX = zeros(n_elem,1);
LY = zeros(n_elem,1);
for i = 1:n_elem 
  EC(i,1) = E(i,2);
  EC(i,2) = E(i,3);
  YM(i) = E(i,5);
  A(i) = E(i,4);
end
for i = 1:n_elem
    he(i) = sqrt( (N( EC(i,1),2 ) + N(EC(i,2),2) ).^2 + (N( EC(i,1),3 ) + N(EC(i,2),3)) .^2 );
    LX(i) = (N( max( EC(i,1), EC(i,2)),2 ) - N(min( EC(i,1), EC(i,2)),2)) / he(i);
    LY(i) = (N( max( EC(i,1), EC(i,2)),3 ) - N(min( EC(i,1), EC(i,2)),3)) / he(i);
    %LX(i) = (N( EC(i,1),2 ) - N(EC(i,2),2)) / he(i);
    %LY(i) = (N( EC(i,1),3 ) - N(EC(i,2),3)) / he(i);
end
