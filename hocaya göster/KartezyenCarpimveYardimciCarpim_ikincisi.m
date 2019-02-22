clc;
clear all;
x=[0,1,2,3,4,5];
muAx=[0,0,1,0.5,0,0];
y=[10,11,12,13,14,15];
muBy=[0,0,0,0.5,1,1];
x_sonuc=x.*muAx;
y_sonuc=y.*muBy;
KARcrpm=min(x_sonuc,y_sonuc);
KARycrpm=max(x_sonuc,y_sonuc);
disp(['Kartezyen Carpim Sonucu: ',num2str(x_sonuc)]);
disp(['Kartezyen Yardimci Carpim Sonucu: ',num2str(y_sonuc)]);
a=x;
s=y;
d=KARcrpm;
m=KARycrpm;
figure(1)
plot3(a,s,d);
xlabel('x');ylabel('y');zlabel('KARcrpm');
grid;
title('Kartezyen Çarpým Sonucu - 3 Boyutlu ÜF');
figure(2)
plot3(a,s,m);
xlabel('x');ylabel('y');zlabel('KARycrpm');
grid;
title('Kartezyen Yardýmcý Çarpým Sonucu - 3 Boyutlu ÜF');