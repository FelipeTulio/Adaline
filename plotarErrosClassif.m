function plotarErrosClassif( vetordeErrosClassif )
%PLOTARERROS Summary of this function goes here
%   Detailed explanation goes here

% Evolução do erro quadrático de classificação por época
figure
plot(vetordeErrosClassif, '^-')
grid on
xlabel('Época')
ylabel('Erro Quadrático de Classificação')
title('Erro Quadrático de Classificação acumulado por Época de Treinamento')
end

