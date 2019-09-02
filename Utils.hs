module Utils ( getString ) where

getString :: String -> IO String
getString str = do
    putStr str
    res <- getLine
    return res