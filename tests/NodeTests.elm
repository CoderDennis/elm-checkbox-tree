module NodeTests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (bool)
import Node exposing (..)


all : Test
all =
    describe "Node Tests"
        [ fuzz bool "allChecked for a Leaf returns .checked" <|
            \b ->
                Expect.equal
                    b
                    (allChecked (leaf b))
        , test "allChecked for a Branch when all Leaves are checked is true" <|
            \() ->
                Expect.true
                    "allChecked should be true"
                    (allChecked branchWithAllCheckedLeaves)
        , test "allChecked for a Branch when only some leaves are checked is false" <|
            \() ->
                Expect.false
                    "allChecked should be false"
                    (allChecked branchWithSomeCheckedLeaves)
        , fuzz bool "anyChecked for a Leaf returns .checked" <|
            \b ->
                Expect.equal
                    b
                    (anyChecked (leaf b))
        , test "anyChecked for a Branch when all Leaves are checked is true" <|
            \() ->
                Expect.true
                    "anyChecked should be true"
                    (anyChecked branchWithAllCheckedLeaves)
        , test "anyChecked for a Branch when some leaves are checked is true" <|
            \() ->
                Expect.true
                    "anyChecked should be true"
                    (anyChecked branchWithSomeCheckedLeaves)
        ]


leaf : Bool -> Node
leaf b =
    Leaf
        { text = "test"
        , checked = b
        }


branchWithAllCheckedLeaves : Node
branchWithAllCheckedLeaves =
    Branch
        { text = "test"
        , expanded = True
        , nodes =
            [ leaf True
            , leaf True
            , leaf True
            ]
        }


branchWithSomeCheckedLeaves : Node
branchWithSomeCheckedLeaves =
    Branch
        { text = "test"
        , expanded = True
        , nodes =
            [ leaf True
            , leaf False
            , leaf True
            ]
        }


tree : List Node
tree =
    [ Leaf
        { text = "Leaf 0"
        , checked = True
        }
    ]
