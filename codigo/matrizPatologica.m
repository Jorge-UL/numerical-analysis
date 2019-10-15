function [A]=matrizPatologica(m)
% Devuelve la matriz de tama\~no $m$ del ejercicio 6.b.a.
% Entradas:
% m : Tama\~no de la matriz.
% Salidas:
% M : La matriz del ejercicio 6.b.a.

A = zeros(m);

for i = 1:m
    for j = 1:m
        if i == j
            A(i,j) = 1;
        elseif i > j
            A(i,j) = -1;
        elseif j == m
            A(i,j) = 1;
        end
    end
end