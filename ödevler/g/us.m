function [sonuc,adim]=us(taban,u)
 sonuc =1;
 adim=0;
 for i=1:u
     sonuc=sonuc*taban;
     adim=adim+1;
 end
end