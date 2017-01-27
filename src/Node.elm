module Node exposing (..)

{- single record type with fields for both leaf and branch -}


type alias Node =
    { text : String
    , expanded : Bool
    , checked : Bool
    , indeterminate : Bool
    , nodes : Nodes
    }


type Nodes
    = Nodes List Node



{-
   OR type with alternate records for leaf and branch
     indeterminate and checked would be functions for a Branch.
-}


type Node
    = Leaf
        { text : String
        , checked : Bool
        }
    | Branch
        { text : String
        , expanded : Bool
        , nodes : List Node
        }
