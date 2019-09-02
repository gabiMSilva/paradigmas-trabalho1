module Usuario (QtdPecas, Nome, Id, Jogador, Jogadores, cadastraJogador) where

import Utils

type QtdPecas = Int
type Nome = String
type Id = Int
data Jogador = Jogador Id Nome QtdPecas deriving (Show)
type Jogadores = [Jogador]

cadastraJogador :: Int -> Jogadores -> IO Jogadores
cadastraJogador id jogadores = do
    nome<-getString("Digite o nome do jogador " ++ show id ++ "\n")
    
    return ((Jogador id nome 12):jogadores)