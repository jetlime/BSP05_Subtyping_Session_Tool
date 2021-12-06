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
-- OK rule
okRule :: (Bag LocalType) -> Bool
-- check if all elements are of type End
okRule sequent = do 
    -- convert the sequent to a list
    let list = toList sequent
    -- check if the list is composed of only the same type
    if allTheSame list then 
        do 
            -- check if the list is only composed of type End
            -- if so the alg. succeeds
            let felem = head list
            if felem==End then
                True
            else 
                if (checkTimesApply list == False) then (timesRule sequent) else False
    else 
       if (checkTimesApply list == False) then (timesRule sequent) else False

isEnd :: LocalType -> Bool
isEnd End = True
isEnd _ = False

-- okRule v2 using recursion and Data.Multiset
-- O(n)
okRulev2 :: (MultiSet LocalType) -> Bool
okRulev2 sequent = do 
    let filteredSequent = MultiSet.filter isEnd sequent
    if filteredSequent == sequent then True else False

isPrl :: LocalType -> Bool
isPrl (Prl s Bar ss) = True
isPrl (Act dir s ss) = isPrl ss
isPrl _ = False

isAct :: LocalType -> Bool
isAct (Act dir _ lt) = True
isAct _ = False

-- check if the localtype has a Bar (|) inside 
checkTimes :: LocalType -> LocalType
checkTimes (Prl s Bar ss) = s
checkTimes (Act dir s ss) = (Act dir s (checkTimes ss))

checkTimes2 :: LocalType -> LocalType
checkTimes2 (Prl s Bar ss) = ss
checkTimes2 (Act dir s ss) = checkTimes2 ss
-- check if TIME's rule can be applied
checkTimesApply :: [LocalType] -> Bool
checkTimesApply xs = do 
    let newxs = filter isPrl xs
    null newxs



timesRule :: (Bag LocalType) -> Bool
timesRule sequent= do
    let xs = toList sequent
    let firstlist = map (\x -> if (isPrl x) then (checkTimes x) else x) xs
    let newxs = filter isPrl xs
    let secondlist = map checkTimes2 newxs
    let mergedlist = combine2 secondlist firstlist
    let sequent = fromList mergedlist
    -- CALL PREFIX RULE WITH SEQUENT
    okRule sequent 

-- ?a;end
-- [?a; end,end,end]
-- let num = position ((length list)) (Act Send "a" End) list 0
pos :: LocalType -> LocalType -> Int -> Int -> Maybe Int
pos (Act dir s ss) (Act dir2 t tt) index len
    | (dir /= dir2) && (s == t) = Just len
    | otherwise = pos (Act dir s ss) tt index len
pos lt ltt index len = Nothing


position :: Int -> LocalType -> [LocalType] -> Int -> Maybe Int
position size _ [] _ = Nothing
position size _ [x] _  = Nothing
position size lt (x:xs) index = do 
    let current_index = size - (length xs+1)
    -- on veut eviter index 
    if current_index /= index 
    then do 
        case pos lt x index current_index of 
            Nothing -> position (size-1) lt xs index 
            Just n -> Just n
    else position (size-1) lt xs index 

findNext :: [LocalType] -> Int -> Direction -> String -> Either Bool Bool
findNext xs index dir s = do 
    -- Position of the dual action 
    case position (length xs) (Act dir s End) xs index of
        Nothing -> Left False
        Just n -> Right True


checkPrefix :: [LocalType] -> Int -> LocalType -> LocalType
checkPrefix xs index (Act dir s lt) = do 
    case findNext xs index dir s of
        -- if another dual action exists
        Right ans -> do 
            checkPrefix xs index lt
        Left ans -> do 
            Act dir s (checkPrefix xs index lt)
checkPrefix xs index lt = lt 

prefixRule :: (Bag LocalType) -> IO()
prefixRule sequent = do 
    let xs = toList sequent
    print xs
    let newlist = S.mapWithIndex (checkPrefix xs) (S.fromList xs)
    print newlist
    -- check if any action is present in the list
    if (any isAct xs) then putStrLn(show True) else putStrLn(show False)


algorithmRun :: (Bag LocalType) -> Bool
algorithmRun sequent = do 
    okRule sequent

printResult :: LocalType -> LocalType -> Bool -> IO()
printResult subtype supertype True = putStrLn("Subtyping between '" ++ show subtype ++ "' and  '" ++ show supertype ++ "' holds.")
printResult subtype supertype False = putStrLn("Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " does not hold.")

printDual :: LocalType -> String
printDual (Act dir s lt) = (if dir == Send then ((printDirection Receive)++s++"; "++(printDual lt)) else (printDirection Send)++s++"; "++(printDual lt))
printDual (Rec s lt) = "rec "++s++" . "++(printDual lt)
printDual End = "end"
printDual (Var s) =  s
printDual (Choice dir xs) = (if dir == Send
                                  then "+{"
                                  else "&[")
                                 ++
                                 helper xs
                                 ++
                                 (if dir == Send
                                  then "}"
                                  else "]")
  where helper (x:y:xs) = (printDual x)
                          ++", "++(helper (y:xs))
        helper [x] = printDual x
        helper [] = []
printDual (Prl s sep ss) = (printDual s)
                                 ++
                                 " "
                                 ++ 
                                 (if sep == Bar
                                 then "$"
                                 else "|")
                                 ++
                                 " "
                                 ++
                                 (printDual ss)

dualize :: LocalType -> LocalType -> Bool -> Either String  (Bag LocalType)
dualize lsubtype lsupertype mode = do 
    let subtype = printLocalType lsubtype
    let supertype = printLocalType lsupertype
    -- if the mode is true then we dualize the supertype 
    -- otherwise we dualize the subtype
    if mode 
    then do 
        let dualType = printDual lsupertype
        -- convert the type from String to Localtype and parse it
        case parseLocalType dualType of
            Left err -> do 
                let error = show err
                Left error
            Right ans -> do
                -- create a list with the dualised supertype and the subtype
                -- convert the list to a bag x 
                let sequent = fromList [lsubtype ,ans]
                --Right dualType
                Right sequent
    else 
        do 
            let dualType = printDual lsubtype
            -- convert the type from String to Localtype and parse it
            case parseLocalType dualType of
                Left err -> do 
                    let error = show err
                    Left error
                Right ans -> do
                    -- create a list with the dualised subtype and the supertype
                    -- convert the list to a bag x 
                    let sequent = fromList [ans ,lsupertype]
                    --Right dualType
                    Right sequent


test :: (Bag LocalType) -> (Bag LocalType)
test sequent= do
    let xs = toList sequent
    let firstlist = map (\x -> if (isPrl x) then (checkTimes x) else x) xs
    let newxs = filter isPrl xs
    let secondlist = map checkTimes2 newxs
    let mergedlist = combine2 secondlist firstlist
    let sequent = fromList mergedlist 
    -- CALL PREFIX RULE WITH SEQUENT
    sequent

sequentsAlg :: LocalType -> LocalType -> Bool ->  IO()
sequentsAlg subtype supertype mode = do 
    -- chose which type to dualize in function of mode
    case dualize subtype supertype mode of 
        Left err -> do 
            -- An error occurs when no internal communications are present in either type
            putStrLn(err)
        Right ans -> do 
            -- we dualized one of the types.
            -- and put the two types in a Multiset called sequent
            let sequent = ans
            show (okRulev2 sequent)
            -- start of alg. 
            let newsequent = test sequent
            let list =toList newsequent
            print list
            let algResult = algorithmRun sequent
            -- End Of Algorithm
            prefixRule newsequent  
            printResult subtype supertype algResult
