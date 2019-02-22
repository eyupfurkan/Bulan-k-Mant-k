%Histogram alma
clc;
clear all;
I=imread('circuit.tif');
[m,n]=size(I);
for i=1:m
    say=1;
    for j=1:m
        for k=1:n
            if (I(j,k)==I(i,k))
                say=say+1;
            end
        end
    end
    H(i,1)=i;
    H(i,2)=say;
end
bar(H);