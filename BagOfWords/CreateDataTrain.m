function CreateDataTrain()
    [imgTrain,lblTrain]=loadData('train-images.idx3-ubyte','train-labels.idx1-ubyte');
    nTrainImages=size(imgTrain,2);
    for i=0:9
        mkdir(['DataTrain\' num2str(i)]);
    end
    index=zeros(1,10);
    for i=1:nTrainImages
        img=imgTrain(:,i);
        img2D=reshape(img,28,28);
        category=lblTrain(i);
        strFileName=['image_' num2str(index(1,category+1),'%05d') '.jpg'];      
        strPath=['DataTrain\' num2str(category) '\' strFileName];
        imwrite(img2D,strPath);
        index(1,category+1)=index(1,category+1)+1;
    end
end