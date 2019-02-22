clc;
clear all;
I=imread('pout.tif');
imshow(I);
[m,n]=size(I);
for i=1:m
    for j=1:n
        if (I(i,j)>=50 & I(i,j)<=120)
            I(i,j)=0;
        else
            continue;
        end
    end
end
figure;imshow(I);