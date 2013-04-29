function [ Y ] = yadaline( XValidacao, W )

numPadroes = size(XValidacao,2);
    
    pol = +1 * ones(1,numPadroes);
    XValidacao = [pol; XValidacao ];
    
    Y = zeros(1,numPadroes);

    for i = 1 : numPadroes
        
        %executa cálculo para descobrir o valor de U
        U = W * XValidacao(:,i');
        
        %faz a verificação para atribuir os valores de Y
        if (U >= 0)
            Y(i) = 1;
        elseif (U < 0)
            Y(i) = -1;
        end
        
    end

end

