syms x T(x);

Q=0.0; L=10.0; KA=1.0; T0=50; B=25; Tinf=5; qhat=0;

T(x) = (1/KA)*(-B*((L/(KA*(1+(B*L/KA))))*(B*Tinf - qhat) + T0/(1+(B+L)/KA) - Tinf) - qhat)*x + T0;

T(5)