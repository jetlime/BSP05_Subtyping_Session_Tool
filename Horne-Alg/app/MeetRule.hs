module MeetRule where 

import Parser
import Utils

import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as MultiSet

checkMeet :: LocalType -> LocalType
checkMeet (Choice Receive listlt) = (head listlt)
checkMeet lt = lt 

checkMeet2 :: LocalType -> LocalType
checkMeet2 (Choice Receive listlt) = (last listlt)
checkMeet2 lt = lt

meetRule :: [(MultiSet LocalType)] -> ([(MultiSet LocalType)],[(MultiSet LocalType)])
meetRule (branch:branches) = do
    if isMeet branch then do 
        let leftSet = MultiSet.map checkMeet branch
        let rightSet = MultiSet.map checkMeet2 branch
        ([leftSet] ++ (fst (meetRule branches)),[rightSet] ++ (snd (meetRule branches)))
    else ([branch] ++ (fst (meetRule branches)),[branch] ++ (snd (meetRule branches)))
meetRule [] = ([],[])

applyMeetRule ::  [[(MultiSet LocalType)]] -> ([[(MultiSet LocalType)]], String)
applyMeetRule (tree:trees) = if (fst (meetRule tree) == snd (meetRule tree)) then ([fst(meetRule tree)] ++ (fst (applyMeetRule trees)), "MEET RULE") else ([fst(meetRule tree)] ++ [snd (meetRule tree)] ++ (fst (applyMeetRule trees)), "MEET RULE")
applyMeetRule [] = ([], "")