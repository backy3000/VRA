function Q12
    [imgTrain,lblTrain]=loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
    [imgTest,lblTest]=loadData('t10k-images.idx3-ubyte','t10k-labels.idx1-ubyte');
    [mLBPTrain]=getLBP(imgTrain);
    [mLBPTest]=getLBP(imgTest);
    mdl=fitcknn(mLBPTrain',lblTrain);
    lblPredict=predict(mdl,mLBPTest');
    nResult=(lblPredict==lblTest);
    nCount=sum(nResult);
    fprintf('\nSo luong mau da dung : %d\n',nCount);
end