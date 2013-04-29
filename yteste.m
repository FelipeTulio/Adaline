function [ Yteste ] = yteste( W )
%YTESTE Summary of this function goes here
%   Detailed explanation goes here

    load DadosTeste.txt;
    Dados = DadosTeste';
    numPadroes = size(Dados,2);

        %Polariza��o da matriz X (inser��o do bias)
        pol = +1 * ones(1,numPadroes);
        XValidacao = [pol; Dados ];

        Yteste = zeros(1,numPadroes);

        for i = 1 : numPadroes

            %executa c�lculo para descobrir o valor de U
            U = W * XValidacao(:,i');

            %faz a verifica��o para atribuir os valores de Y
            if (U >= 0)
                Yteste(i) = 1;
            elseif (U < 0)
                Yteste(i) = -1;
            end

        end
end

