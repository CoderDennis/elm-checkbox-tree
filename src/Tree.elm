module Tree
    exposing
        ( Tree
        , get
        , insert
        , update
        )

{-| A hierachical Dict with a List key. Each level in the Tree is
represented by one item in the list.
-}

import Dict


type alias Node k v =
    { value : v
    , nodes : Nodes k v
    }


type Nodes k v
    = Empty
    | Nodes (Dict.Dict k (Node k v))


type alias Tree k v =
    Nodes k v


get : List comparable -> Tree comparable v -> Maybe v
get keys tree =
    tree
        |> getNode keys
        |> getValue


getNode : List comparable -> Tree comparable v -> Maybe (Node comparable v)
getNode keys tree =
    case tree of
        Empty ->
            Nothing

        Nodes d ->
            case keys of
                [] ->
                    Nothing

                [ k ] ->
                    d
                        |> Dict.get k

                k :: rest ->
                    case Dict.get k d of
                        Nothing ->
                            Nothing

                        Just node ->
                            getNode rest node.nodes


getValue : Maybe (Node k v) -> Maybe v
getValue node =
    case node of
        Just n ->
            Just n.value

        Nothing ->
            Nothing


insert : List comparable -> v -> Tree comparable v -> Tree comparable v
insert keys value tree =
    tree


remove : List comparable -> Tree comparable v -> Tree comparable v
remove keys tree =
    tree


update : List comparable -> v -> Tree comparable v -> Tree comparable v
update keys value tree =
    tree
