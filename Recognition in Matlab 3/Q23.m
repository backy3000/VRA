function Q23()
    imgI=imread('cameraman.jpg');
    arrPointI=detectSURFFeatures(imgI);
    [arrFeatureI,arrValidPointI]=extractFeatures(imgI,arrPointI);
    
    imgJ=imread('cameraman30.jpg');
    arrPointJ=detectSURFFeatures(imgJ);
    [arrFeatureJ,arrValidPointJ]=extractFeatures(imgJ,arrPointJ);

    arrIndexPair=matchFeatures(arrFeatureI,arrFeatureJ);
    arrMatchedPointI=arrValidPointI(arrIndexPair(:,1),:);
    arrMatchedPointJ=arrValidPointJ(arrIndexPair(:,2),:);
    figure;
    ax=axes;
    showMatchedFeatures(imgI,imgJ,arrMatchedPointI,arrMatchedPointJ,'Montage','Parent',ax);
    title('Candidate point matched');
    legend(ax,'Matched point I','Matched point J');
    
    figure;
    ax=axes;
    [tform,inlierMatchedPointI,inlierMatchedPointJ]=estimateGeometricTransform(arrMatchedPointI,arrMatchedPointJ,'similarity');
    
    showMatchedFeatures(imgI,imgJ,inlierMatchedPointI,inlierMatchedPointJ,'Montage','Parent',ax);
    title('Matched inlier points');
    legend(ax,'Matched point I','Matched point J');
end