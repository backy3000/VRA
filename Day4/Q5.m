function Q5(n)
    if(n<0||n>10000)
        disp('Tham so khong hop le');
        return;
    end
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');    
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    
    mdl=fitcknn(imgTrainAll',lblTrainAll);
    
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');    
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
       
    imgTest=imgTestAll(:,n);
    lblImgTest=num2str(lblTestAll(n));
    
    lblPredict=predict(mdl,imgTest');
    
    figure;
    img2D=reshape(imgTest,28,28);
    imshow(img2D);
    
    message=['Anh test: ',lblImgTest,'.'];
    message=[message,'Du doan : '];
    message=[message,num2str(lblPredict)];
    
    if(num2str(lblPredict)==lblImgTest)
        message=[message,'. => Ket qua dung'];
    else
        message=[message,'. => Ket qua sai'];
    end
    title(message);
end