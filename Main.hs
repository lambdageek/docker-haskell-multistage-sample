module Main where
import System.Environment (getArgs)
import Data.List (intercalate)
import Secrets (secret)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [ ] -> putStrLn $ "Hello, your secret is \"" ++ secret ++ "\""
    _ -> putStrLn $ "you said too many things: \"" ++ intercalate ", " args ++ "\""
