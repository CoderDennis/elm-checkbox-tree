module Tree exposing (..)

import Node exposing (..)
import List
import Json.Decode exposing (..)


type alias Tree =
    List Node


decode : String -> Result String Tree
decode json =
    json
        |> decodeString (field "tree" (list nodeDecoder))


nodeDecoder : Decoder Node
nodeDecoder =
    oneOf
        [ map Leaf leafDecoder
        , map Branch (lazy (\_ -> branchDecoder))
        ]


leafDecoder : Decoder LeafRecord
leafDecoder =
    map2 LeafRecord
        (field "text" string)
        (field "checked" bool)


branchDecoder : Decoder BranchRecord
branchDecoder =
    map3 BranchRecord
        (field "text" string)
        (field "expanded" bool)
        (field "nodes" (list (lazy (\_ -> nodeDecoder))))
