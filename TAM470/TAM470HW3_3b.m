syms F(x)
n = 32;
exact_answer = 272.453132316;
nodes = linspace(0,1,(2*n)+1);
N = [8,16,32,64,128];
sum = 0;
F(x) = ((100/(sqrt(x+.01)))+(1/((x-.3)^2 + .001))-pi);
h = 1/(2*n);
for k = 1:2:(2*n)-1
    sum = sum + (h/3)*(F(nodes(k)) + (4 * F(nodes(k+1))) + F(nodes(k+2)));
    vpa(sum);
end
sum32 = vpa(sum);
errors = [abs(exact_answer-sum8)/exact_answer,abs(exact_answer-sum16)/exact_answer,abs(exact_answer-sum32)/exact_answer,abs(exact_answer-sum64)/exact_answer,abs(exact_answer-sum128)/exact_answer];
loglog(N,errors, '-s')

xlabel('N panels in Simpson integration scheme')
ylabel('Relative Error')
title('Simpson Integration Scheme Error')
grid on