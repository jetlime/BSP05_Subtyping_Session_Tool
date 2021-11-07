# parallel-session-type
changelog 
, T.reservedOpNames = ["!", "?", "+", "&","|"] in Parser.hs

data LocalType = Act Direction String LocalType     -- Send/Receive prefix
      | Rec String LocalType      -- Recursive def
      | Var String                -- Recursive call
      | End                       -- End
      | Choice Direction [LocalType]
      | Parallel LocalType String LocalType
      deriving (Eq, Ord, Read)

<|>
          do { type1 <- ltparser
               ; symbol "|"
               ; type2 <- ltparser
               ; return $ Parallel type1 "|" type2
            }
            
printLocalType (Parallel sone seperator stwo) = sone ++ " | " ++ stwo
