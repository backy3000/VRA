function Recognition003_Digits()
    fprintf('\nLoad du lieu train');
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');    
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    fprintf('\nLoad du lieu test');
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');    
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    nTrainImages=size(imgTrainAll,2);
    nTrainLabels=size(lblTrainAll,1);
    figure;
    imgFirst=reshape(imgTrainAll(:,1),28,28);
    imgFirstLabel=num2str(lblTrainAll(1));
    imshow(imgFirst);
    title(imgFirstLabel);    
    
    figure;
    imgLast=reshape(imgTrainAll(:,nTrainImages),28,28);
    imgLastLabel=num2str(lblTrainAll(nTrainImages));
    imshow(imgLast);
    title(imgLastLabel);   
    
end