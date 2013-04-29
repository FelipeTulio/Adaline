%-----------------------------------------------------------------------------
%
% Autor: Renato Dourado Maia - Última Alteração em agosto de 2011
%
% function [XTreino,YTreino, XValidacao, YValidacao] = DadosHeart
%
% Função para organizar dados do arquivo heart.txt em conjuntos de treinamento 
% e validaçao
%
% Dependência: DadosTreinamento.txt
%
% Argumentos de entrada: não há
%
% Argumentos de saída:
%
%   XTreino    ==> matriz com padrões de treinamento (padrões por coluna)
%
%   YTreino    ==> vetor com saídas desejadas para padrões de treinamento
%
%   XValidacao ==> matriz com padrões de validação (padrões por coluna)
%
%   YValidacao ==> vetor com saidas desejadas para padrões de validação
%
%      A saída desejada para o padrão da coluna i das matrizes XTreino e
%      XValidacao é o elemento da posição i dos vetores YTreino e YValidacao,
%      respectivamente.
%
%   Testado no Matlab R2010a e no Octave 3.2.4
%
%-----------------------------------------------------------------------------

function [XTreino,YTreino, XValidacao, YValidacao] = OrganizaDados

%-----------------------------------------------------------------------------
% Carrega arquivo com dados 

load DadosTreinamento.txt
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
% Organizando dados em conjunto de treinamento 

% Número de padrões para treinamento: serão separados 10 pacientes doentes e 
% 10 saudáveis no conjunto de treinamento, ficando o restante no conjunto de 
% validaçao
PadroesTrei = 10;

% Ordena o vetor de dados pela coluna 5 (saudaveis/doentes). Cria uma
% matriz ordenada pela coluna 5 que refere-se a ausencia ou presenca da
% doenca de coraçao
hordenado = sortrows(DadosTreinamento,5);

% Escolha aleatória de 10 padrões para treinamento
h1 = randperm(18); 
x1_treinamento = hordenado(h1(1:PadroesTrei),:);

% Escolha aleatória de 10 padrões para treinamento
h2 = randperm(17);
x2_treinamento = hordenado(18 + h2(1:PadroesTrei), :);   

% Montando matrizes de dados de maneira adequada:
% padrões por coluna na matriz de entrada e saidas
% por linha na matriz de saídas
XTreino  = [x1_treinamento(:,1:4)' x2_treinamento(:,1:4)'];		

YTreino  = [x1_treinamento(:,5)' x2_treinamento(:,5)'];   		
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
% Organizando dados em conjunto de validação

% Seleciona dados para validação e monta matrizes de dados tal como foi feito 
% para os dados de treinamento
x1_validacao  = hordenado(h1(PadroesTrei + 1:18),:); 		
x2_validacao  = hordenado(18 + h2(PadroesTrei + 1:17), :); 
XValidacao = [x1_validacao(:,1:4)' x2_validacao(:,1:4)'];	
YValidacao = [x1_validacao(:,5)' x2_validacao(:,5)'];
%-----------------------------------------------------------------------------