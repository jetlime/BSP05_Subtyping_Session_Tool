module PrefixRule where 

import Parser
import Utils
import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import Data.List as L
import Debug.Trace

findPrefixWithDual :: (MultiSet LocalType) -> [LocalType] -> (LocalType,[LocalType])
findPrefixWithDual sequent (stype:types) = if L.null (findPrefix sequent stype) then (fst (findPrefixWithDual sequent types) ,snd (findPrefixWithDual sequent types)) else (stype,findPrefix sequent stype)
findPrefixWithDual sequent [] = (End,[])
    
findPrefix :: (MultiSet LocalType) -> LocalType -> [LocalType]
findPrefix sequent (Act Send s ss) = MultiSet.toList (MultiSet.filter (isActReceive s) sequent)
findPrefix sequent (Act Receive s ss) = MultiSet.toList (MultiSet.filter (isActSend s) sequent)
findPrefix sequent _ = []

removeDual2 :: LocalType -> (MultiSet LocalType) -> LocalType -> (MultiSet LocalType)
removeDual2 stype sequent dualAction = do 
    let s = MultiSet.delete dualAction sequent
    let ss = MultiSet.insert (removeDualAct dualAction) s
    let sss = MultiSet.delete stype ss
    MultiSet.insert (removeDualAct stype) sss

removeDual :: LocalType -> [LocalType] -> (MultiSet LocalType) -> [(MultiSet LocalType)]
removeDual stype (action:actions) sequent = [(removeDual2 stype sequent action)] ++ (removeDual stype actions sequent)
removeDual _ [] _= []

checkPrefix :: (MultiSet LocalType) -> ((MultiSet LocalType),[[(MultiSet LocalType)]])
checkPrefix sequent = do 
    if MultiSet.null (MultiSet.filter isAct sequent) then do 
        (sequent, [[sequent]])
    else do 
        -- dualActions is a tuple, (type to be removed , list of choices (dual actions that can be removed))
        let dualActions = findPrefixWithDual sequent (MultiSet.toList sequent)
        let branches = removeDual (fst dualActions) (snd dualActions) sequent
        if L.null (snd dualActions) then (sequent, [[sequent]]) else (head branches, [L.tail branches])

-- return a tuple, (Modified branches of the current tree, new trees created)
prefixRule :: [(MultiSet LocalType)] -> ([(MultiSet LocalType)], [[(MultiSet LocalType)]])
prefixRule (branch:branches) = ([fst (checkPrefix branch)] ++ fst (prefixRule branches), (snd (checkPrefix branch)) ++ (snd (prefixRule branches)))
prefixRule [] = ([],[[]])

applyPrefixRule :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
-- check if none or only one prefix was removed
applyPrefixRule (tree:trees) = if [(fst (prefixRule tree))]== (snd (prefixRule tree)) then [(fst (prefixRule tree))] ++ applyPrefixRule trees else [(fst (prefixRule tree))] ++ (snd (prefixRule tree)) ++ applyPrefixRule trees
applyPrefixRule [] = [[]]

applyRule :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
applyRule (tree:trees) everything = if helper tree then applyRule (applyPrefixRule everything) (applyPrefixRule everything) else applyRule trees everything
    where helper (branch:branches) = if (fst (findPrefixWithDual branch (MultiSet.toList branch))== End) then helper branches else True
          helper [] = False
applyRule [] everything = everything