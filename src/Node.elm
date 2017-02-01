module Node exposing (..)

import List
import Json.Decode exposing (..)


{-
   type with alternate records for leaf and branch
     indeterminate and checked are functions for a Branch.
-}


type alias LeafRecord =
    { text : String
    , checked : Bool
    }


type alias BranchRecord =
    { text : String
    , expanded : Bool
    , nodes : List Node
    }


type Node
    = Leaf LeafRecord
    | Branch BranchRecord



{-
   Need to be able to import / export from json
-}


allChecked : Node -> Bool
allChecked node =
    case node of
        Leaf leaf ->
            leaf.checked

        Branch branch ->
            List.all allChecked branch.nodes


anyChecked : Node -> Bool
anyChecked node =
    case node of
        Leaf leaf ->
            leaf.checked

        Branch branch ->
            List.any anyChecked branch.nodes
