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
            -- start of alg. 
            let step1ans = step1 sequent
            -- End Of Algorithm
            printResult subtype supertype