% Change k values
% change Beta values
clc;
clear all;

I = imread('Image01.png');
I = double(I);

beta=0.5;

k=[1:10];

maxIter=100;
region_size=zeros(length(k),length(k));
for i=1:length(k)
    i
    tic;
    [seg(i,:,:),prob,mu,sigma,it(i)]=ICM(I, k(i), beta, maxIter,3);
    t(i)=toc;
    pr(i)=prob(end);          
end

for i=1:length(k)
    i
 for j=1:i
     A=squeeze(seg(i,:,:));
        region_size(i,j)=numel(find(A==j));
 end
end

save('image01_k_swipe_beta_0.5','k','pr','t','it','region_size','seg');

figure;
bar(k, region_size, 0.5, 'stack')
xlabel('K');
ylabel('size of region');
c=colorbar;
c.Label.String='Classes';


figure;
plot(k,-pr,'x-','Linewidth',2);
xlabel('K')
ylabel('ln(P_a)');


