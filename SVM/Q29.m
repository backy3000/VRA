function Q29()    
    rootFolder=fullfile('BagOfWords\DataTrain');   
    categories={'0','1'};
    imdsDataTrain=imageDatastore(fullfile(rootFolder,categories),'LabelSource','foldernames');
    imdsDataTrain.ReadFcn=@(filename)readAndPreprocessImage(filename);    
    net=alexnet();
    featureLayer='fc7';
    FeaturesDataTrain=activations(net,imdsDataTrain,featureLayer,'MiniBatchSize',32,'OutputAs','columns');
    lblDataTrain=imdsDataTrain.Labels;
    classifier=fitcecoc(FeaturesDataTrain,lblDataTrain,'Leaner','Linear','Coding','Onevsall','ObservationsIn','columns');    
    rootFolder=fullfile('BagOfWords\DataTest');   
    categories={'0','1'};
    imdsDataTest=imageDatastore(fullfile(rootFolder,categories),'LabelSource','foldernames');
    imdsDataTest.ReadFcn=@(filename)readAndPreprocessImage(filename);    
    net=alexnet();
    featureLayer='fc7';
    FeaturesDataTest=activations(net,imdsDataTest,featureLayer,'MiniBatchSize',32,'OutputAs','columns');
    lblDataTest=imdsDataTest.Labels;    
    lblResult=predict(classifier,FeaturesDataTest');    
    nResult=(lblResult==lblDataTest);    
    nCount=sum(nResult);
    fprintf("So luong mau da dung : %d",nCount);
end