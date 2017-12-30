function Q20()
    imgI=imread('cameraman.jpg');
    arrPointI=detectHarrisFeatures(imgI);
    [arrFeatureI,arrValidPointI]=extractFeatures(imgI,arrPointI);
    figure;
    imshow(imgI);
    hold on;
    arrSubValidPointI=arrValidPointI.selectStrongest(20);
    plot(arrSubValidPointI);                
end