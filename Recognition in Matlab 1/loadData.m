function [img,lbl]=loadData(sData,sLbl)
    img=loadMNISTImages(sData);    
    lbl=loadMNISTLabels(sLbl);
end