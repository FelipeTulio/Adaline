function plotarErrosClassif( vetordeErrosClassif )
%PLOTARERROS Summary of this function goes here
%   Detailed explanation goes here

% Evolu��o do erro quadr�tico de classifica��o por �poca
figure
plot(vetordeErrosClassif, '^-')
grid on
xlabel('�poca')
ylabel('Erro Quadr�tico de Classifica��o')
title('Erro Quadr�tico de Classifica��o acumulado por �poca de Treinamento')
end

