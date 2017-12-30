function [ids dists ImgQuery]=queryImage(dict_words,dict,files,inv_file, if_weight, if_norm, if_dist,verbose,x,ImgQuery)
    %% Query images
    ntop = 0;    
    % compute rootSIFT features
    [frame, sift] = vl_covdet(ImgQuery, 'method', 'Hessian', 'estimateAffineShape', true);
    %Lay ra nhung dac trung trong vung phu
    sift = sift(:,(frame(1,:)<=x(2)) &  (frame(1,:) >= x(1)) & (frame(2,:) <= x(4)) & (frame(2,:) >= x(3)));

    % Test on every image        
    q_words = cell(1,1);        
    q_words{1} = ccvBowGetWords(dict_words, double(sift), [], dict);
    [ids dists] = ccvInvFileSearch(inv_file, q_words(1), if_weight, if_norm, if_dist, ntop);
end