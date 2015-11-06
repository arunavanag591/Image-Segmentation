function [E1] = energy1(image, mu, sigma, k)
% function [E2]=energy2(image,mu,sigma,k)
% E1       : No_of_pixels * k array, of eta1 
% Image    : no_of_pixels * 1 array
% mu       : k * 1 array of mean of each class
% sigma    : k * 1 array of standard deviations of each class
% k        : integer value of number of classes
n = size(image, 1);
E1 = zeros(n, k);
for i = 1:k
    mu_i = mu(i,:);
    sigma_i = sigma(:,:,i);
    diff_i = image - repmat(mu_i,[n,1]);
    E1(:,i) = sum(diff_i*inv(sigma_i).*diff_i,2)+log(det(sigma_i));
end
end
