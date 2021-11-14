module Sequents where

import Parser
import Utils
import Data.Typeable
import qualified Data.Map as M
import Data.Map (Map)


-- algorithm steps
step1 :: (Bag LocalType) -> Bool
-- check if all elements are of type End
step1 sequent = do 
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
                False
    else 
        False


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

dualize :: LocalType -> LocalType -> Either String  (Bag LocalType)
dualize lsubtype lsupertype = do 
    let subtype = printLocalType lsubtype
    let supertype = printLocalType lsupertype
    -- if the supertype uses internal communications we dualize it
    -- otherwise we dualize the subtype
    if (charInString '$' supertype == True || charInString '|' supertype == True)
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
            if (charInString '$' subtype == True || charInString '|' subtype == True)
                then 
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
            -- and put the two types in a Multiset called sequent
            let sequent = ans
            -- start of alg. 
            let step1ans = step1 sequent
            -- End Of Algorithm
            printResult subtype supertype