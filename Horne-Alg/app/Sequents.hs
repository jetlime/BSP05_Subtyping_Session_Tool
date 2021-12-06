module Sequents where

import Parser
import Utils
-- to use mapWithIndex
import Data.Sequence (Seq(..), (<|), (|>), (><))
import qualified Data.Sequence as S
import Data.Typeable
import qualified Data.Map as M
import Data.Map (Map)
import Data.List as L
import Data.List (elemIndex)
-- https://hackage.haskell.org/package/multiset-0.3.4.3/docs/Data-MultiSet.html#g:1
import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
-- Debug
import Debug.Trace

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

-- check if the localtype has a Bar (|) inside 
checkTimes :: LocalType -> LocalType
checkTimes (Prl s Bar ss) = s
checkTimes (Act dir s ss) = (Act dir s (checkTimes ss))

checkTimes2 :: LocalType -> LocalType
checkTimes2 (Prl s Bar ss) = ss
checkTimes2 (Act dir s ss) = checkTimes2 ss

-- check if TIME's rule can be applied
checkTimesApply :: (MultiSet LocalType) -> Bool
checkTimesApply xs = do 
    let newxs = MultiSet.filter isPrl xs
    null newxs

-- v2 of times rule
timesRule :: (MultiSet LocalType) -> Bool
timesRule sequent = do 
    let result = MultiSet.map (\x -> if (isPrl x) then (checkTimes x) else x) sequent
    let newxs = MultiSet.filter isPrl sequent
    let secondlist = MultiSet.map checkTimes2 newxs
    let sequent = MultiSet.union secondlist result
    prefixRule sequent


findNext :: (MultiSet LocalType) -> LocalType -> Either LocalType LocalType
findNext sequent (Act Send s ss) = do 
    -- position of the dual action 
    let result = MultiSet.filter (isActReceive s) sequent
    if (MultiSet.null result) then Left (Act Send s ss) else Right (Act Send s ss)
findNext sequent (Act Receive s ss) = do 
    -- Position of the dual action 
    let result = MultiSet.filter isActSend sequent 
    if (MultiSet.null result) then Left (Act Receive s ss) else Right (Act Receive s ss)


-- according to the
checkPrefix :: (MultiSet LocalType) -> LocalType -> Either LocalType LocalType
checkPrefix  sequent (Act dir s lt) = do 
    case findNext sequent (Act dir s lt) of
        -- if another dual action exists
        Right ans -> do 
            Right (Act dir s lt)
        -- if no dual ction exists
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
    -- chose which type to dualize in function of mode
    let ans = dualize subtype supertype mode
    -- we dualized one of the types.
    -- and put the two types in a Multiset called sequent
    -- start of alg. 
    let algResult = algorithmRun ans
    let result = getDual (Prl (Act Send "a" (Act Send "c" End)) Bar (Act Receive "a" End)) 
    putStrLn (printLocalType result)
    -- End Of Algorithm
    printResult subtype supertype algResult 