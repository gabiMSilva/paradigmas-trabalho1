module Menu ( menu, executar, novoJogo) where

import System.Process
import Usuario
import Tabuleiro

menu :: IO()
menu = do
    system "clear" --Limpa a tela (Apenas para Ubuntu)
    putStrLn "---------------------------------- Jogo de Dama ----------------------------------"
    putStr "\n\nDigite 1 para jogar"
    putStr "\nDigite 0 para sair\n\n"
    op <- getChar
    getChar -- descarta o Enter
    executar op
    return ()

executar :: Char -> IO()
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

novoJogo :: Jogadores -> IO()
novoJogo jogadores = do
    system("clear")
    putStrLn("Os 1's equivalem às peças do Jogador 1 e os 2's às do Jogador 2")
    -- Comeca com o primeiro jogador
    novaPartida 1 [1..64]