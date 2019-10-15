f = @(x) (3.*x-1).*exp(x);
df = @(x) (3.*x+2).*exp(x);
S = [2,2.25,2.5,2.75];
Y = f(S);
Z = df(S);
fExact = f(2.65)
fAprox = splineCubico(2.65,S,Y,Z)
error = abs(fExact-fAprox)

function [s] = splineCubico(t,X,Y,Z)
% Eval\'ua el spline c\'ubico definido por X,Y,Z en t.
% Entradas:
% X : Los puntos $x_0,\dotsc,x_n$ del dominio. Deben estar ordenados
%     ascendentemente
% Y : Las im\'agenes $y_i=f(x_i)$. Debe tener igual longitud que X.
% Z : Los valores de la derivada $z_i=f'(x_i)$. Debe tener igual longitud
%     que X.

if t < X(1)
    s = Y(1);
elseif t >= X(end)
    s = Y(end);
else
    i = find(X > t ,1);
    x0 = X(i-1);
    x1 = X(i);
    y0 = Y(i-1);
    y1 = Y(i);
    z0 = Z(i-1);
    z1 = Z(i);
    c0 = y0;
    c1 = z0;
    c2 = 3*(y1-y0)/(x1-x0)^2-(z1+2*z0)/(x1-x0);
    c3 = (z1+z0)/(x1-x0)^2-2*(y1-y0)/(x1-x0)^3;
    s = c0+c1*(t-x0)+c2*(t-x0)^2+c3*(t-x0)^3;
end
end