% main file 
clc
clear

I = imread('Image01.png');
I = double(I);
k = 3;
beta = 5;
maxIter=100;

for i=1:length(beta)
i  
[seg,prob,mu,sigma,it(i)]=ICM(I, k, beta(i), maxIter,3);
pr(i)=prob(end);
hold on;
end
figure;
imshow(seg,[]);
