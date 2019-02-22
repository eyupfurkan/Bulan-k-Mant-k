clc;
clear all;

x = 0:0.1:10;
muAx = furkanmf(x,[3 7]);
%subplot(4,1,1);
figure(1);
plot(x,muAx);
xlabel('furkanmf, P = [3 7]');
ylabel('muAx');
ylim([-0.05 1.05]);
title('Z Bi�imli Sigmoidal �F');

y = 0:0.1:10;
muBy = eyupmf(x,[2 4 6]);
%subplot(4,1,2);
figure(2);
plot(y,muBy);
xlabel('eyupmf, P=[2 4 6]');
ylabel('muBy');
ylim([-0.05 1.05]);
title('�an (Genelle�tirilmi� Gauss) �F');

[X,Y]=meshgrid(x,y);

for ii=1:length(x) 
     for jj=1:length(y)
         Tnorm_Cebirsel_Carpim(ii,jj)=muAx(ii)*muBy(jj);
     end
end


for ii=1:length(x) 
     for jj=1:length(y)
         Snorm_Cebirsel_Toplam(ii,jj)=muAx(ii)+muBy(jj)-muAx(ii)*muBy(jj);
    end
end

%subplot(4,2,1);
figure(3);
mesh(X,Y,Tnorm_Cebirsel_Carpim);
xlabel('X');
ylabel('Y');
zlabel('T-norm Cebirsel �arp�m');
title('Z Bi�imli Sigmoidal �F ile �an (Genelle�tirilmi� Gauss) �F''nin T-norm Cebirsel �arp�m�');

%subplot(4,2,2);
figure(4);
mesh(X,Y,Snorm_Cebirsel_Toplam);
xlabel('X');
ylabel('Y');
zlabel('S-norm Cebirsel Toplam');
title('Z Bi�imli Sigmoidal �F ile �an (Genelle�tirilmi� Gauss) �F''nin S-norm Cebirsel Toplam�');
