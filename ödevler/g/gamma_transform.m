%%inv_log trf
clc;
clear all;
I=imread('cameraman.tif');
imshow(I);
[m,n]=size(I);
I=im2double(I);
c=4;
g1=.01;g2=0.5;g3=10;
for i=1:m
    for j=1:n
        I2(i,j)=c*(I(i,j).^g1);
        I3(i,j)=c*(I(i,j).^g2);
        I4(i,j)=c*(I(i,j).^g3);
    end
end
subplot(2,2,1);
imshow(I);title('Cameraman');
subplot(2,2,2);
imshow(I2);title('log a=.01');
subplot(2,2,3);
imshow(I3);title('log a=.5');
subplot(2,2,4);
imshow(I4);title('log a=10');
%% Döngü olmadan
I=imread('cameraman.tif');
imshow(I);
[m,n]=size(I);
I=im2double(I);
c=4;
g1=.01;g2=1;g3=10;
        I2=c*(I.^g1);
        I3=c*(I.^g2);
        I4=c*(I.^g3);
subplot(2,2,1);
imshow(I);title('Cameraman');
subplot(2,2,2);
imshow(I2);title('log c=.01');
subplot(2,2,3);
imshow(I3);title('log c=1');
subplot(2,2,4);
imshow(I4);title('log c=10');