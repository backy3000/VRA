function Reco001_Digits()
    fprintf('\nLoad du lieu train');
    imgTrainAll=loadTImages('train-images.idx3-ubyte');    
    lblTrainAll = loadLabels('train-labels.idx1-ubyte');
    fprintf('\nLoad du lieu test');
    imgTestAll=loadImages('t10k-images.idx3-ubyte');    
    lblTestAll = loadLabels('t10k-labels.idx1-ubyte');
    fprintf('\nKet thuc.');
end
