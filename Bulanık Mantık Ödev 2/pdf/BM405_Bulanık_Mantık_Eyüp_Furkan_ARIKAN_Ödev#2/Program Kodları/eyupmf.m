function y = eyupmf(x, parametreler)
if nargin ~= 2
    error('Genel argüman MF tarafýndan iki argüman gereklidir.');
elseif length(parametreler) < 3
    error('Genelleþtirilmiþ çan MF en az üç parametreye ihtiyaç duyar.');
elseif parametreler(1) == 0,
    error('Gbellmf de geçersiz parametre () --> a == 0');
end

a = parametreler(1); b = parametreler(2); c = parametreler(3);

tmp = ((x - c)/a).^2;
if (tmp == 0 & b == 0)
    y = 0.5;
elseif (tmp == 0 & b < 0)
    y = 0;
else
    tmp = tmp.^b;
    y = 1./(1 + tmp);
end
