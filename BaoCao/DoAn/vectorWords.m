function [words,dict]=vectorWords(features,features_per_image,dict_params,dict_words,num_images)
    % compute sparse frequency vector
    fprintf('Computing the words\n');
    dict = ccvBowGetWordsInit(dict_words, 'flat', 'akmeans', [], dict_params);

    if exist('oxford\feat\words.mat', 'file')
        load('oxford\feat\words.mat');
    else
        words = cell(1, num_images);
        disp(words);
        for i=1:num_images
            fprintf('Quantizing %d/%d images\n', i, num_images);
            if i==1
                bIndex = 1;
            else
                bIndex = sum(features_per_image(1:i-1))+1;
            end
            eIndex = bIndex + features_per_image(i)-1;
            words{i} = ccvBowGetWords(dict_words, features(:, bIndex:eIndex), [], dict);
        end;
        save('oxford\feat\words.mat', 'words');
    end
end