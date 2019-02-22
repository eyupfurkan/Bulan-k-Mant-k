clc;
clear all;
I=imread('cameraman.tif');
imshow(I);
[m,n]=size(I);
for i=1:m
    for j=1:n
        I2(i,j)=255-I(i,j);
    end
end
figure;imshow(uint8(I2));
%% imcomplement
imshow(I);
I3=imcomplement(I);
figure;imshow(I3);