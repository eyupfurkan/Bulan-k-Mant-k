function y = eyupmf(x, parametreler)
if nargin ~= 2
    error('Genel arg�man MF taraf�ndan iki arg�man gereklidir.');
elseif length(parametreler) < 3
    error('Genelle�tirilmi� �an MF en az �� parametreye ihtiya� duyar.');
elseif parametreler(1) == 0,
    error('Gbellmf de ge�ersiz parametre () --> a == 0');
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
