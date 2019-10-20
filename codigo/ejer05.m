%Prueba de la funcion utilizando el ejemplo de la tarea
F=@(x)[3*x(1)-cos(x(2)*x(3))-0.5;x(1)^2-81*(x(2)+0.1)^2+sin(x(3))+1.06;exp(-x(1)*x(2))+20*x(3)-1+10*pi/3];
x0=[0.1,0.1,-0.1].';
x1=NewtonNL(F,x0,10^(-13),1); %primera iteracion de Newton para el F
x2=NewtonNL(F,x1,10^(-13),1); %segunda iteracion
x3=NewtonNL(F,x2,10^(-13),1); %tercera iteracion
z=NewtonNL(F,x0,10^(-13),999);

%Funcion de Metodo de Newton para resolver sistemas no lineales:
function[y]=NewtonNL(F,x0,tol,itermax)
%Resolución de sistemas no lineales utilizando el algoritmo de Newton
%Entradas: F -- vector con las funciones del sistema:
%               F(x)=[f1(x),...,fn(x)]
%               donde x es un vector de n elementos
%          x0 - vector de n elementos de aproximacion inicial.
%          tol- tolerancia de la aproximacion para detener el programa
%      itermax- cantidad maxima de iteraciones para detener el programa
%Salidas:  y -- aproximacion final

syms x [length(x0),1];
syms f;
f=F(x);
[~,col]=size(f);
if col~=1
    %Redefinir F como un vector columna
    f=f.';
    F=matlabFunction(f,'vars',{x});
end
[~,col]=size(x0);
if col~=1
    %Redefinir x0 como vector columna
    x0=x0.';
end
J=matlabFunction(jacobian(f),'vars',{x});
err=tol+1;
k=1;
y=x0;
while err>tol && k<=itermax
    x0=y;
    y=J(x0)\(-F(x0)); %se calcula -(J^-1)*F
    y=y+x0;
    k=k+1;
    err=norm(y-x0)/norm(y);
end
end
