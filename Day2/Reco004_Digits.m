function Reco004_Digits()
    fprintf('\nLoad du lieu train');
    imgTrainAll=loadImages('train-images.idx3-ubyte');    
    lblTrainAll = loadLabels('train-labels.idx1-ubyte');
    fprintf('\nLoad du lieu test');
    imgTestAll=loadImages('t10k-images.idx3-ubyte');    
    lblTestAll = loadLabels('t10k-labels.idx1-ubyte');
    
    nTrainImages=size(imgTrainAll,2);
    nTestImages=size(imgTestAll,2);
    nNumber=randi([1 nTrainImages]);
    figure;
    imgTrain=reshape(imgTrainAll(:,nNumber),28,28);
    imgTrainLabel=num2str(lblTrainAll(nNumber));
    imshow(imgTrain);
    title(imgTrainLabel); 
    
    nNumber=randi([1 nTestImages]);
    figure;
    imgTest=reshape(imgTestAll(:,nNumber),28,28);
    imgTestLabel=num2str(lblTestAll(nNumber));
    imshow(imgTest);
    title(imgTestLabel);     
    
end