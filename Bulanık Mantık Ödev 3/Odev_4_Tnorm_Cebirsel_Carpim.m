clc;
clear all;
%%
x=-4:.1:4;
y=-5:.1:5;
[X,Y] = meshgrid(x,y);
%%
MuAK = zmf(x,[-0.5 -3]);
figure(1);
subplot(2,1,1);
plot(x,MuAK,'g');
%%
MuAO = gaussmf(x,[2 0]);
hold on,plot(x,MuAO,'b');
%%
MuAB = smf(x,[0.5 3]);
plot(x,MuAB,'k');
xlim([-4.05 4.05]);
ylim([-0.05 1.05]);
legend('K','O','B');
xlabel('x');
ylabel('Mü(x)');
title('Mü(x) Üf - 1. Giriþ Üf''sinin Ýlk Hali');
%%
hold off;
subplot(2,1,2);
MuBN = zmf(y,[-1/8 -4]);
subplot(2,1,2);
plot(y,MuBN,'g');
%%
MuBZ = gaussmf(y,[1 0]);
hold on,plot(y,MuBZ,'b');
%%
MuBP = smf(y,[1/8 4]);
plot(y,MuBP,'k');
xlim([-5.05 5.05]);
ylim([-.05 1.05]);
legend('N','Z','P');
xlabel('y');
ylabel('Mü(y)');
title('Mü(y) Üf - 2. Giriþ Üf''sinin Ýlk Hali');
%%
%[cc,dd]=size(X);
[aa,bb]=size(Y);
for ii=1:aa
    for jj=1:bb
        %xk=A(ii,jj);
        %yk=B(ii,jj);
        %Aktiflik Dereceleri
        w1=zmf(X(ii,jj),[-0.5 -3])*zmf(Y(ii,jj),[-1/8 -4]);%MuAK,MuBN
        w2=zmf(X(ii,jj),[-0.5 -3])*gaussmf(Y(ii,jj),[1 0]);%MuAK,MuBZ
        w3=zmf(X(ii,jj),[-0.5 -3])*smf(Y(ii,jj),[1/8 4]);%MuAK,MuBP
        
        w4=gaussmf(X(ii,jj),[2 0])*zmf(Y(ii,jj),[-1/8 -4]);%MuAO,MuBN
        w5=gaussmf(X(ii,jj),[2 0])*gaussmf(Y(ii,jj),[1 0]);%MuAO,MuBZ
        w6=gaussmf(X(ii,jj),[2 0])*smf(Y(ii,jj),[1/8 4]);%MuAO,MuBP
        
        w7=smf(X(ii,jj),[0.5 3])*zmf(Y(ii,jj),[-1/8 -4]);%MuAB,MuBN
        w8=smf(X(ii,jj),[0.5 3])*gaussmf(Y(ii,jj),[1 0]);%MuAB,MuBZ
        w9=smf(X(ii,jj),[0.5 3])*smf(Y(ii,jj),[1/8 4]);%MuAB,MuBP
        %Kurallar
        z1=-X(ii,jj)+Y(ii,jj)+1;
        z2=2*X(ii,jj)-Y(ii,jj)+3;
        z3=-X(ii,jj)+2*Y(ii,jj)-3;
        
        z4=X(ii,jj)+Y(ii,jj)+2;
        z5=-X(ii,jj)-Y(ii,jj)-2;
        z6=-6*Y(ii,jj);
        
        z7=7*X(ii,jj)-0.5;
        z8=8*X(ii,jj);
        z9=1.8;
        
        Z(ii,jj)=(w1*z1+w2*z2+w3*z3+w4*z4+w5*z5+w6*z6+w7*z7+w8*z8+w9*z9)/(w1+w2+w3+w4+w5+w6+w7+w8+w9);
    end
end
hold off,figure(2);
surf(X,Y,Z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('T-norm Cebirsel Çarpým ile Takagi - Sugeno - Kang Üç Boyutlu Grafiði');
        
        
        