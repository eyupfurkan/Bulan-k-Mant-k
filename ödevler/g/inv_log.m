%%inv_log trf
clc;
clear all;
I=imread('cameraman.tif');
imshow(I);
[m,n]=size(I);
I=im2double(I);
c=4;
a1=0.1;a2=.8;a3=9;
for i=1:m
    for j=1:n
        I2(i,j)=c*((1+a1).^I(i,j)-1);
        I3(i,j)=c*((1+a2).^I(i,j)-1);
        I4(i,j)=c*((1+a3).^I(i,j)-1);
    end
end
subplot(2,2,1);
imshow(I);title('Cameraman');
subplot(2,2,2);
imshow(I2);title('log a=.1');
subplot(2,2,3);
imshow(I3);title('log a=.8');
subplot(2,2,4);
imshow(I4);title('log a=.9');
%% Döngü olmadan
I=imread('cameraman.tif');
imshow(I);
[m,n]=size(I);
I=im2double(I);
c=4;
a1=0.1;a2=.8;a3=9;
I2=c*((1+a1).^I-1);
I3=c*((1+a2).^I-1);
I4=c*((1+a3).^I-1);
subplot(2,2,1);
imshow(I);title('Cameraman');
subplot(2,2,2);
imshow(I2);title('log c=.1');
subplot(2,2,3);
imshow(I3);title('log c=.8');
subplot(2,2,4);
imshow(I4);title('log c=.9');