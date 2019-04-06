x = 0:1/10:1;
ye = (20*exp(1)/((exp(2))+1))*(exp(x)-exp(-x));
plot(x,ye,'-r')
hold on
yg = (((11.75792)*(x))+((3.458213)*x.^2));
plot(x,yg,'-b')
%hold on
%yg = (((125/28)*(x.^2))+((155/14)*x));
%plot(x,yg,'-g')
xlabel('Domain')
ylabel('Range')
title('Problem 1-2b: Comparison of Exact and Rayleigh-Ritz')
legend('Exact', 'Ritz','location','southeast')
