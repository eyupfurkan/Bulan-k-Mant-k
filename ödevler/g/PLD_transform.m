clc;
clear all;
I=imread('cameraman.tif');
% imshow(I);
%% Parlaklýk
I1=I-50; %azaltma
I2=I+50; %artýrma
figure;
subplot(1,3,1);imshow(I);title('Orjinal');
subplot(1,3,2);imshow(I1);title('-50');
subplot(1,3,3);imshow(I2);title('+50');
%% Karþýtlýk
I3=I*0.5; %azaltma
I4=I*2; %artýrma
figure;
subplot(1,3,1);imshow(I);title('Orjinal');
subplot(1,3,2);imshow(I3);title('*0.5');
subplot(1,3,3);imshow(I4);title('*2');
