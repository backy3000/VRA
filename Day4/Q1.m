function Q1(n)
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');    
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    
    img=imgTrainAll(:,n);
    img=reshape(img,28,28);
    imgLabel=num2str(lblTrainAll(n));    
    figure;    
    imshow(img);
    title(imgLabel); 
end