function [inv_file]=createInverted(words, num_words,if_weight, if_norm)
    fprintf('Creating and searching an inverted file\n');
    inv_file = ccvInvFileInsert([], words, num_words);
    ccvInvFileCompStats(inv_file, if_weight, if_norm);
end