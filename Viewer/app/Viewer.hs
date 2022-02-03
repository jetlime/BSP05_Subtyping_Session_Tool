{-# LANGUAGE DeriveDataTypeable, TypeSynonymInstances #-}

import Automata
import Parser
import Data.List as L
import Data.Map as M
import Data.Set as S
import Data.Tree
import System.Environment
import System.FilePath.Posix
import System.Process
import System.Console.CmdArgs
import GHC.IO.Handle
import Control.Monad
import Data.Text (strip, pack, unpack)
import Data.Time.Clock (UTCTime, getCurrentTime, diffUTCTime)
import Text.Printf (printf)
import System.Process

-- DEBUG
import System.IO.Unsafe
import Debug.Trace

writeToFile :: FilePath -> String -> IO()
writeToFile file content = writeFile file content


data Subtyping = Subtyping
                 {t :: String}
               deriving (Data,Typeable,Show,Eq)


subargs = Subtyping
 {t = def  &= argPos 0  &= typ "FILE/LOCALTYPE"}  &= help "Type visualiser"



getLocalTypeString :: String -> IO String
getLocalTypeString s = readFile s

main :: IO ()
main = do
  pargs <- cmdArgs (modes [subargs])
  ty <- getLocalTypeString (t pargs)
  case parseLocalType ty of
    Left err -> print err
    Right ans ->
          if not (wellFormed ans)
          then putStrLn "Error in local type (not well-formed)."
          else
            do
             if isPrl ans then do 
              let m1 = type2Machine False "-" ans
              let m2 = type2Machine2 False "-" ans 
              machine2file m1 "type1" 
              machine2file2 m2 m1 "type2"
              -- merge the two created .dot files
              -- type2_csfm.dot & type1_csfm.dot to type_csfm.dot
              runCommand "gvpack -u -o tmp/type_cfsm.dot tmp/type1_cfsm.dot tmp/type2_cfsm.dot"
              putStrLn "Done"
             else do
              let m1 = type2Machine False "-" ans
              machine2file m1 "type" 
              putStrLn "Done"
  return ()
