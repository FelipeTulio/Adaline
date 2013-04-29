function [ Yteste ] = yteste( W )
%YTESTE Summary of this function goes here
%   Detailed explanation goes here

    load DadosTeste.txt;
    Dados = DadosTeste';
    numPadroes = size(Dados,2);

        %Polarização da matriz X (inserção do bias)
        pol = +1 * ones(1,numPadroes);
        XValidacao = [pol; Dados ];

        Yteste = zeros(1,numPadroes);

        for i = 1 : numPadroes

            %executa cálculo para descobrir o valor de U
            U = W * XValidacao(:,i');

            %faz a verificação para atribuir os valores de Y
            if (U >= 0)
                Yteste(i) = 1;
            elseif (U < 0)
                Yteste(i) = -1;
            end

        end
end

