module ParRule where

import Parser
import Utils

import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import Data.These

-- Apply Par rule on every tree
applyParRule :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
applyParRule (tree:trees) = if (fst (parRule tree) == snd(parRule tree)) then [fst(parRule tree)] ++ applyParRule trees else [fst(parRule tree)] ++ [snd (parRule tree)] ++ applyParRule trees
applyParRule [] = []

-- Apply Par rule on every branch
parRule :: [(MultiSet LocalType)] -> ([(MultiSet LocalType)],[(MultiSet LocalType)])
parRule (branch:branches) = do  
    if isParSequent branch then do
        let leftSet = mapThese checkPar branch
        let rightSet = mapThese checkPar2 branch
        -- fst and snd of the tuple leftSet form two branches in one tree
        -- fst and snd of the tuple rightSet form two branches in the second tree
        ([(fst leftSet),(snd leftSet)] ++ (fst (parRule branches)),[(fst rightSet),(snd rightSet)] ++ (snd (parRule branches)))
    else ([branch] ++ (fst (parRule branches)),[branch] ++ (snd (parRule branches)))
parRule [] = ([],[])

checkPar :: LocalType-> These LocalType LocalType
checkPar (Prl lt BackAmpersand ss) = These lt ss
checkPar lt = This lt

checkPar2 :: LocalType-> These LocalType LocalType
checkPar2 (Prl lt BackAmpersand ss) = These lt ss
checkPar2 lt = That lt