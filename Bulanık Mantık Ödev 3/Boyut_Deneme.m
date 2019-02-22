clc;
clear all;
%%
x=-5:.1:5;
y=-1:.1:1;
z=0:.1:12;
[X,Y] = meshgrid(x,y);
%%
MuANN = zmf(x,[-5 -3]);
figure(1);
subplot(3,1,1);
plot(x,MuANN,'g');
%%
MuBN = trapmf(x,[-5 -3 -2 0]);
hold on,plot(x,MuBN,'b');
%%
MuCSFR = gaussmf(x,[-.6 0]);
plot(x,MuCSFR,'k');
%%
MuDP = trimf(x,[0.5 2.5 4.5]);
plot(x,MuDP,'r');
%%
MuEPP = smf(x,[3 5]);
plot(x,MuEPP,'');
xlim([-5.05 5.05]);
ylim([-0.05 1.05]);
legend('NN','N','SFR','P','PP');
%%
hold off;
subplot(3,1,2);
MuAn = trapmf(y,[-1 -1 -0.4 0.4]);
plot(y,MuAn,'g');
%%
MuBs = gaussmf(y,[-0.2 0]);
hold on,plot(y,MuBs,'b');
%%
MuCp = trimf(y,[0 1 1]);
plot(y,MuCp,'r');
xlim([-1.05 1.05]);
ylim([-0.05 1.05]);
legend('n','s','p');
%%
hold off;
subplot(3,1,3);
MuACK = zmf(z,[1 2]);
plot(z,MuACK,'g');
%%
MuBK = trapmf(z,[1 2 3 4]);
hold on,plot(z,MuBK,'b');
%%
MuCO = trimf(z,[3 5 7]);
plot(z,MuCO,'k');
%%
MuDB = gaussmf(z,[0.85 6.5]);
plot(z,MuDB,'r');
%%
MuECB = smf(z,[7 9]);
plot(z,MuECB,'');
xlim([-0.05 12.05]);
ylim([-0.05 1.05]);
legend('CK','K','O','B','CB');
%%
[aa,bb]=size(X);
[cc,dd]=size(Y);
for ii=1:aa
     for jj=1:bb
         %Aktiflik Dereceleri
        w1=min(zmf(X(ii,jj),[-5 -3]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuANN,MuAn
        w2=min(zmf(X(ii,jj),[-5 -3]),gaussmf(Y(ii,jj),[-0.2 0]));%MuANN,MuBs
        w3=min(zmf(X(ii,jj),[-5 -3]),trimf(Y(ii,jj),[0 1 1]));%MuANN,MuCp
        
        w4=min(trapmf(X(ii,jj),[-5 -3 -2 0]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuBN,MuAn
        w5=min(trapmf(X(ii,jj),[-5 -3 -2 0]),gaussmf(Y(ii,jj),[-0.2 0]));%MuBN,MuBs
        w6=min(trapmf(X(ii,jj),[-5 -3 -2 0]),trimf(Y(ii,jj),[0 1 1]));%MuBN,MuCp
        
        w7=min(gaussmf(X(ii,jj),[-.6 0]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuCSFR,MuAn
        w8=min(gaussmf(X(ii,jj),[-.6 0]),gaussmf(Y(ii,jj),[-0.2 0]));%MuCSFR,MuBs
        w9=min(gaussmf(X(ii,jj),[-.6 0]),trimf(Y(ii,jj),[0 1 1]));%MuCSFR,MuCp
        
        w10=min(trimf(X(ii,jj),[0.5 2.5 4.5]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuDP,MuAn
        w11=min(trimf(X(ii,jj),[0.5 2.5 4.5]),gaussmf(Y(ii,jj),[-0.2 0]));%MuDP,MuBs
        w12=min(trimf(X(ii,jj),[0.5 2.5 4.5]),trimf(Y(ii,jj),[0 1 1]));%MuDP,MuCp
        
        w13=min(smf(X(ii,jj),[3 5]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuEPP,MuAn
        w14=min(smf(X(ii,jj),[3 5]),gaussmf(Y(ii,jj),[-0.2 0]));%MuEPP,MuBs
        w15=min(smf(X(ii,jj),[3 5]),trimf(Y(ii,jj),[0 1 1]));%MuEPP,MuCp
        %Kurallar
        CK1=min(w1,MuACK);
        CK2=min(w2,MuACK);
        K1=min(w3,MuBK);
        O1=min(w4,MuCO);
        B1=min(w5,MuDB);
        
        CK3=min(w6,MuACK);
        K2=min(w7,MuBK);
        O2=min(w8,MuCO);
        B2=min(w9,MuDB);
        CB1=min(w10,MuECB);
        
        K3=min(w11,MuBK);
        O3=min(w12,MuCO);
        B3=min(w13,MuDB);
        CB2=min(w14,MuECB);
        CB3=min(w15,MuECB);
        
        SonucUF=max(CK1,max(CK2,max(K1,max(O1,max(B1,max(CK3,max(K2,max(O2,max(B2,max(CB1,max(K3,max(O3,max(B3,max(CB2,CB3))))))))))))));
        Z(ii,jj)=(SonucUF*z')/sum(SonucUF);
    end
end
hold off,figure(2);
surf(X,Y,Z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('T-norm min ve S-norm max Mamdani Üç Boyutlu Grafiði 1');
%%
for ii=1:aa
     for jj=1:cc
         %Aktiflik Dereceleri
        w1=min(zmf(X(ii,jj),[-5 -3]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuANN,MuAn
        w2=min(zmf(X(ii,jj),[-5 -3]),gaussmf(Y(ii,jj),[-0.2 0]));%MuANN,MuBs
        w3=min(zmf(X(ii,jj),[-5 -3]),trimf(Y(ii,jj),[0 1 1]));%MuANN,MuCp
        
        w4=min(trapmf(X(ii,jj),[-5 -3 -2 0]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuBN,MuAn
        w5=min(trapmf(X(ii,jj),[-5 -3 -2 0]),gaussmf(Y(ii,jj),[-0.2 0]));%MuBN,MuBs
        w6=min(trapmf(X(ii,jj),[-5 -3 -2 0]),trimf(Y(ii,jj),[0 1 1]));%MuBN,MuCp
        
        w7=min(gaussmf(X(ii,jj),[-.6 0]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuCSFR,MuAn
        w8=min(gaussmf(X(ii,jj),[-.6 0]),gaussmf(Y(ii,jj),[-0.2 0]));%MuCSFR,MuBs
        w9=min(gaussmf(X(ii,jj),[-.6 0]),trimf(Y(ii,jj),[0 1 1]));%MuCSFR,MuCp
        
        w10=min(trimf(X(ii,jj),[0.5 2.5 4.5]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuDP,MuAn
        w11=min(trimf(X(ii,jj),[0.5 2.5 4.5]),gaussmf(Y(ii,jj),[-0.2 0]));%MuDP,MuBs
        w12=min(trimf(X(ii,jj),[0.5 2.5 4.5]),trimf(Y(ii,jj),[0 1 1]));%MuDP,MuCp
        
        w13=min(smf(X(ii,jj),[3 5]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuEPP,MuAn
        w14=min(smf(X(ii,jj),[3 5]),gaussmf(Y(ii,jj),[-0.2 0]));%MuEPP,MuBs
        w15=min(smf(X(ii,jj),[3 5]),trimf(Y(ii,jj),[0 1 1]));%MuEPP,MuCp
        %Kurallar
        CK1=min(w1,MuACK);
        CK2=min(w2,MuACK);
        K1=min(w3,MuBK);
        O1=min(w4,MuCO);
        B1=min(w5,MuDB);
        
        CK3=min(w6,MuACK);
        K2=min(w7,MuBK);
        O2=min(w8,MuCO);
        B2=min(w9,MuDB);
        CB1=min(w10,MuECB);
        
        K3=min(w11,MuBK);
        O3=min(w12,MuCO);
        B3=min(w13,MuDB);
        CB2=min(w14,MuECB);
        CB3=min(w15,MuECB);
        
        SonucUF=max(CK1,max(CK2,max(K1,max(O1,max(B1,max(CK3,max(K2,max(O2,max(B2,max(CB1,max(K3,max(O3,max(B3,max(CB2,CB3))))))))))))));
        Z(ii,jj)=(SonucUF*z')/sum(SonucUF);
    end
end
figure(3);
surf(X,Y,Z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('T-norm min ve S-norm max Mamdani Üç Boyutlu Grafiði 2');
%%
for ii=1:aa
     for jj=1:dd
         %Aktiflik Dereceleri
        w1=min(zmf(X(ii,jj),[-5 -3]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuANN,MuAn
        w2=min(zmf(X(ii,jj),[-5 -3]),gaussmf(Y(ii,jj),[-0.2 0]));%MuANN,MuBs
        w3=min(zmf(X(ii,jj),[-5 -3]),trimf(Y(ii,jj),[0 1 1]));%MuANN,MuCp
        
        w4=min(trapmf(X(ii,jj),[-5 -3 -2 0]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuBN,MuAn
        w5=min(trapmf(X(ii,jj),[-5 -3 -2 0]),gaussmf(Y(ii,jj),[-0.2 0]));%MuBN,MuBs
        w6=min(trapmf(X(ii,jj),[-5 -3 -2 0]),trimf(Y(ii,jj),[0 1 1]));%MuBN,MuCp
        
        w7=min(gaussmf(X(ii,jj),[-.6 0]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuCSFR,MuAn
        w8=min(gaussmf(X(ii,jj),[-.6 0]),gaussmf(Y(ii,jj),[-0.2 0]));%MuCSFR,MuBs
        w9=min(gaussmf(X(ii,jj),[-.6 0]),trimf(Y(ii,jj),[0 1 1]));%MuCSFR,MuCp
        
        w10=min(trimf(X(ii,jj),[0.5 2.5 4.5]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuDP,MuAn
        w11=min(trimf(X(ii,jj),[0.5 2.5 4.5]),gaussmf(Y(ii,jj),[-0.2 0]));%MuDP,MuBs
        w12=min(trimf(X(ii,jj),[0.5 2.5 4.5]),trimf(Y(ii,jj),[0 1 1]));%MuDP,MuCp
        
        w13=min(smf(X(ii,jj),[3 5]),trapmf(Y(ii,jj),[-1 -1 -0.4 0.4]));%MuEPP,MuAn
        w14=min(smf(X(ii,jj),[3 5]),gaussmf(Y(ii,jj),[-0.2 0]));%MuEPP,MuBs
        w15=min(smf(X(ii,jj),[3 5]),trimf(Y(ii,jj),[0 1 1]));%MuEPP,MuCp
        %Kurallar
        CK1=min(w1,MuACK);
        CK2=min(w2,MuACK);
        K1=min(w3,MuBK);
        O1=min(w4,MuCO);
        B1=min(w5,MuDB);
        
        CK3=min(w6,MuACK);
        K2=min(w7,MuBK);
        O2=min(w8,MuCO);
        B2=min(w9,MuDB);
        CB1=min(w10,MuECB);
        
        K3=min(w11,MuBK);
        O3=min(w12,MuCO);
        B3=min(w13,MuDB);
        CB2=min(w14,MuECB);
        CB3=min(w15,MuECB);
        
        SonucUF=max(CK1,max(CK2,max(K1,max(O1,max(B1,max(CK3,max(K2,max(O2,max(B2,max(CB1,max(K3,max(O3,max(B3,max(CB2,CB3))))))))))))));
        Z(ii,jj)=(SonucUF*z')/sum(SonucUF);
    end
end
figure(4);
surf(X,Y,Z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('T-norm min ve S-norm max Mamdani Üç Boyutlu Grafiði 3');
        