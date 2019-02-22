clc;
clear all;
%%
NN = -5:0.1:0;
MuANN = zmf(NN,[-5 -3]);
figure(1);
plot(NN,MuANN);
xlabel('zmf, P = [-5 -3]');
ylim([-0.05 1.05]);
title('NN Zmf Fonksiyonu');
%%
N = -5:0.1:1;
MuBN = trapmf(N,[-5 -3 -2 0]);
figure(2);
plot(N,MuBN);
xlabel('trapmf, P = [-5 -3 -2 0]');
ylim([-0.05 1.05]);
title('N Yamuk Fonksiyonu');
%%
SFR = -2:0.1:2;
MuCSFR = gaussmf(SFR,[-1 0]);
figure(3);
plot(SFR,MuCSFR);
xlabel('gaussmf, P=[-1 0]');
xlim([-2.05 2.05]);
title('SFR Gauss Fonksiyonu');
%%
P = 0.5:0.1:4.5;
MuDP = trimf(P,[0.5 2.5 4.5]);
figure(4);
plot(P,MuDP);
xlabel('trimf, P = [0.5 2.5 4.5]');
ylim([-0.05 1.05]);
title('P Üçgen Fonksiyonu');
%%
PP = 3:0.1:5;
MuEPP = smf(PP,[3 5]);
figure(5);
plot(PP,MuEPP);
xlabel('smf, P = [3 5]');
ylim([-0.05 1.05]);
title('PP Smf Fonksiyonu');
%%
n = -1:0.1:1;
MuAn = zmf(n,[-0.4 0.4]);
figure(6);
plot(n,MuAn);
xlabel('zmf, P = [-0.4 0.4]');
ylim([-0.05 1.05]);
title('n Zmf Fonksiyonu');
%%
s = -0.6:0.01:0.6;
MuBs = gaussmf(s,[-0.2 0]);
figure(7);
plot(s,MuBs);
xlabel('gaussmf, P=[-0.2 0]');
xlim([-0.65 0.65]);
title('s Gauss Fonksiyonu');
%%
p = 0:0.1:1;
MuCp = trimf(p,[0 1 1]);
figure(8);
plot(p,MuCp);
xlabel('trimf, P = [0 1 1]');
ylim([-0.05 1.05]);
title('p Üçgen Fonksiyonu');
%%
CK = 0:0.1:2;
MuACK = zmf(CK,[1 2]);
figure(9);
plot(CK,MuACK);
xlabel('zmf, P = [1 2]');
ylim([-0.05 1.05]);
title('CK Zmf Fonksiyonu');
%%
K = 0:0.1:5;
MuBK = trapmf(K,[1 2 3 4]);
figure(10);
plot(K,MuBK);
xlabel('trapmf, P = [1 2 3 4]');
ylim([-0.05 1.05]);
title('K Yamuk Fonksiyonu');
%%
O = 2:0.1:8;
MuCO = trimf(O,[3 5 7]);
figure(11);
plot(O,MuCO);
xlabel('trimf, P = [3 5 7]');
ylim([-0.05 1.05]);
title('O Üçgen Fonksiyonu');
%%
B = 4:0.01:9;
MuDB = gaussmf(B,[5 6.5]);
figure(12);
plot(B,MuDB);
xlabel('gaussmf, P=[5 6.5]');
xlim([3.95 9.05]);
title('B Gauss Fonksiyonu');
%%
CB = 6:0.1:10;
MuECB = smf(CB,[7 9]);
figure(13);
plot(CB,MuECB);
xlabel('smf, P = [7 9]');
ylim([-0.05 1.05]);
title('CB Smf Fonksiyonu');
%%
%%[X,Y] = meshgrid(-5:.1:5);
%%Z=MuANN;
%%figure(14);
%%s = surf(X,Y,Z,MuBN,MuCSFR);