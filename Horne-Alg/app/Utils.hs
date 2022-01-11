module Utils where 

import Parser

import qualified Data.Map as M
import Data.Map (Map)    
import qualified System.IO.Strict as SIO
import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import Data.These

----------------- TYPE CHECKER -----------------
-- Verify if localtype is of type &{?, ?}
isReceiveChoice :: LocalType -> Bool
isReceiveChoice (Choice Receive _) = True
isReceiveChoice _ = False
-- check if of type End
isEnd :: LocalType -> Bool
isEnd End = True
isEnd _ = False
-- check if of type Prl
isPrl :: LocalType -> Bool
isPrl (Prl s Bar ss) = True
isPrl (Act dir s ss) = isPrl ss
isPrl _ = False
-- check if of type Act (?x or !x)
isAct :: LocalType -> Bool
isAct (Act dir _ lt) = True
isAct _ = False
-- check if of type Action Sending (!a)
isActSend :: String -> LocalType -> Bool
isActSend s (Act Send x _) = if s==x then True else False
isActSend _ _ = False
-- check if of type Action Receiving (?a)
isActReceive :: String -> LocalType -> Bool
isActReceive s (Act Receive x _) = if s==x then True else False
isActReceive _ _ = False
-- check if of type Par (a$b)
isPar :: LocalType -> Bool
isPar (Prl s BackAmpersand ss) = True
isPar (Act dir s ss) = isPar ss
isPar _ = False
----------------- TYPE CHECKER -----------------

----------------- PRINTING -----------------
printResultIO :: LocalType -> LocalType -> Bool -> IO()
printResultIO subtype supertype True = putStrLn("Subtyping between '" ++ show subtype ++ "' and  '" ++ show supertype ++ "' holds.")
printResultIO subtype supertype False = putStrLn("Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " does not hold.")

printResult :: LocalType -> LocalType -> Bool -> String
printResult subtype supertype True = "Subtyping between '" ++ show subtype ++ "' and  '" ++ show supertype ++ "' holds."
printResult subtype supertype False = "Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " does not hold."

printTrees :: [[(MultiSet LocalType)]] -> Int -> String
printTrees (x:xs) index = if x/=[] then " Tree #"++ show(index) ++ ": " ++ (printTree x 1)++ (printTrees xs (index+1)) else printTrees xs (index)
printTrees [] index = ""

printTree :: [(MultiSet LocalType)] -> Int -> String
printTree (y:ys) index = if MultiSet.null y then printTree ys index else  " Branch " ++ show(index) ++ ": "++ show (MultiSet.toList y) ++ (printTree ys (index+1))
printTree [] index = ""

writeToFile :: FilePath -> String -> IO()
writeToFile file content = do 
    x <- SIO.readFile file
    writeFile file (content++"\n")
    appendFile file x
----------------- PRINTING -----------------

----------------- OTHER UTILS -----------------
-- check if a branch (sequent contains a PAR type)
isParSequent :: (MultiSet LocalType) -> Bool
isParSequent s = if MultiSet.null (MultiSet.filter isPar s) then False else True
-- Verify if the MEET rule shall be applied on a branch (sequent)
isMeet :: (MultiSet LocalType) -> Bool
isMeet sequent = if (MultiSet.null (MultiSet.filter isReceiveChoice sequent)) == False then True else False
-- Remove the prl of a type
cutPrl :: LocalType -> LocalType
cutPrl (Act dir s lt) = (Act dir s (cutPrl lt))
cutPrl (Prl s lt ss) = s
cutPrl End = (End)
cutPrl s = s

-- Remove the prefix of a LocalType
removeDualAct :: LocalType -> LocalType
removeDualAct (Act dir s lt) = lt
removeDualAct lt = lt
-- Verify if a tree is empty
notEmpty :: [(MultiSet LocalType)] -> Bool
notEmpty [] = False
notEmpty l = True
-- | /O(n)/. Map and separate the 'This' and 'That' or 'These' results 
-- modified function of mapEither to map both cases in case f return These
-- code of mapEither found in source code, 
mapThese :: (Ord b, Ord c) => (a -> These b c) -> MultiSet a -> (MultiSet b, MultiSet c)
mapThese f = (\(ls,rs) -> (MultiSet.fromOccurList ls, MultiSet.fromOccurList rs)) . mapThese' . MultiSet.toOccurList
  where mapThese' [] = ([],[])
        mapThese' ((x,n):xs) = case f x of
           This  l -> let (ls,rs) = mapThese' xs in ((l,n):ls, rs)
           That r -> let (ls,rs) = mapThese' xs in (ls, (r,n):rs)
           These u i -> let (ls,rs) = mapThese' xs in ((u,n):ls, (i,n):rs)
----------------- OTHER UTILS -----------------