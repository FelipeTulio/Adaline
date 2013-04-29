function plotarErros( vetordeErrosLineares )
%PLOTARERROS Summary of this function goes here
%   Detailed explanation goes here

% Evolução do erro quadrático linear por época
figure
plot(vetordeErrosLineares, '^-')
grid on
xlabel('Época')
ylabel('Erro Quadrático Linear')
title('Erro Quadrático linear acumulado por Época de Treinamento')
end

