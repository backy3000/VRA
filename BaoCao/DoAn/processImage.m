function [ids dists ImgQuery verbose files]=processImage(x,ImgQuery)
    %% init parameter
    addpath('AKM');
    run('vlfeat\toolbox\vl_setup.m');
    datasetDir = 'oxford\images\';
    num_words = 1000;
    num_iterations = 5;
    num_trees = 8;
    dim = 128;
    if_weight = 'tfidf';
    if_norm = 'l1';
    if_dist = 'l1';
    verbose=1;
    %% Compute SIFT features
    [features,features_per_image,files]=extractFeatures(datasetDir);
    fprintf('Computing rootSIFT features\n');
    num_features = size(features, 2);
    %% Run AKM to build dictionary
    fprintf('Building the dictionary\n');
    num_images = length(files);
    dict_params =  {num_iterations, 'kdt', num_trees};
    %% build the dictionary
    [dict_words]=buildDictionary(features,dict_params,num_words);
    %% compute sparse frequency vector
    [words,dict]=vectorWords(features,features_per_image,dict_params,dict_words,num_images);
    %% create an inverted file for the images
    [inv_file]=createInverted(words, num_words,if_weight, if_norm);    
    %% Query images (Goi tu giao dien chuong trinh)
    [ids dists ImgQuery]=queryImage(dict_words,dict,files,inv_file, if_weight, if_norm, if_dist,verbose,x,ImgQuery);    
 
end