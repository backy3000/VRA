function Q11()
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');    
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');    
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    nBins=256;
    numImgTrain=size(imgTrainAll,2);
    imgTrainAll_hist=zeros(nBins,numImgTrain);
    
    numImgTest=size(imgTestAll,2);
    imgTestAll_hist=zeros(nBins,numImgTest);
    
    for i=1:numImgTrain
        imgTrainAll_hist(:,i)=imhist(imgTrainAll(:,i),nBins);
    end
    for i=1:numImgTest
        imgTestAll_hist(:,i)=imhist(imgTestAll(:,i),nBins);
    end
    mdl=fitcknn(imgTrainAll_hist',lblTrainAll);
    lblPredict=predict(mdl,imgTestAll_hist');
    nResult=(lblPredict==lblTestAll);
    nCount=sum(nResult);
    fprintf('\nSo luong mau da dung : %d\n',nCount);
end