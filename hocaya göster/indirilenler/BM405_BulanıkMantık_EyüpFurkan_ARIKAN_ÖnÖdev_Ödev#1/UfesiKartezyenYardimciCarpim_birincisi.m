clc;
clear all;
x=[0,1,2,3,4,5];
muAx=[0,0,1,0.5,0,0];
y=[10,11,12,13,14,15];
muBy=[0,0,0,0.5,1,1];
for ii=1:6
    for jj=1:6
        if x(ii)*muAx(ii) > y(jj)*muBy(jj)
            KARycrpm(ii,jj) = x(ii)*muAx(ii);
        else
            KARycrpm(ii,jj) = y(jj)*muBy(jj);
        end
    end
end
for ii=1:6
    for jj=1:6
        fprintf('KARycrpm[%i,%i] => %i\n',ii,jj,KARycrpm(ii,jj));
    end
    fprintf('\n');
end
t=x;
k=y;
m=KARycrpm;
plot3(t,k,m);
xlabel('x');
ylabel('y');
zlabel('Kartezyen Yardýmcý Çarpým');
grid;
title('Kartezyen Yardýmcý Çarpým Sonucu - 3 Boyutlu ÜF');