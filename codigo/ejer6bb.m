m = 54;
A = matrizPatologica(m);
[L,U] = lu(A);
amax = max(A,[],'all');
umax = max(U,[],'all');
factorCrecimiento = umax/amax

normaError = norm(A-L*U)