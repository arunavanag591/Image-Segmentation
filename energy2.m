function [E2]=energy2(segmented_image, beta, width, height, k)
% function [E2]=energy2(image,mu,sigma,k)
% E2                : No_of_pixels * k array
% segmented_image   : no_of_pixels * 1 array
% beta              : integer value of beta
% width             : width of the original image
% height            : height of the original image
% k                 : integer value of number of classes

n = size(segmented_image, 1);

segmented_image = reshape(segmented_image,[width height]);
Nei4 = imstack2vectors(Nei4X(segmented_image));
E = zeros(n, k);
for i = 1:k
    E(:,i)=sum(Nei4~=i,2); %when yi~= yj--> different classes
    Ex(:,i)=sum(Nei4==i,2); %when yi==yj---> same classes
end
E2 = E * beta - (Ex * beta);

end