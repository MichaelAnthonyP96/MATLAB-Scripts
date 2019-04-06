syms y t F(y,t) G(t)
%For domain 0 <= t <= 2
%For h = 0.2, 0.1, 0.05, 0.025
h = 0.2;
length = 2/h;
T = linspace(0,2,length+1);
Y = zeros(1,length);
Y(1) = 0.5;

%Exact Function
G = @(t) ((t+1).^2 -0.5*exp(t));
%Approximating function
F = @(y,t) (y - t.^2 + 1);

%RK2 Formula without explicitly calculating K1 K2
for i = 1:length
    Y(i+1) = Y(i) + h * F(Y(i) + h/2 * F(Y(i), T(i)), T(i) + h/2);
end
%Y

W = zeros(1,length);
W(1) = 0.5;
%RK4 Method using and calculating the K values for each iteration through
for j = 1:length
    %Calculating the K values for RK4
    K1 = @(y, t) F( W(j), T(j));
    K2 = @(y, t) F( W(j) + h/2 * K1(y, t), T(j) + h/2);
    K3 = @(y, t) F( W(j) + h/2 * K2(y, t), T(j) + h/2);
    K4 = @(y, t) F( W(j) + h * K3(y, t), T(j) + h);
    W(j+1) = W(j) + h*( (1/6)*K1(y,t) + (1/3)*K2(y,t) + (1/3)*K3(y,t) + (1/6)*K4(y,t) );
end
%W