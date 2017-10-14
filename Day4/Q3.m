function Q3()
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    m=zeros(10,2);
    for i=1:10
        m(i,1)=i-1;
    end
    for i=1:size(lblTrainAll,1)
        k=lblTrainAll(i);
        m(k+1,2)=m(k+1,2)+1;
        i=i+1;
    end
    disp(table(m));
    writetable(table(m),'Q3.csv','Delimiter',',','QuoteStrings',true);    
end