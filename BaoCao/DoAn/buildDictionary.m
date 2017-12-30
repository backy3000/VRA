function [dict_words]=buildDictionary(features,dict_params,num_words)
    % build the dictionary
    if exist('oxford\feat\dict.mat', 'file')
        load('oxford\feat\dict.mat');
    else
        randIndex = randperm(size(features,2));
        dict_words = ccvBowGetDict(features(:,randIndex(1:100)), [], [], num_words, 'flat', 'akmeans', ...
            [], dict_params);
        save('oxford\feat\dict.mat', 'dict_words');
    end
end