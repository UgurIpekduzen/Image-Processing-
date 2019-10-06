img = double(imread('ugur.jpg'));
h1 = [1 -1 ;1 -1; 1 -1];
h2 = [1 1 1; -1 -1 -1];
H = h2;
[k1,k2]=size(H);
[m1,m2]=size(img);

row = m1+k1-1;
col = m2+k2-1;

for i=1 : row
    for j=1 : col
        toplam=0;
        for jj=1 :m2
            for ii=1:m1
                if(((i+1)-ii)>0 && ((i+1)-ii<=k1))
                    if(((j+1)-jj)>0 && ((j+1)-jj)<=k2)
                        toplam = toplam + img(ii,jj)*H(((i+1)-ii),((j+1)-jj));
                    end
                end
            end
        end
        Y(i,j)=toplam;
    end  
end
imshow(uint8(Y));