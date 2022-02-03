{-# LANGUAGE DeriveDataTypeable #-}

import Parser 
import Sequents

import Lib
import System.Console.CmdArgs
import Data.Time.Clock.POSIX

main :: IO ()

getTypeString :: String -> IO String
getTypeString s = readFile s

data Subtyping = Subtyping
                 { sub :: String
                 , sup :: String
                 , pics :: Bool
                 , flag :: String
                 }
               deriving (Data,Typeable,Show,Eq)

getMode :: String -> Bool
getMode "Horne" = True  
getMode "OtherWay" = False

subargs = Subtyping 
 { sub = def  &= argPos 0  &= typ "FILE/LOCALTYPE"
 , sup = def &= argPos 1  &= typ "FILE/LOCALTYPE"
 , flag = def &= argPos 2
 , pics = def
           &= explicit &= name "pics"
           &= help "Print graphs (.dot and .png files)"
 }  &= help "Session type subtyping relations as model checking problems"

-- main function executed in IO()
main = do 
    -- fetching the arguments
    pargs <- cmdArgs (modes [subargs])
    -- arg1 is the path to the subtype
    subtype <- getTypeString (sub pargs)
    -- arg2 is the path to the supertype
    supertype <- getTypeString (sup pargs)
    -- calling function in the Parser module to check if the subtype is well formed.
    -- get the flag of the algorithm, defining in which way we should check subtyping 
    -- this will decide if the supertype of the subtype shall be dualized
    -- 1 is the normal way (supertype get's dualized), 0 the other way (subtype get's dualized)
    let mode = getMode (flag pargs)

    case parseLocalType subtype of
        -- error found
        Left err -> do
                 putStrLn "Error in (T)ype"
                 print err
                 case parseLocalType supertype of
                   Left err -> do
                               putStrLn "Error in (S)uperype"
                               print err
                   Right supans -> putStr ""
        -- no error found
        Right subans ->
            -- checking if the supertype is well formed
            case parseLocalType supertype of
                Left err -> do
                    putStrLn "Error in (S)uperype"
                    print err
                Right supans -> do
                    if not (wellFormed subans) then putStrLn "Error: (T)ype not well-formed."
                    else if not (wellFormed supans) then putStrLn "Error: (S)upertype not well-formed."
                    else 
                        do    
                            -- supertype and supbtype are check to be wellformed and parser to be defined as objects of class Localtype
                            start <- getPOSIXTime
                            sequentsAlg subans supans mode
                            end <- getPOSIXTime
                            putStrLn $ ("Time taken: " ++ (show $ end - start))
    return ()