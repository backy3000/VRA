function Recognition005_Digits()

    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');    
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    
    mdl=fitcknn(imgTrainAll',lblTrainAll);
    
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');    
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    nTestImages=size(imgTestAll,2);
    nNumber=randi([1 nTestImages]);
    
    imgTest=imgTestAll(:,nNumber);
    lblImgTest=imgTestAll(nNumber);
    
    lblPredict=predict(mdl,imgTest');
    
    figure;
    img2D=reshape(imgTest,28,28);
    imshow(img2D);
    
    message=['Anh test ban dau co nhan: ',num2str(lblTestAll(nNumber)),'.'];
    message=[message,'Du doan cua chuong trinh : '];
    message=[message,num2str(lblPredict)];
    
    if(num2str(lblPredict)==num2str(lblTestAll(nNumber)))
        message=[message,'. => Ket qua dung'];
    else
        message=[message,'. => Ket qua sai'];
    end
    title(message);
end