import System.Environment
import System.Exit
import Data.List (group)



main = getArgs >>= parse >>= putStrLn . process

parse [] = usage  >> exit
parse [f] = readFile f

process = unlines . map nonrepeat . lines

usage   = putStrLn "Usage: foo <file>"
exit    = exitSuccess

countChars c [] = 0
countChars c (x:xs) | x == c = 1 + countChars c xs
                    | otherwise = countChars c xs

singleChar c xs = countChars c xs == 1                                  

nonrepeat [] = []
nonrepeat xs = nonrepeat' xs
  where nonrepeat' (y:ys) | notElem y ys && singleChar y xs = [y]
                          | otherwise = nonrepeat' ys
             







