function Q7(n)
    m=zeros(length(n),2);
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');    
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    
    mdl=fitcknn(imgTrainAll',lblTrainAll);
    
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');    
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    for i=1:length(n)
        m(i,1)=n(i);
        for j=1:size(lblTestAll,1)
            k=lblTestAll(j);
            if(k==n(i))
                imgTest=imgTestAll(:,j);
                lblPredict=predict(mdl,imgTest');
                if(num2str(lblPredict)~=num2str(k))
                    m(i,2)=m(i,2)+1;
                end
            end
            j=j+1;
        end
        i=i+1;
    end
    disp(m);
    writetable(table(m),'Q7.csv','Delimiter',',','QuoteStrings',true);   
end