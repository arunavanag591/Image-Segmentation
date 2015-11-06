function XN=Nei4X(X)
[s,t,K]=size(X);

%up
Xu=zeros(s,t,K);
Xu(2:s,:,:)=X(1:s-1,:,:);

%right
Xr=zeros(s,t,K);
Xr(:,1:t-1,:)=X(:,2:t,:);

%down
Xd=zeros(s,t,K);
Xd(1:s-1,:,:)=X(2:s,:,:);

%left
X1=zeros(s,t,K);
X1(:,2:t,:)=X(:,1:t-1,:);
XN = cat(3,Xu,Xr,Xd,X1);

end