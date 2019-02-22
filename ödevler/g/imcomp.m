clc;clear all;
I=imread('pirate.tif');
imshow(I);
I2=imcomplement(I);
figure;imshow(I2)