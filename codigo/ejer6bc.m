errorLU = [];
errorQR = [];

for m = 10:60
    A = matrizPatologica(m);
    [L,U] = lu(A);
    [Q,R] = qr(A);
    xExact = rand(m,1);
    b = A*xExact;
    
    % LU
    c = L\b; % $c=L^{-1}b$
    xApr = U\c;
    errorLU(length(errorLU)+1) = norm(xExact-xApr);
    
    % QR
    xApr = R\(Q'*b);
    errorQR(length(errorQR)+1) = norm(xExact-xApr);
end

semilogy(10:60,errorLU);
hold on;
semilogy(10:60,errorQR);
legend('LU','QR');
xlabel('m');
ylabel('Error');
hold off;