module Sequents where

import Parser
import Utils
import Data.Typeable
import qualified Data.Map as M
import Data.Map (Map)
import Data.List as L
import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import qualified System.IO.Strict as SIO
import ParRule
import MeetRule
import PrefixRule

-----------OKRULE-----------
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
checkOk (x:xs) = if L.null x then checkOk xs else (if checkAllOk x then True else checkOk xs)
checkOk [] = False

-- Naively checking if all branches hold
checkAllOk :: [(MultiSet LocalType)] -> Bool
checkAllOk (x:xs) = if okRule x then checkAllOk xs else False
checkAllOk [] = True
-----------OKRULE-----------

-----------JOINRULE -----------
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
-----------JOINRULE-----------

-----------TIMESRULE-----------
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
-----------TIMESRULES-----------

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
    let trees3 = applyMeetRule trees2
    let trees4 = applyRule trees3 trees3
    if trees4 == L.filter notEmpty trees4 then trees4 else synchronousBlockTree (helper trees4)
    where helper (tree:trees) = helper2 tree ++ helper trees
          helper [] = []
          helper2 (branch:branches) = asynchronousBlock branch ++ helper2 branches
          helper2 [] = []
    
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
printTrees (x:xs) index = if x/=[] then " Tree #"++ show(index) ++ ": " ++ (printTree x 1)++ (printTrees xs (index+1)) else printTrees xs (index)
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