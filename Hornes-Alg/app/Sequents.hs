module Sequents where

import Parser
import Data.Typeable

data Bag a = EmptyBag | ListBag [(a, Integer)] deriving (Eq, Show)

emptyBag :: Bag a
emptyBag = EmptyBag

add :: Eq a => a -> Bag a -> Bag a
add element EmptyBag = ListBag [(element,1)]
add element (ListBag bag)
  | element `elem` map fst bag = ListBag bag -- will actually increment the count, and return the new bag.

printResult :: LocalType -> LocalType -> IO()
printResult subtype supertype = putStrLn("Subtyping between " ++ show subtype ++ " and  " ++ show supertype ++ " holds.")

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

dualize :: LocalType -> LocalType -> Either String String 
dualize lsubtype lsupertype = do 
    let subtype = printLocalType lsubtype
    let supertype = printLocalType lsupertype
    -- if the supertype uses internal communications we dualize it
    -- otherwise we dualize the subtype
    if (charInString '$' supertype == True || charInString '|' supertype == True)
    then do 
        let dualType = printDual lsupertype
        Right dualType
    else 
        do 
            if (charInString '$' subtype == True || charInString '|' subtype == True)
                then 
                    do 
                        let dualType = printDual lsubtype
                        Right dualType
            else
                do  
                    -- if no internal communications are present in either session type
                    -- we inform the user that the algorithm only works for parallel session types for the moment
                    let error = "Please input at least one type using internal communications for checking subtyping with the parallel subtyping algorithm"
                    Left error


sequentsAlg :: LocalType -> LocalType ->  IO()
sequentsAlg subtype supertype= do 
    -- chose which type to dualize
    case dualize subtype supertype of 
        Left err -> do 
            -- An error occurs when no internal communications are present in either type
            putStrLn(err)
        Right ans -> do 
            -- we dualized one of the types.
            let dualType = ans
            -- convert the type from String to Localtype and parse it
            case parseLocalType dualType of
                Left err -> do
                    putStrLn("Error Occured while generating a Dual.")
                Right ans -> do 
                    putStrLn("Type got dualized and parsed.")
            printResult subtype supertype