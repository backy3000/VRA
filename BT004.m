function Example004()
    n=input('\nNhap n: ');
    s=0;
    for i=1:n
        s=s+i;
        i=i+1;
    end  
    fprintf('tong 1-%d = %d',n,s);
end
