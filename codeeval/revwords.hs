import System.Environment
import System.Exit
import Data.List.Split


main = getArgs >>= parse >>= putStrLn . process

parse [] = usage  >> exit
parse [f] = readFile f

process = unlines . map revWords . lines

usage   = putStrLn "Usage: foo <file>"
exit    = exitWith ExitSuccess

revWords =  unwords . reverse . words






