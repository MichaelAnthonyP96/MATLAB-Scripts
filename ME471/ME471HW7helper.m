
% This is a sample matlab code for numerical integration of bilinear quadrilateral
% Illustrates typical structure of numerical integration
% Input the x and y coordinates of the element (e.g., x1e, x2e, x3e, x4e) 
  x = [0 0.5 0.5 0]; 
  y = [0 0 0.5 0.5];  
% Enter the number of integration points, their coordinates and weights 
% The code below has three options (# integration points = 1, 4 or 9) 
% nint = 1; 
  nint = 4; 
% nint = 9; 
  %psiint = zeros(nint,1); 
  %etaint = zeros(nint,1); 
  %weights = zeros(nint,1); 
% nint = 1; 
%  psiint = [0]; 
%  etaint = [0]; 
%  weights = [4]; 
% nint = 4; 
 psiint = [-1/sqrt(3) 1/sqrt(3) 1/sqrt(3) -1/sqrt(3)]; 
 etaint = [-1/sqrt(3) -1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]; 
 weights = [1 1 1 1]; 
% nint = 9; 
% psiint = [-sqrt(3/5) 0 sqrt(3/5) -sqrt(3/5) 0 sqrt(3/5) -sqrt(3/5) 0 sqrt(3/5)]; 
% etaint = [-sqrt(3/5) -sqrt(3/5) -sqrt(3/5) 0 0 0 sqrt(3/5) sqrt(3/5) sqrt(3/5)]; 
% weights = [25/81 40/81 25/81 40/81 64/81 40/81 25/81 40/81 25/81]; 
% Determine the shape functions and their gradients (local) of each node at each 
% integration point 
  N = zeros(4,nint); 
  Npsi = zeros(4,nint); 
  Neta = zeros(4,nint); 
  Nx = zeros(4,nint); 
  Ny = zeros(4,nint); 
  for l=1:nint 
     wl = weights(l); 
     psil = psiint(l); 
     etal = etaint(l);  
     N(1,l) = 0.25*(1-psil)*(1-etal); 
     N(2,l) = 0.25*(1+psil)*(1-etal); 
     N(3,l) = 0.25*(1+psil)*(1+etal); 
     N(4,l) = 0.25*(1-psil)*(1+etal); 
     Npsi(1,l) = -0.25*(1-etal); 
     Npsi(2,l) =  0.25*(1-etal); 
     Npsi(3,l) =  0.25*(1+etal); 
     Npsi(4,l) = -0.25*(1+etal); 
     Neta(1,l) = -0.25*(1-psil); 
     Neta(2,l) = -0.25*(1+psil); 
     Neta(3,l) =  0.25*(1+psil); 
     Neta(4,l) =  0.25*(1-psil); 
  end 
% Determine the gradients of the shape functions 
  xpsi = zeros(nint,1); 
  xeta = zeros(nint,1); 
  ypsi = zeros(nint,1); 
  yeta = zeros(nint,1); 
  jaco = zeros(nint,1); 
  psix = zeros(nint,1); 
  psiy = zeros(nint,1); 
  etax = zeros(nint,1); 
  etay = zeros(nint,1); 
  Nx = zeros(4,nint); 
  Ny = zeros(4,nint); 
  for l=1:nint 
     for a=1:4 
        xpsi(l,1) = xpsi(l,1) + Npsi(a,l)*x(a); 
        xeta(l,1) = xeta(l,1) + Neta(a,l)*x(a); 
        ypsi(l,1) = ypsi(l,1) + Npsi(a,l)*y(a); 
        yeta(l,1) = yeta(l,1) + Neta(a,l)*y(a); 
     end 
     jaco(l,1) = xpsi(l,1)*yeta(l,1) - xeta(l,1)*ypsi(l,1); 
     psix(l,1) = yeta(l,1)/jaco(l,1); 
     psiy(l,1) = -xeta(l,1)/jaco(l,1); 
     etax(l,1) = -ypsi(l,1)/jaco(l,1); 
     etay(l,1) = xpsi(l,1)/jaco(l,1); 
     for a=1:4 
        Nx(a,l) = Npsi(a,l)*psix(l,1) + Neta(a,l)*etax(l,1);     
        Ny(a,l) = Npsi(a,l)*psiy(l,1) + Neta(a,l)*etay(l,1); 
     end 
  end 
% Compute the element stiffness matrix now 
  Ke = zeros(4,4); 
  for a=1:4 
     for b=1:4 
        for l = 1:nint 
           Ke(a,b) = Ke(a,b) + (Nx(a,l)*Nx(b,l) +  Ny(a,l)*Ny(b,l))*jaco(l,1)*weights(l); 
        end 
     end 
  end 