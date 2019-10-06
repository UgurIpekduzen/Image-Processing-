x=[5 8 -2;6 -5 7;1 -3 2];
h=[4 1;-1 0];
[k1,k2] = size(h);
[n1,n2] = size(x);

cs2d = conv2(x,h)

row = n1+k1-1;
col = n2+k2-1;
sonuc = 0;
for z=1 : row
    for w=1 : col
        toplam = 0;
        for s=1 :n2
            for t=1:n1
                if(((z+1)-t)>0 && ((z+1)-t<=k1))
                    if(((w+1)-s)>0 && ((w+1)-s)<=k2)
                    cevap=x(t,s)*h(((z+1)-t),((w+1)-s));
                    sonuc=sonuc+cevap;
                    end
                end
            end
        end
        A(z,w)=sonuc;
    end  
end