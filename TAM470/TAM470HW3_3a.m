syms F(x) Fp(x)
n = 128;
exact_answer = 272.453132316;
nodes = linspace(0,1,n+1);
N = [8,16,32,64,128];
sum = 0;
F(x) = ((100/(sqrt(x+.01)))+(1/((x-.3)^2 + .001))-pi);
Fp(x) = diff(F(x),x);
h = 1/n;
%computes the series approximation in the below loop
for k = 1:n
    sum = sum + (h/2)*(F(nodes(k)) + F(nodes(k+1)));
    vpa(sum);
end
%edge correction factor in the below term
sum128 = vpa(sum - (h.^2)/12*(Fp(1) - Fp(0)));
errors = [abs(exact_answer-sum8)/exact_answer,abs(exact_answer-sum16)/exact_answer,abs(exact_answer-sum32)/exact_answer,abs(exact_answer-sum64)/exact_answer,abs(exact_answer-sum128)/exact_answer];
loglog(N,errors, '-s')

xlabel('N panels in trapezoid integration with end correction scheme')
ylabel('Relative Error')
title('Trapezoidal Integration Scheme with end correction Error')
grid on