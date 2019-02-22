clc;
clear all;
I=imread('cameraman.tif');
imshow(I);
[m,n]=size(I);
I=im2double(I);
c1=2;c2=0.5;c3=4;
for i=1:m
    for j=1:n
        I2(i,j)=c1*log(1+I(i,j));
        I3(i,j)=c2*log(1+I(i,j));
        I4(i,j)=c3*log(1+I(i,j));
    end
end
subplot(2,2,1);
imshow(I);title('Cameraman');
subplot(2,2,2);
imshow(I2);title('log c=2');
subplot(2,2,3);
imshow(I3);title('log c=0.5');
subplot(2,2,4);
imshow(I4);title('log c=4');
%% Döngü olmadan
I=imread('cameraman.tif');
imshow(I);
[m,n]=size(I);
I=im2double(I);
c1=2;c2=0.5;c3=4;
I2=c1*log(1+I);
I3=c2*log(1+I);
I4=c3*log(1+I);
subplot(2,2,1);
imshow(I);title('Cameraman');
subplot(2,2,2);
imshow(I2);title('log c=2');
subplot(2,2,3);
imshow(I3);title('log c=0.5');
subplot(2,2,4);
imshow(I4);title('log c=4');