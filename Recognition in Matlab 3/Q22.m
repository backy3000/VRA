function Q22()
    imgI=imread('cameraman.jpg');
    arrPointI=detectHarrisFeatures(imgI);
    [arrFeatureI,arrValidPointI]=extractFeatures(imgI,arrPointI);
    
    imgJ=imread('cameraman30.jpg');
    arrPointJ=detectHarrisFeatures(imgJ);
    [arrFeatureJ,arrValidPointJ]=extractFeatures(imgJ,arrPointJ);

    arrIndexPair=matchFeatures(arrFeatureI,arrFeatureJ);
    arrMatchedPointI=arrValidPointI(arrIndexPair(:,1),:);
    arrMatchedPointJ=arrValidPointJ(arrIndexPair(:,2),:);
    figure;
    ax=axes;
    showMatchedFeatures(imgI,imgJ,arrMatchedPointI,arrMatchedPointJ,'Montage','Parent',ax);
    title('Candidate point matched');
    legend(ax,'Matched point I','Matched point J');
end