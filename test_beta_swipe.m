% change Beta values
clc
clear

I = imread('Image04.png');
I = double(I);
k = 4;

beta=[0:0.5:10];
maxIter=100;
region_size=zeros(length(beta),k);
for i=1:length(beta)
    i
    tic;
    [seg(i,:,:),prob,mu,sigma,it(i)]=ICM(I, k, beta(i), maxIter,3);
    t(i)=toc;
    pr(i)=prob(end);          
end

for i=1:length(beta)
    i
    for j=1:k
        A=squeeze(seg(i,:,:));
        region_size(i,j)=numel(find(A==j));
    end
end

save('image04_beta_swipe_k_4','k','pr','t','it','region_size','seg');

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

