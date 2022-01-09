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

-- A list of different trees (only one tree needs to have a holding relation)
-- each tree has a list of branches (called Multisets or sequents), the okrule must
-- hold for every branch. The branches in this list are the uppest-most in the tree itself. 

-- Naively, we find a tree which has branches that are all holding
-- if a tree does not have all branches holding, we move on to the next one
-- if none respect the condiction, the subtyping relation does not hold
checkOk :: [[(MultiSet LocalType)]] -> Bool
checkOk (x:xs) = if checkAllOk x then True else checkOk xs
checkOk [] = False

-- Naively checking if all branches hold
checkAllOk :: [(MultiSet LocalType)] -> Bool
checkAllOk (x:xs) = if okRule x then checkAllOk xs else False
checkAllOk [] = True

checkPar :: LocalType-> These LocalType LocalType
--checkPar (Act dir s ss) = (Act dir s (checkPar ss))
checkPar (Prl lt BackAmpersand ss) = These lt ss
checkPar lt = This lt


checkPar2 :: LocalType-> These LocalType LocalType
checkPar2 (Prl lt BackAmpersand ss) = These lt ss
checkPar2 lt = That lt

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

applyParRule :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
applyParRule (tree:trees) = if (fst (parRule tree) == snd(parRule tree)) then [fst(parRule tree)] ++ applyParRule trees else [fst(parRule tree)] ++ [snd (parRule tree)] ++ applyParRule trees
applyParRule [] = []

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
    if (prefixRule leftSet) then do True else prefixRule rightSet

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

checkMeetApply :: (MultiSet LocalType) -> Bool
checkMeetApply xs = do 
    let newxs = MultiSet.filter isChoiceReceive  xs
    null newxs

checkParApply :: (MultiSet LocalType) -> Bool
checkParApply xs = do 
    let newxs = MultiSet.filter isPar xs
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

prefixRule :: [(MultiSet LocalType)] -> [(MultiSet LocalType)]
prefixRule (branch:branches) = do 
    -- create a Multiset of types that can be removed (representing a list of choices)
    let xs = MultiSet.mapEither (checkPrefix sequent) (sequent)
    let second = MultiSet.map removeDualAct (snd xs)
    let result = MultiSet.union second (fst xs)
    if result == sequent then okRule result else prefixRule result

prefixRuleTree :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
prefixRuleTree (tree:trees) = prefixRule tree ++ prefixRuleTree trees
prefixRuleTree [] = []

-- Asynchronous Rules do not create a new tree
asynchronousBlock :: (MultiSet LocalType) -> [[(MultiSet LocalType)]]
asynchronousBlock sequent = do 
    let timedSequent = timesRule sequent
    let joinedSequent = joinRule timedSequent
    if joinedSequent == [] then [[timedSequent]] else [joinedSequent]

-- for every branch we either obtain one branch (the same or modified) or a list of branches
-- the new ones are added to the existing tree
-- new trees could be created, we append them to the global list we return
synchronousBlockTree :: [[(MultiSet LocalType)]] -> [[(MultiSet LocalType)]]
synchronousBlockTree trees = do 
    let trees2 = applyParRule trees
    prefixRuleTree trees2

algorithmRun :: LocalType -> LocalType -> (MultiSet LocalType) -> IO()
algorithmRun subtype supertype sequent = do 
    let file = "tmp/log.txt"
    -- Apply the Asynchronous set of rule (TIME and JOIN) 
    -- till no more can be applied
    if okRule sequent then do 
        let result = printResult subtype supertype True
        writeToFile file ("Final Result: " ++ result)
        printResultIO subtype supertype True    
    else do 
        -- A list of Multiset's, the list has one element if the JOIN rule was not applied
        -- Otherwise one element in the list corresponds to one branch, all elements in one list 
        -- must hold for the subtyping relation to hold
        let result = (asynchronousBlock sequent)
        writeToFile file ("Asynchronous rules got applied: " ++ printTrees result 1)
        -- all asynchronous rule were applied, the synchronous one's will now be applied.
        -- check if every branch holds with the prefix rule
        let alltrees = synchronousBlockTree result
        writeToFile file ("Synchronous rules got applied: " ++ printTrees alltrees 1 )
        -- let alltrees = synchronousBlock result
        -- once we obtained the list of all trees all having a list of branches
        -- we check if at least one tree has every branch that holds
        -- otherwise the subtyping relation does not hold.
        -- alltrees of type [[(MultiSet Localtype)]]
        let algresult = checkOk alltrees     
        -- End Of Algorithm
        let result = printResult subtype supertype algresult
        writeToFile file ("Final Result: " ++ result)
        printResultIO subtype supertype algresult       

printResultIO :: LocalType -> LocalType -> Bool -> IO()
printResultIO subtype supertype True = putStrLn("Subtyping between '" ++ show subtype ++ "' and  '" ++ show supertype ++ "' holds.")
printResultIO subtype supertype False = putStrLn("Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " does not hold.")

printResult :: LocalType -> LocalType -> Bool -> String
printResult subtype supertype True = "Subtyping between '" ++ show subtype ++ "' and  '" ++ show supertype ++ "' holds."
printResult subtype supertype False = "Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " does not hold."

printTrees :: [[(MultiSet LocalType)]] -> Int -> String
printTrees (x:xs) index = "Tree #"++ show(index) ++ ": " ++ (printTree x 1)++ (printTrees xs (index+1))
printTrees [] index = ""

printTree :: [(MultiSet LocalType)] -> Int -> String
printTree (y:ys) index = " Branch " ++ show(index) ++ ": "++ show (MultiSet.toList y) ++ (printTree ys (index+1))
printTree [] index = ""

getDual :: LocalType -> LocalType
getDual (Act Send s lt) = (Act Receive s (getDual lt))
getDual (Act Receive s lt) = (Act Send s (getDual lt))
getDual (Prl lt Bar tl) = (Prl (getDual lt) BackAmpersand (getDual tl))
getDual (Prl lt BackAmpersand tl) = (Prl (getDual lt) Bar (getDual tl))
getDual (Choice Send lt) = (Choice Receive (map getDual lt))
getDual (Choice Receive lt) = (Choice Send (map getDual lt))
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
    algorithmRun subtype supertype ans