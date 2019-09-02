import System.IO
import System.Process

type Tabuleiro = [Int]
type Jogadores = [Jogador]

type EhDama = Bool --Informa se a peça já se tornou dama
type Posicao = (Int, Int) --Localização da peca na matriz
data Peca = Peca Jogador Posicao EhDama deriving (Show)

type QtdPecas = Int
type Nome = String
type Id = Int
data Jogador = Jogador Id Nome QtdPecas deriving (Show)

main::IO()
main = do
    menu

getString::String->IO String
getString str = do
    putStr str
    res <- getLine
    return res

menu::IO()
menu = do
    system "clear" --Limpa a tela (Apenas para Ubuntu)
    putStrLn "---------------------------------- Jogo de Dama ----------------------------------"
    putStr "\n\nDigite 1 para jogar"
    putStr "\nDigite 0 para sair\n\n"
    op <- getChar
    getChar -- descarta o Enter
    executar op
    return ()

executar::Char->IO()
executar '1' = do
   
    --Cadastra os jogadores
    jogadores <- cadastraJogador 1 []
    jogadores <- cadastraJogador 2 jogadores
    --Inicia um novo jogo
    novoJogo jogadores
    return ()

executar '0' = do
    return ()

executar _ = do
    putStrLn ("\nOpção inválida! Tente novamente")
    putStr "\nPressione <Enter> para voltar ao menu\n"
    getChar
    menu

cadastraJogador::Int->Jogadores->IO Jogadores
cadastraJogador id jogadores = do
    nome<-getString("Digite o nome do jogador " ++ show id ++ "\n")
    
    return ((Jogador id nome 12):jogadores)

novoJogo::Jogadores->IO()
novoJogo jogadores = do
    system("clear")
    putStrLn("Os 1's equivalem às peças do Jogador 1 e os 2's às do Jogador 2")
    -- Comeca com o primeiro jogador
    novaPartida 1 [1..64]

novaPartida::Int->Tabuleiro->IO()
novaPartida id tabuleiro = do
    system("clear")
    putStrLn("Vez do Jogador " ++ show id)
--    imprimeTabuleiro tabuleiro

--imprimeTabuleiro::Tabuleiro->IO()
--imprimeTabuleiro tabuleiro
