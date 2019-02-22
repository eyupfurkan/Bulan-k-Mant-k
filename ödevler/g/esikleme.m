clc;
clear all;
I=imread('cameraman.tif');
imshow(I);
%% grayscale to binary transform
I2=im2bw(I);
figure;imshow(I2);
%% manuel eþikleme
[m,n]=size(I);
for i=1:m
    for j=1:n
        if I(i,j)>50
            I3(i,j)=255;
            %I3(i,j)=1;
        else
            I3(i,j)=0;
        end
    end
end
% I3=imcomplement(I3);
figure;imshow(I3);
%% Otsu' Segmentation
thres=graythresh(I);%global-ortalama eþik deðeri
I4=im2bw(I,thres);
figure;imshow(I4);