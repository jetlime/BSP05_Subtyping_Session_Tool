module Sequents where

import Parser
import Data.Map as M
import Data.List as L
import Data.Typeable

data Bag sequent

dual2 :: Seperator -> Seperator
dual2 Bar = BackAmpersand
dual2 BackAmpersand = Bar

step1 :: LocalType -> LocalType
step1 (Prl t1 sep t2) = t1 (dual2 sep) t2


sequentsAlg :: LocalType -> LocalType -> IO()
sequentsAlg subtype supertype = do 
    step1 subtype
    putStrLn ("type of supertype is: " ++ (show (typeOf supertype)))
    putStrLn ("type of subtype is: " ++ (show (typeOf subtype)))

