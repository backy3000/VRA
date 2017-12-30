function Q14    
    [imgTrain,lblTrain]=loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
    [imgTest,lblTest]=loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte');    
    featuresDataTrain=ExtHOGFeatures(imgTrain);    
    mdl=fitcknn(featuresDataTrain',lblTrain);    
    featuresDataTest=ExtHOGFeatures(imgTest);    
    lblResult=predict(mdl,featuresDataTest');   
    nResult=(lblResult==lblTest);    
    nCount=sum(nResult);
    fprintf("So luong mau da dung : %d",nCount);
end