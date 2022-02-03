module PrefixRule where 

import Parser
import Utils

import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import Data.List as L

findPrefix :: (MultiSet LocalType) -> [LocalType] -> (LocalType,[LocalType])
findPrefix sequent (stype:types) = if L.null (findPrefixHelper sequent stype) then (fst (findPrefix sequent types) ,snd (findPrefix sequent types)) else (stype,findPrefixHelper sequent stype)
findPrefix sequent [] = (End,[])

-- Given an action and the sequent, find dual actions of the action in it's sequent
-- return a list of all dualactions    
findPrefixHelper :: (MultiSet LocalType) -> LocalType -> [LocalType]
findPrefixHelper sequent (Act Send s ss) = MultiSet.toList (MultiSet.filter (isActReceive s) sequent)
findPrefixHelper sequent (Act Receive s ss) = MultiSet.toList (MultiSet.filter (isActSend s) sequent)
findPrefixHelper sequent _ = []

removeDual :: LocalType -> [LocalType] -> (MultiSet LocalType) -> [(MultiSet LocalType)]
removeDual stype (action:actions) sequent = [(removeDualHelper stype sequent action)] ++ (removeDual stype actions sequent)
removeDual _ [] _= []

removeDualHelper :: LocalType -> (MultiSet LocalType) -> LocalType -> (MultiSet LocalType)
removeDualHelper stype sequent dualAction = do 
    let s = MultiSet.delete dualAction sequent
    let ss = MultiSet.insert (removeDualAct dualAction) s
    let sss = MultiSet.delete stype ss
    MultiSet.insert (removeDualAct stype) sss

applyPrefixRule :: [(MultiSet LocalType)] -> ([(MultiSet LocalType)],[(MultiSet LocalType)])
applyPrefixRule (branch:branches) = do 
    if MultiSet.null (MultiSet.filter isAct branch) then do 
        ([branch] ++ (fst (applyPrefixRule branches)), [branch] ++ (snd (applyPrefixRule branches)))
    else do 
        -- dualActions is a tuple, (type to be removed , list of choices (dual actions that can be removed))
        let dualActions = findPrefix branch (MultiSet.toList branch)
        let newbranches = removeDual (fst dualActions) (snd dualActions) branch
        if (L.length (snd dualActions) == 0) then ([branch] ++ (fst (applyPrefixRule branches)), [branch] ++ (snd (applyPrefixRule branches))) else
            if (L.length (snd dualActions) == 1) then 
                ([(head newbranches)]++ fst (applyPrefixRule branches), snd (applyPrefixRule branches))
            else                 
                ([(head newbranches)]++ fst (applyPrefixRule branches), getSecond (newbranches) ++ snd (applyPrefixRule branches))
applyPrefixRule [] = ([],[])

prefixRuleTrees :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
-- check if none or only one prefix was removed 
prefixRuleTrees (tree:trees) = if (fst (applyPrefixRule tree)) == (snd (applyPrefixRule tree)) then [(fst (applyPrefixRule tree))] ++ prefixRuleTrees trees else [(fst (applyPrefixRule tree))] ++ [((snd (applyPrefixRule tree)))] ++ prefixRuleTrees trees
prefixRuleTrees [] = [[]]

applyPrefixRuleCont :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
applyPrefixRuleCont (tree:trees) everything = if helper tree then applyPrefixRuleCont (prefixRuleTrees everything) (prefixRuleTrees everything) else applyPrefixRuleCont trees everything
    where helper (branch:branches) = if (L.null (snd (findPrefix branch (MultiSet.toList branch)))) then helper branches else True
          helper [] = False
applyPrefixRuleCont [] everything = everything