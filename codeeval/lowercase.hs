import System.Environment
import System.Exit
import Data.List.Split
import Data.Char (toLower)


main = getArgs >>= parse >>= putStrLn . process

parse [] = usage  >> exit
parse [f] = readFile f

process = unlines . map lowerword . lines

usage   = putStrLn "Usage: foo <file>"
exit    = exitWith ExitSuccess

lowerword = map toLower






