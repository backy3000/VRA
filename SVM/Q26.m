function Q26
    [imgTrain,lblTrain]=loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
    [imgTest,lblTest]=loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte');    
    mdl=fitcecoc(imgTrain',lblTrain);    
    lblResult=predict(mdl,imgTest');    
    nResult=(lblResult==lblTest);    
    nCount=sum(nResult);
    fprintf("So luong mau da dung : %d",nCount);
end