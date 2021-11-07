module Sequents where

import Parser
import Data.Map as M

data Bag sequent

fromList :: (Ord a) => [a] -> Bag a
fromList = foldl f empty
    where
        f (Bag map) x = Bag $ M.insertWith (+) x 1 map


sequentsAlg :: LocalType -> LocalType -> Bag
{-}
sequentsAlg LocalType Prl = fromList Prl
sequentsAlg Prl LocalType = fromList Prl
sequentsAlg Prl Prl = fromList Prl
-}