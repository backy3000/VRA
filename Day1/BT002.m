
function Example002()
    m=input('\nNhap m: ');
    n=input('\nNhap n: ');
    a=ones(m,n);
    b=zeros(m,n);
    c=eye(m,n);
    d=randi([-10 10],m,n);
    a(1,1)=5;
    e=size(a);
    fprintf('a :\n');
    disp(a);    
    fprintf('b :\n');
    disp(b);    
    fprintf('c :\n');
    disp(c);    
    fprintf('d :\n');
    disp(d);    
    fprintf('e :\n');
    disp(e);    
end