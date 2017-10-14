function Q2(n)
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');    
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    img=imgTestAll(:,n);
    img=reshape(img,28,28);
    imgLabel=num2str(lblTestAll(n));    
    figure;    
    imshow(img);
    title(imgLabel); 
end