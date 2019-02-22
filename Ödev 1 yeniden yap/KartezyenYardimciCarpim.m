clc;
clear all;
x=[0,1,2,3,4,5];
muAx=[0,0,1,0.5,0,0];
a=10;b=11;c=12;d=13;e=14;f=15;
y=[a,b,c,d,e,f];
muBy=[0,0,0,0.5,1,1];
for ii=1:6
    for jj=1:6
        KARycrpm(ii,jj)=max(muAx(ii),muBy(jj));
    end
end
for ii=1:6
    for jj=1:6
        fprintf('KARcrpm[%i,%i] => %i\n',ii,jj,KARycrpm(ii,jj));
    end
    fprintf('\n');
end
mesh(KARycrpm)
xlabel('y');
ylabel('x');
zlabel('Kartezyen Yardýmcý Çarpým');
title('Kartezyen Yardýmcý Çarpým Sonucu - 3 Boyutlu ÜF');
