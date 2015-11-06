function [segmented_image,prob,mu,sigma,iter] = ICM(image, k, beta, max_iterations, neigh)
% function segmentation=ICM(image,class_number,potential,maxIter)
% segmented_image   : size of image
% image             : size of given image
% k                 : number of classes
% beta              : affinity between classes
% max_iterations    : Maximum iterations allowed
% neigh             : Neighbourhood for calculations

[width, height, bands] = size(image);
image = imstack2vectors(image);
% TODO: change this, just reshape instead of stack2vector
%segmented_image = int16(rand(size(image))*k);
%[segmented_image, c] = kmeans(image,k);

%segmentation=reshape(id,[width height]);
segmented_image = init(image,k,1);
% TODO: put init here
clear c;
iter = 0;
seg_old=segmented_image;

while(iter < max_iterations)
    [mu, sigma] = stats(image, segmented_image, k);
    
        
    E1 = energy1(image,mu,sigma,k);
    E2 = energy2(segmented_image, beta, width, height, k);
    E = E1 + E2;
    [p2,~]=min(E2,[],2);
    [p1,~]=min(E1,[],2);
    
    [p,segmented_image] = min(E,[],2);
    prob(iter+1)= sum(p);
    
    %find mismatch with previous step
    [c,~]=find(seg_old~=segmented_image);
    mismatch=(numel(c)/numel(segmented_image))*100;
    if mismatch<0.1
        iter
        break;
    end
    % TODO: add code to save total energy here
    iter = iter + 1;
    seg_old=segmented_image;
end
segmented_image = reshape(segmented_image,[width height]);

end
