function segmentation=init(image,k,type)
% File to initialize
%init function will take three parameters as input
% image = input grayscale image
% k = number of classes
%type = 1 for kmeans, 2 for  gray scale thresholding, 3 for Random
%intialization

if type==1
    [segmentation,~]=kmeans(image,k);
elseif type==2
    thresh = multithresh(image,k);
    segmentation = imquantize(image,thresh);

else
%     [m,n]=size(image)
    segmentation=randi(k,length(image),1);
%     segmentation=reshape(r,[m,n]);
        
end


end