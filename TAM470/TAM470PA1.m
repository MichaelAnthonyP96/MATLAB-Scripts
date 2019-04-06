syms x P(x) phi(x);
n = 6;
%generates the correct number of nodes and the values at those nodes
nodes = linspace(-1,1,n);
for i = 1:n
    f_nodes(i) = 1/(1 + 50*nodes(i).^2);
end

%calculates and plots the exact function
x_plots = linspace(-1,1,101);
for i = 1:101
    y_plots(i) = 1/(1 + 50*x_plots(i).^2);
end
plot(x_plots,y_plots,'b-')
hold on 
scatter(nodes,f_nodes)

%calculates the C values using the divided difference recursion method
C = zeros(1,n);
for i = 1:n
    C(i) = divided_difference(1,i, nodes, f_nodes);
end

%multiples each C by the correct phi
P(x) = 0;
phi(x) = 1;
for i = 1:n
    if ( i == 1)
        phi(x) = 1;
    else
        phi(x) = phi(x) * (x-nodes(i-1));
    end    
    P(x) = P(x) + phi(x) * C(i);
end

C; %check to see that the correct C values are generated 
vpa(P(x)); %print the polynomial to check that it is correct

%Generating and plotting the function values for our modeling polynomial
%across the x interval -1 to 1
I_plots = P(x_plots);
I_plots = vpa(I_plots);
plot(x_plots,I_plots,'r--' )
%ylim([-1.0 1.1])
legend('Exact Function','Nodes', 'Modeling Function for n = 6' )
xlabel('X')
ylabel('Y')
title('Exact Function vs. Newton Divided Difference Scheme')