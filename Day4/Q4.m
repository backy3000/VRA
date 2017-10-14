function Q4()
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    m=zeros(10,2);
    for i=1:10
        m(i,1)=i-1;
    end
    for i=1:size(lblTestAll,1)
        k=lblTestAll(i);
        m(k+1,2)=m(k+1,2)+1;
        i=i+1;
    end
    disp(table(m));
    writetable(table(m),'Q4.csv','Delimiter',',','QuoteStrings',true);    
end