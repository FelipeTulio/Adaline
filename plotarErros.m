function plotarErros( vetordeErrosLineares )
%PLOTARERROS Summary of this function goes here
%   Detailed explanation goes here

% Evolu��o do erro quadr�tico linear por �poca
figure
plot(vetordeErrosLineares, '^-')
grid on
xlabel('�poca')
ylabel('Erro Quadr�tico Linear')
title('Erro Quadr�tico linear acumulado por �poca de Treinamento')
end

