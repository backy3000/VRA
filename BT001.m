function Example001()
    a=rand();
    fprintf('\nSo ngau nhien trong khoang [0-1], cach le 8 & lay 3 chu so thap phan ben phai:[%8.3f]',a);
    r=randi([1 10]);
    fprintf('\nSo ngau nhien trong khoang [1 10]: [%d]',r);
    rArray=randi([-10 10],1,10);
    fprintf('\nsize :%d',size(rArray));
    fprintf('\nMang 1 dong 10 cot co gia tri trong khoang [-10 10],\nchen 1 khoang trang vao truoc neu gia tri chi co 1 chu so: ');
    fprintf('[%d]',rArray);
end














