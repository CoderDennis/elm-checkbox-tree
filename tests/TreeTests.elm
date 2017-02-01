module TreeTests exposing (all)

import Test exposing (..)
import Expect
import Tree exposing (..)
import Node exposing (..)


all : Test
all =
    describe "Tree Tests"
        [ test "decode json produces correct tree" <|
            \() ->
                Expect.equal
                    (decode treeJson)
                    (Ok
                        [ Leaf
                            { text = "Leaf 0"
                            , checked = True
                            }
                        , Branch
                            { text = "Branch 1"
                            , expanded = True
                            , nodes =
                                [ Leaf
                                    { text = "Leaf 1-1"
                                    , checked = True
                                    }
                                , Leaf
                                    { text = "Leaf 1-2"
                                    , checked = True
                                    }
                                ]
                            }
                        ]
                    )
        ]


treeJson =
    """
    {"tree" : [
        {
            "text" : "Leaf 0",
            "checked" : true
        },
        {
            "text" : "Branch 1",
            "expanded" : true,
            "nodes" : [
                {
                    "text" : "Leaf 1-1",
                    "checked" : true
                },
                {
                    "text" : "Leaf 1-2",
                    "checked" : true
                }
            ]
        }
    ]}
"""
