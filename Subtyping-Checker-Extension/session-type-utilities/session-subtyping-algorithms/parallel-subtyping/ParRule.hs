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
        let leftSet1 = MultiSet.map (\x -> if isPar x then checkPar1 x else x ) branch
        let leftSet2 = MultiSet.mapMaybe (\x -> if isPar x then Just (checkPar2 x) else Nothing) branch
        let leftSet = (leftSet1, leftSet2)
        let rightSet1 = MultiSet.map (\x -> if isPar x then checkPar2 x else x ) branch
        let rightSet2 = MultiSet.mapMaybe (\x -> if isPar x then Just (checkPar1 x) else Nothing) branch
        let rightSet = (rightSet1, rightSet2)
        -- fst and snd of the tuple leftSet form two branches in one tree
        -- fst and snd of the tuple rightSet form two branches in the second tree
        ([(fst leftSet),(snd leftSet)] ++ (fst (parRule branches)),[(fst rightSet),(snd rightSet)] ++ (snd (parRule branches)))
    else ([branch] ++ (fst (parRule branches)),[branch] ++ (snd (parRule branches)))
parRule [] = ([],[])

checkPar1 :: LocalType -> LocalType
checkPar1 (Prl lt BackAmpersand ss) = lt
checkPar1 (Act s l ss) = (Act s l (checkPar1 ss))
checkPar1 lt = lt

checkPar2 :: LocalType -> LocalType
checkPar2 (Prl lt BackAmpersand ss) = ss
checkPar2 (Act s l ss) = checkPar2 ss
checkPar2 lt = lt