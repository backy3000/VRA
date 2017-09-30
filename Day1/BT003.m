function Example003()
    n=input('\nNhap n: ');
    s=0;
    i=1;
    while i<=n
        s=s+i;
        i=i+1;
    end  
    fprintf('tong 1-%d = %d',n,s);
end