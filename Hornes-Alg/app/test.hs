
test :: LocalType -> String
test (Prl s sep ss) = do 
    if (sep==Bar) 
        then ((printLocalType s) ++  "$" ++ (printLocalType ss))
        else ((printLocalType s) ++  "|" ++ (printLocalType ss))     
test _ = ""

dual2 :: LocalType -> LocalType
dual2 (Prl s Bar ss) = (Prl (dual3 s) BackAmpersand (dual3 ss))
dual2 (Prl s BackAmpersand ss) = (Prl (dual3 s) Bar (dual3 ss))