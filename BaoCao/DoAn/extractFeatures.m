function [features,features_per_image,files]=extractFeatures(datasetDir)

    %Neu rut trich dac trung chua duoc luu tren dia cung
    if ~exist('oxford\feat\feature.bin', 'file')
        fprintf('Computing SIFT features\n');    
        %Mang luu dac trung toan bo anh
        features = zeros(128, 0);
        nfeat = 0;
        files = dir(fullfile(datasetDir, '*.jpg'));
        nfiles = length(files);
        %Mang luu so luong dac trung cua moi anh
        features_per_image = zeros(1,nfiles);
        for i=1:nfiles
            fprintf('Extracting features %d/%d\n', i, nfiles);
            imgPath = strcat(datasetDir, files(i).name);
            I = im2single(rgb2gray(imread(imgPath)));
            I = imresize(I, 0.6);
            %Lay dac trung cua anh thu I voi phuong phap SIFT
            [frame, sift] = vl_covdet(I, 'method', 'Hessian', 'estimateAffineShape', true);
            %Tao so cot mang dac trung = so cot dac trung rut trich duoc tu
            %anh I, moi lan lap tao them so cot tuong ung
            features = [features zeros(128,size(sift,2))];
            %Lay so cot features range[vi tri ke tiep,vi tri ke tiep+size cot cua
            %anh I] gan=sift
            features(:,nfeat+1:(size(sift,2)+nfeat)) = sift;
            nfeat = nfeat+size(sift,2);  
            features_per_image(i) = size(sift, 2);

        end
        fid = fopen('oxford\feat\feature.bin', 'w');
        fwrite(fid, features, 'float');
        fclose(fid);

        save('oxford\feat\feat_info.mat', 'features_per_image', 'files');
    else
        %Neu dac trung da duoc luu tren dia cung thi lay du lieu ra
        fprintf('Loading SIFT features\n');
        file = dir('oxford\feat\feature.bin');
        fid = fopen('oxford\feat\feature.bin', 'r');
        features = fread(fid, [128, file.bytes/(4*128)], 'float');
        fclose(fid);  
        load('oxford\feat\feat_info.mat');
    end
end