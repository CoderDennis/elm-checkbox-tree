port module Main exposing (..)

import NodeTests
import TreeTests
import Test exposing (..)
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)


main : TestProgram
main =
    run emit all


all : Test
all =
    describe "All Tests"
        [ NodeTests.all
        , TreeTests.all
        ]


port emit : ( String, Value ) -> Cmd msg
