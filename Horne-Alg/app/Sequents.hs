module Sequents where

import Parser
import Utils
import Data.Typeable
import qualified Data.Map as M
import Data.Map (Map)
import Data.List as L
import Data.List (elemIndex)
-- https://hackage.haskell.org/package/multiset-0.3.4.3/docs/Data-MultiSet.html#g:1
import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import qualified System.IO.Strict as SIO
-- okRule using recursion and Data.Multiset
-- O(n)
-- if the rule holds, return True
-- if the rule does not hold, check if we can apply the TIMES rule if so then call the TIMES RULE
okRule :: (MultiSet LocalType) -> Bool
okRule sequent = do 
    let filteredSequent = MultiSet.filter isEnd sequent
    if filteredSequent == sequent then True else 
        if (checkTimesApply sequent == False) then (timesRule sequent) else ( if prefixRuleeApply sequent then (prefixRule sequent) else False)

prefixRuleeApply :: (MultiSet LocalType) -> Bool
prefixRuleeApply sequent = do 
    let xs = MultiSet.mapEither (checkPrefix sequent) (sequent)
    let second = fst xs
    if (MultiSet.null second) then (True) else False

-- check if TIME's rule can be applied
checkTimesApply :: (MultiSet LocalType) -> Bool
checkTimesApply xs = do 
    let newxs = MultiSet.filter isPrl xs
    null newxs

checkTimes :: LocalType -> LocalType
checkTimes (Prl s Bar ss) = s
checkTimes (Act dir s ss) = (Act dir s (checkTimes ss))
checkTimes lt = lt

checkTimes2 :: LocalType -> LocalType
checkTimes2 (Prl s Bar ss) = ss
checkTimes2 (Act dir s ss) = (checkTimes2 ss)
checkTimes2 lt =  lt

timesRule :: (MultiSet LocalType) -> Bool
timesRule sequent = do 
    let result = MultiSet.concatMap (\x -> if isPrl x then [checkTimes x, checkTimes2 x] else [x] ) sequent
    prefixRule result

findNext :: (MultiSet LocalType) -> LocalType -> Either LocalType LocalType
findNext sequent (Act Send s ss) = do 
    -- list of all dual types in the sequent
    let result = MultiSet.filter (isActReceive s) sequent
    -- if the list is empty then the prefix rule is not applied on this LocalType
    if (MultiSet.null result) then Left (Act Send s ss) else Right (Act Send s ss)
findNext sequent (Act Receive s ss) = do 
    -- list of all dual types in the sequent
    let result = MultiSet.filter (isActSend s) sequent 
    if (MultiSet.null result) then Left (Act Receive s ss) else Right (Act Receive s ss)


-- according to the
checkPrefix :: (MultiSet LocalType) -> LocalType -> Either LocalType LocalType
checkPrefix  sequent (Act dir s lt) = do 
    case findNext sequent (Act dir s lt) of
        -- if another dual action exists
        Right ans -> do 
            Right (Act dir s lt)
        -- if no dual action exists
        Left ans -> do 
            Left (Act dir s lt)
checkPrefix xs lt = Left lt



prefixRule :: (MultiSet LocalType) ->  Bool
prefixRule sequent = do 
    -- create a Multiset of types that can be removed (representing a list of choices)
    let xs = MultiSet.mapEither (checkPrefix sequent) (sequent)
    let second = MultiSet.map removeDualAct (snd xs)
    let result = MultiSet.union second (fst xs)
    --if (any isAct xs) then putStrLn(show True) else putStrLn(show False)
    okRule result


timesRuleTest:: (MultiSet LocalType) -> (MultiSet LocalType)
timesRuleTest sequent = do 
    let result = MultiSet.concatMap (\x -> if isPrl x then [checkTimes x, checkTimes2 x] else [x] ) sequent
    result

findNext2 :: (MultiSet LocalType) -> LocalType -> IO()
findNext2 sequent (Act Send s ss) = do 
    -- list of all dual types in the sequent
    let result = MultiSet.filter (isActReceive s) sequent
    print (MultiSet.toList result )
findNext2 sequent (Act Receive s ss) = do 
    -- list of all dual types in the sequent
    let result = MultiSet.filter (isActSend s) sequent 
    print (MultiSet.toList result)
findNext2 _ lt = putStrLn "Nothing"    



prefixBranches :: (MultiSet LocalType) -> IO()
prefixBranches sequent = do
    -- given the sequent, [(?a;end, 1),(!a;!b;end, 1),(!a;end, 1)]
    -- MultiSet.mapMaybe iterates over sequent,
    --let nlist = MultiSet.mapMaybe (findNext2 sequent) (sequent)
    --print (MultiSet.toList nlist)
    putStrLn "paul"
    -- on ?a;end, it will call findNext, which will generate a list result
    -- of all the dual actions in the sequent, [!a;!b;end,!a;end], this MultiSet is returned
    -- 
    -- given the sequent, generate a list of all the LocalTypes that have a dual in the sequent
    -- e.G [?a;end, !a;?b;end, !a;end, end]
    -- becomes [?a;end]
    -- for every element in this list apply the prefix rule on the sequent
    -- if find next obtains more then 1 result for find next generate a branching, in one 
    -- branch the first choice is taken, in the other branch the other choice is taken
    -- find next will find !a;?b;end and !a;end -> [!a;?b;end,!a;end]
    -- it will apply the prefix rule on the first element, then continue from scratch, if at the
    -- end, the end rule does not apply, we backtrack, and start again from the second element
    -- in the list given, !a;end, if the OK rule holds in this case then the relation holds, if not
    -- the relation does not hold because not other element his present in this branch list.
    -- we obtain a list of sequents :
    
algorithmRun :: (MultiSet LocalType) -> Bool
algorithmRun sequent = do 
    okRule sequent

printResult :: LocalType -> LocalType -> Bool -> IO()
printResult subtype supertype True = putStrLn("Subtyping between '" ++ show subtype ++ "' and  '" ++ show supertype ++ "' holds.")
printResult subtype supertype False = putStrLn("Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " does not hold.")

getDual :: LocalType -> LocalType
getDual (Act Send s lt) = (Act Receive s (getDual lt))
getDual (Act Receive s lt) = (Act Send s (getDual lt))
getDual (Prl lt Bar tl) = (Prl (getDual lt) BackAmpersand (getDual tl))
getDual (Prl lt BackAmpersand tl) = (Prl (getDual lt) Bar (getDual tl))
getDual lt = lt

dualize :: LocalType -> LocalType -> Bool -> (MultiSet LocalType)
dualize subtype supertype True = do 
    -- if the mode is true then we dualize the supertype 
    -- otherwise we dualize the subtype
    let dualType = getDual supertype
    MultiSet.fromList [subtype ,dualType]
dualize subtype supertype False = do 
    let dualType = getDual subtype
    -- convert the type from String to Localtype and parse it
    -- create a list with the dualised subtype and the supertype
    -- convert the list to a bag x 
    MultiSet.fromList [dualType ,supertype]

sequentsAlg :: LocalType -> LocalType -> Bool ->  IO()
sequentsAlg subtype supertype mode = do 
    writeToFile "tmp/log.txt" (printLocalType subtype ++ "<=" ++ printLocalType supertype)
    -- chose which type to dualize in function of mode
    let ans = dualize subtype supertype mode
    writeToFile "tmp/log.txt" (show(MultiSet.toList ans))
    -- we dualized one of the types.
    -- and put the two types in a Multiset called sequent
    -- start of alg. 
    -- DEBUG
    let timedRule = timesRuleTest ans
    findNext2 timedRule (Act Send "a" End)
    prefixBranches ans
    let algResult = algorithmRun ans
    -- End Of Algorithm
    printResult subtype supertype algResult 
