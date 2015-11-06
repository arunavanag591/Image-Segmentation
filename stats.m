function[mu, sigma] = stats(image, segmented_image, k)
% function[mu, sigma] = stats(image, segmented_image, k)
% mu                : TODO: decide on dimensions
% sigma             : TODO: decide on dimensions
% Image             : no_of_pixels * 1 array
% segmented_image   : no_of_pixels * 1 array
% k                 : integer value of number of classes

[n,d]=size(image);
mu = zeros(k, d);
sigma = zeros(d, d, k);
   for i = 1:k
        im_i = image(segmented_image == i,:);
        [sigma(:,:,i),mu(i,:)]=covmatrix(im_i);
%         X = double(im_i);
%         [K,n] = size(im_i);
%         if K == 1
%             sigma(:,:,i) = 0;
%             mu(i,:) = X;
%         else
%             m = sum(X,1)/K;
%             X = X - m(ones(K,1),:);
%             sigma(:,:,i) = (X' * X)/(K-1);
%             mu(i,:) = m';
%         end
    end
end
