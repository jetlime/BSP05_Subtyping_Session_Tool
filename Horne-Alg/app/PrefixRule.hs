module PrefixRule where 

import Parser
import Utils
import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import Data.List as L

findPrefixWithDual :: (MultiSet LocalType) -> [LocalType] -> [LocalType]
findPrefixWithDual sequent (stype:types) = if L.null (findPrefix sequent stype) then findPrefixWithDual sequent types else findPrefix sequent stype
findPrefixWithDual sequent [] = []
    
findPrefix :: (MultiSet LocalType) -> LocalType -> [LocalType]
findPrefix sequent (Act Send s ss) = MultiSet.toList (MultiSet.filter (isActReceive s) sequent)
findPrefix sequent (Act Receive s ss) = MultiSet.toList (MultiSet.filter (isActSend s) sequent)
findPrefix sequent _ = []

isDual :: LocalType -> LocalType -> Bool
isDual (Act Send s ss) (Act Receive x xx) = if s==x then True else False
isDual (Act Receive s ss) (Act Send x xx) = if s==x then True else False
isDual _ _ = False

checkPrefix :: LocalType -> LocalType -> Either LocalType LocalType
checkPrefix action dualAction = if (isDual dualAction action || action == dualAction) then Right action else Left action

removeDual2 :: (MultiSet LocalType) -> LocalType -> (MultiSet LocalType)
removeDual2 sequent dualAction = do 
    let xs = MultiSet.mapEither (\x -> checkPrefix x dualAction) sequent
    let second = MultiSet.map removeDualAct (snd xs)
    MultiSet.union second (fst xs)

removeDual :: [LocalType] -> (MultiSet LocalType) -> [(MultiSet LocalType)]
removeDual (action:actions) sequent = [(removeDual2 sequent action)] ++ (removeDual actions sequent)
removeDual [] _ = []

checkPrefix2 :: (MultiSet LocalType) -> ((MultiSet LocalType),[[(MultiSet LocalType)]])
checkPrefix2 sequent = do 
    if MultiSet.null (MultiSet.filter isAct sequent) then do 
        (sequent, [[sequent]])
    else do 
        -- list of choices (dual actions that can be removed)
        let dualActions = findPrefixWithDual sequent (MultiSet.toList sequent)
        let branches = removeDual dualActions sequent
        if L.null dualActions then (sequent, [[sequent]]) else (head branches, [L.tail branches])

-- return a tuple, (Modified branches of the current tree, new trees created)
prefixRule :: [(MultiSet LocalType)] -> ([(MultiSet LocalType)], [[(MultiSet LocalType)]])
prefixRule (branch:branches) = ([fst (checkPrefix2 branch)] ++ fst (prefixRule branches), (snd (checkPrefix2 branch)) ++ (snd (prefixRule branches)))
prefixRule [] = ([],[[]])

applyPrefixRule :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
-- check if none or only one prefix was removed
applyPrefixRule (tree:trees) = if [(fst (prefixRule tree))]== (snd (prefixRule tree)) then [(fst (prefixRule tree))] ++ applyPrefixRule trees else [(fst (prefixRule tree))] ++ (snd (prefixRule tree)) ++ applyPrefixRule trees
applyPrefixRule [] = [[]]

applyRule :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
applyRule (tree:trees) everything = if helper tree then applyRule (applyPrefixRule everything) (applyPrefixRule everything) else applyRule trees everything
    where helper (branch:branches) = if L.null (findPrefixWithDual branch (MultiSet.toList branch)) then helper branches else True
          helper [] = False
applyRule [] everything = everything