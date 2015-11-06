beta=[0:0.5:10];
figure;
plot(beta,-pr,'x-','Linewidth',2);
xlabel('\beta')
ylabel('ln(P_a)');

figure;
bar(beta, region_size, 0.5, 'stack')
xlabel('\beta');
ylabel('size of region');
c=colorbar;
c.Label.String='Classes';

figure;
plot(beta,t,'x-','Linewidth',2);
xlabel('\beta')
ylabel('Time');