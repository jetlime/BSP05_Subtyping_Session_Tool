module Utils where 

import Parser
import qualified Data.Map as M
import Data.Map (Map)    


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

isActSend :: LocalType -> Bool
isActSend (Act Send _ _) = True
isActSend _ = False

isActReceive :: String -> LocalType -> Bool
isActReceive s (Act Receive x _) = if s==x then True else False
isActReceive _ _ = False

removeDualAct :: LocalType -> LocalType
removeDualAct (Act dir s lt) = lt
removeDualAct lt = lt
