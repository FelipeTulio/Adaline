function [W vetordeErrosLineares vetordeErrosClassif Wretorno epoca numPadroes] = treino(taxaAprendizado, X, Yd, E )

%Inicializa��o dos dados

%numPadroes � uma vari�vel que guarda o n�mero de colunas da matriz de
%entrada. Neste caso, cada coluna representa um padr�o.
numPadroes = size(X,2);

%dimensao � uma vari�vel que armazena a quantidade de linhas neste caso.
%Ela representa o valor de dimens�es que os padr�es possuem.
dimensao = size(X,1);


%Polariza��o da matriz X (inser��o do bias)
pol = ones(1,numPadroes);
X = [pol; X ];

%Declara��o rand�mica do vetor de pesos (W) e inser��o do bias
W = rand(1, dimensao);
bias = rand(1,1);
%jun��o dos valores obtidos acima
W = [bias W];
Wretorno = W;

%Declara��o de vari�veis de controle
epoca = 0;
vetordeErrosLineares = [];
vetordeErrosClassif = [];
erroEpoca = 1;
erroEpocaAnterior = 0;

%la�o de treino
while(abs(erroEpoca-erroEpocaAnterior) > E)
    
    erroEpocaAnterior = erroEpoca;
    erroEpoca = 0;
    erroEpocaClassif =0;
    
    
    %A vari�vel indice � um vetor gerado randomicamente de tamanho igual a quantidade de
    %padr�es de entrada, usado para apresentar � rede os padr�es de forma
    %aleat�ria.
    indice = randperm(numPadroes);
    
    %la�o que faz o treinamento supervisionado
    for i = 1 : numPadroes
        
        %executa c�lculo para descobrir o valor de U
        U = W * X(:,indice(i)');
        
        erroLinear = Yd(indice(i)) - U;
        
        if (U >= 0)
            Y = 1;
        elseif (U < 0)
            Y = -1;
        end
        
        %calcula o erro de classifica��o
        erroClassif = (Yd(indice(i)) - Y)~= 0;
        
        %calcula e atualiza o novo vetor de W
        W = W + (taxaAprendizado * erroLinear * X(:,indice(i))');
        
        %atualiza o erro quadr�tico da �poca
        erroEpoca = erroEpoca + (erroLinear^2);
        
        erroEpocaClassif = erroEpocaClassif + erroClassif;
        
    end
    
    erroEpoca=erroEpoca/numPadroes;
    
    %guarda o erro da �poca no vetor de erros
    vetordeErrosLineares = [vetordeErrosLineares; erroEpoca];
    vetordeErrosClassif = [vetordeErrosClassif; erroEpocaClassif];
    epoca = epoca + 1;
end

end

