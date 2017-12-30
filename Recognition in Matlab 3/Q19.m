function Q19()
    imgI=imread('cameraman.jpg');
    arrPointI=detectSURFFeatures(imgI);
    [arrFeatureI,arrValidPointI]=extractFeatures(imgI,arrPointI);
    figure;
    imshow(imgI);
    hold on;
    arrSubValidPointI=arrValidPointI.selectStrongest(20);
    plot(arrSubValidPointI);                
end