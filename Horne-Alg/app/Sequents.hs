module Sequents where

import Parser
import Utils
import Data.Typeable
import qualified Data.Map as M
import Data.Map (Map)
import Data.List as L
import Data.List (elemIndex)
import Data.These
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
    let file = "tmp/log.txt"
    let filteredSequent = MultiSet.filter isEnd sequent
    -- writeToFile file ("OK rule does not apply:" ++ show(MultiSet.toList sequent))
    if filteredSequent == sequent then do True  else False
    -- if (checkTimesApply sequent == False) then timesRule sequent else ( if prefixRuleApply sequent then (prefixRule sequent) else False)

checkPar :: LocalType-> These LocalType LocalType
checkPar (Prl lt BackAmpersand ss) = These lt ss
checkPar lt = This lt

checkPar2 :: LocalType-> These LocalType LocalType
checkPar2 (Prl lt BackAmpersand ss) = These lt ss
checkPar2 lt = That lt

parRule :: (MultiSet LocalType) -> Bool
parRule sequent = do 
    let leftSet = mapThese checkPar sequent
    let rightSet = mapThese checkPar2 sequent
    if (prefixRule (fst leftSet)) && (prefixRule (snd leftSet)) then True else 
        if (prefixRule (fst rightSet)) && (prefixRule (snd rightSet)) then True else False

checkJoin :: LocalType -> LocalType
checkJoin (Choice Send listlt) = (head listlt)
checkJoin lt = lt

checkJoin2 :: LocalType -> LocalType
checkJoin2 (Choice Send listlt) = (last listlt)
checkJoin2 lt = lt

joinRule :: (MultiSet LocalType) -> [(MultiSet LocalType)]
joinRule sequent = do 
    let leftSet = MultiSet.map checkJoin sequent
    let rightSet = MultiSet.map checkJoin2 sequent
    if sequent == rightSet then [] else [leftSet, rightSet] ++ joinRule leftSet ++ joinRule rightSet
    -- if (prefixRule leftSet && prefixRule rightSet) then True else False

checkMeet :: LocalType -> LocalType
checkMeet (Choice Receive listlt) = (head listlt)
checkMeet lt = lt 

checkMeet2 :: LocalType -> LocalType
checkMeet2 (Choice Receive listlt) = (last listlt)
checkMeet2 lt = lt

meetRule :: (MultiSet LocalType) -> Bool
meetRule sequent = do
    let leftSet = MultiSet.map checkMeet sequent
    let rightSet = MultiSet.map checkMeet2 sequent
    if (prefixRule leftSet) then True else prefixRule rightSet

prefixRuleApply :: (MultiSet LocalType) -> Bool
prefixRuleApply sequent = do 
    let xs = MultiSet.mapEither (checkPrefix sequent) (sequent)
    let second = fst xs
    if (MultiSet.null second) then (True) else False

-- check if TIME's rule can be applied
checkTimesApply :: (MultiSet LocalType) -> Bool
checkTimesApply xs = do 
    let newxs = MultiSet.filter isPrl xs
    null newxs

checkJoinApply :: (MultiSet LocalType) -> Bool
checkJoinApply xs = do 
    let newxs = MultiSet.filter isChoice xs
    null newxs

checkTimes :: LocalType -> LocalType
checkTimes (Prl s Bar ss) = s
checkTimes (Act dir s ss) = (Act dir s (checkTimes ss))
checkTimes lt = lt

checkTimes2 :: LocalType -> LocalType
checkTimes2 (Prl s Bar ss) = ss
checkTimes2 (Act dir s ss) = (checkTimes2 ss)
checkTimes2 lt =  lt

timesRule :: (MultiSet LocalType) -> (MultiSet LocalType)
timesRule sequent = do 
    let result = MultiSet.concatMap (\x -> if isPrl x then [checkTimes x, checkTimes2 x] else [x] ) sequent
    --let content = "TIMES rule: " ++  (show(MultiSet.toList result))
    --log <- writeToFile "tmp/log.txt" content
    if result == sequent then sequent else timesRule result

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
    if result == sequent then okRule result else prefixRule result
    --if (any isAct xs) then putStrLn(show True) else putStrLn(show False)

asynchronousBlock :: (MultiSet LocalType) -> [(MultiSet LocalType)]
asynchronousBlock sequent = do 
    let timedSequent = timesRule sequent
    let joinedSequent = joinRule timedSequent
    if joinedSequent == [] then [timedSequent] else joinedSequent

algorithmRun :: (MultiSet LocalType) -> Bool
algorithmRun sequent = do 
    -- Apply the Asynchronous set of rule (TIME and JOIN) 
    -- till no more can be applied
    if okRule sequent then True else do 
        -- A list of Multiset's, the list has one element if the JOIN rule was not applied
        -- Otherwise one element in the list corresponds to one branch, all elements in one list 
        -- must hold for the subtyping relation to hold
        let result = asynchronousBlock sequent
        -- all asynchronous rule were applied, the synchronous one's will now be applied.
        -- check if every branch holds with the prefix rule
        all prefixRule result

printResultIO :: LocalType -> LocalType -> Bool -> IO()
printResultIO subtype supertype True = putStrLn("Subtyping between '" ++ show subtype ++ "' and  '" ++ show supertype ++ "' holds.")
printResultIO subtype supertype False = putStrLn("Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " does not hold.")

printResult :: LocalType -> LocalType -> Bool -> String
printResult subtype supertype True = "Subtyping between '" ++ show subtype ++ "' and  '" ++ show supertype ++ "' holds."
printResult subtype supertype False = "Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " does not hold."

getDual :: LocalType -> LocalType
getDual (Act Send s lt) = (Act Receive s (getDual lt))
getDual (Act Receive s lt) = (Act Send s (getDual lt))
getDual (Prl lt Bar tl) = (Prl (getDual lt) BackAmpersand (getDual tl))
getDual (Prl lt BackAmpersand tl) = (Prl (getDual lt) Bar (getDual tl))
getDual (Choice Send lt) = (Choice Receive lt)
getDual (Choice Receive lt) = (Choice Send lt)
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
    -- path of the algortihm log file
    let file = "tmp/log.txt"
    -- empty the previous written file
    writeFile file ""
    writeToFile file (printLocalType subtype ++ "<=" ++ printLocalType supertype)
    -- chose which type to dualize in function of mode
    let ans = dualize subtype supertype mode
    writeToFile file ("Dualize the supertype/subtype: " ++ show(MultiSet.toList ans))
    -- we dualized one of the types.
    -- and put the two types in a Multiset called sequent
    -- start of alg. 
    let algResult = algorithmRun ans
    -- End Of Algorithm
    let result = printResult subtype supertype algResult
    writeToFile file ("Final Result: " ++ result)
    printResultIO subtype supertype algResult
    let sequent = ans
    let res3 = timesRule sequent
    print(MultiSet.toList res3)
    let debuglist = MultiSet.fromList [(Choice Send [(Act Send "a" End), (Act Send "b" End)]),(Act Receive "a" End)]
    let res4 = joinRule debuglist
    print(res4)
    

    {-
    -- DEBUG JOIN RULE
    let debuglist = MultiSet.fromList [(Choice Send [(Act Send "a" End), (Act Send "b" End)]),(Act Receive "a" End)]
    putStrLn "Example of Join rule applied to +{!a;end,!b;end}<=?a;end"
    --printResultIO (Choice Send [(Act Send "a" End), (Act Send "a" End)]) (Act Receive "a" End) 
    let res2 = joinRule debuglist
    print(head res2)
    -- DEBUG MEET RULE
    let debuglist = MultiSet.fromList [(Choice Receive [(Act Receive "a" End), (Act Receive "a" End)]),(Act Send "a" End)]
    putStrLn "Example of MEET rule applied to &{?a;end,?a;end}<=!a;end"
    printResultIO (Choice Receive [(Act Receive "a" End), (Act Receive "a" End)]) (Act Send "a" End) (meetRule debuglist)
    -- DEBUG PAR RULE
    let testtype = (Prl (Act Send "a" End) BackAmpersand (End))
    let testtype2 = (Act Receive "a" End)
    let parresult = parRule (MultiSet.fromList [testtype, testtype2])
    -- Desired correct which is also obtained: INPUT, !a;end$end <?a;end
    -- OUTPUT, [[(!a;end,1),(?a;end,1)], [end,1]] or [[(?a;end,1),(end,1)],[(!a;end)]]
    -- In here the first branch holds, subtyping holds, no need to check the second branch !
    printResultIO testtype testtype2 parresult
    -}