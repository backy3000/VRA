function [mLBP]=getLBP(img)
    img1D=img(:,1);
    img2D=reshape(img1D,28,28);
    v=extractLBPFeatures(img2D);
    d=length(v);
    c=size(img,2);
    mLBP=zeros(d,c);
    for i=1:c
        img1D=img(:,i);
        img2D=reshape(img1D,28,28);
        v=extractLBPFeatures(img2D);
        mLBP(:,i)=v;
    end
end