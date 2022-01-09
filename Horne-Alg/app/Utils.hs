module Utils where 

import Parser
import qualified Data.Map as M
import Data.Map (Map)    
import qualified System.IO.Strict as SIO
-- https://hackage.haskell.org/package/multiset-0.3.4.3/docs/Data-MultiSet.html#g:1
import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet
import Data.These

-- check if of type choice '+'
isChoice :: LocalType -> Bool
isChoice (Choice Send _) = True
isChoice _ = False

isMeet :: (MultiSet LocalType) -> Bool
isMeet sequent = if (MultiSet.null (MultiSet.filter isDualChoice sequent)) == False then True else False

isDualChoice :: LocalType -> Bool
isDualChoice (Choice Receive _) = True
isDualChoice _ = False

-- check if of type End
isEnd :: LocalType -> Bool
isEnd End = True
isEnd _ = False
-- check if of type Prl
isPrl :: LocalType -> Bool
isPrl (Prl s Bar ss) = True
isPrl (Act dir s ss) = isPrl ss
isPrl _ = False
-- check if of type Act
isAct :: LocalType -> Bool
isAct (Act dir _ lt) = True
isAct _ = False

isPar :: LocalType -> Bool
isPar (Prl s BackAmpersand ss) = True
isPar (Act dir s ss) = isPar ss
isPar _ = False

isParSequent :: (MultiSet LocalType) -> Bool
isParSequent s = if null (MultiSet.filter isPar s) then False else True

isChoiceReceive :: LocalType -> Bool
isChoiceReceive (Choice Receive _) = True
isChoiceReceive _ = False

isActSend :: String -> LocalType -> Bool
isActSend s (Act Send x _) = if s==x then True else False
isActSend _ _ = False

isActReceive :: String -> LocalType -> Bool
isActReceive s (Act Receive x _) = if s==x then True else False
isActReceive _ _ = False

removeDualAct :: LocalType -> LocalType
removeDualAct (Act dir s lt) = lt
removeDualAct lt = lt

writeToFile :: FilePath -> String -> IO()
writeToFile file content = do 
    x <- SIO.readFile file
    writeFile file (content++"\n")
    appendFile file x

-- | /O(n)/. Map and separate the 'This' and 'That' or 'These' results 
-- modified function of mapEither to map both cases in case f return These
-- code of mapEither found in source code, 
mapThese :: (Ord b, Ord c) => (a -> These b c) -> MultiSet a -> (MultiSet b, MultiSet c)
mapThese f = (\(ls,rs) -> (MultiSet.fromOccurList ls, MultiSet.fromOccurList rs)) . mapThese' . MultiSet.toOccurList
  where mapThese' [] = ([],[])
        mapThese' ((x,n):xs) = case f x of
           This  l -> let (ls,rs) = mapThese' xs in ((l,n):ls, rs)
           That r -> let (ls,rs) = mapThese' xs in (ls, (r,n):rs)
           These u i -> let (ls,rs) = mapThese' xs in ((u,n):ls, (i,n):rs)