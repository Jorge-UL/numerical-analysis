load ovariancancer;  %Esto crea las variables obs y grp
[U,S,V] = svd(obs,'econ');
hold on;
for i=1:size(obs,1)
   x = V(:,1)'*obs(i,:)';
   y = V(:,2)'*obs(i,:)';
   z = V(:,3)'*obs(i,:)';
   if(grp{i} == 'Cancer')
      h1 = plot3(x,y,z,'rx','LineWidth',2);  %se guarda en una variable para luego
                                             %identificar en la leyenda
   else
      h2 = plot3(x,y,z,'bo','LineWidth',2);
   end
end
xlabel('PC1');
ylabel('PC2');
zlabel('PC3');
legend([h1(1),h2(1)],'Cancer','Normal');
view(3);
grid on;

