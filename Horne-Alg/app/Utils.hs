module Utils where 
import qualified Data.Map as M
import Data.Map (Map)    

-- Code to handle types, obtained from user dave4420 on stackoverflow.com
newtype Bag a = Bag (Map a Int)
    deriving (Show,Eq)

empty :: Bag a
empty = Bag $ M.empty
-- converta list to a bag
fromList :: (Ord a) => [a] -> Bag a
fromList = foldl f empty
    where
        f (Bag map) x = Bag $ M.insertWith (+) x 1 map

toList :: Bag a -> [a]
toList (Bag m) = concatMap f $ M.toList m
    where f (a,b) = replicate b a

-- Check if every element is the same
allTheSame :: (Eq a) => [a] -> Bool
allTheSame xs = and $ map (== head xs) (tail xs)