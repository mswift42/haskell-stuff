import System.Environment
import System.Exit
import Data.Function (on)
import Data.List (maximumBy,sortBy)

main = getArgs >>= parse >>= putStrLn . process

parse [] = usage  >> exit
parse [f] = readFile f

process = longest . lines

usage   = putStrLn "Usage: foo <file>"
exit    = exitWith ExitSuccess

longest (y:ys) = unlines $ drop n $ sortBy (compare `on` length) ys
                 where n = length ys - (read y :: Int)
