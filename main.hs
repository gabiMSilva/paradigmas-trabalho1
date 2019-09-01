import Control.Exception
import System.IO
import System.IO.Error
import System.Process

type EhDama = Bool --Informa se a peça já se tornou dama
type Posicao = (Int, Int) --Localização da peca na matriz

data Peca = Peca Jogador Posicao EhDama
type QtdPecas = Int
type Nome = String
data Jogador = Jogador Nome QtdPecas deriving (Show)

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
    putStrLn "Jogando"
    return ()

executar '0' = do
    return ()

executar _ = do
    putStrLn ("\nOpção inválida! Tente novamente")
    putStr "\nPressione <Enter> para voltar ao menu..."
    getChar
    menu

main::IO()
main = do
    menu