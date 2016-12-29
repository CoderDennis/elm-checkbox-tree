module CheckboxTree exposing (..)

import Html exposing (..)


-- import Html.Events exposing (onClick)

import Html.Attributes exposing (..)
import Json.Encode as Json
import VirtualDom


indeterminate : Bool -> Attribute msg
indeterminate bool =
    VirtualDom.property "indeterminate" (Json.bool bool)


type Node
    = Node
        { text : String
        , checked : Bool
        , indeterminate : Bool
        , nodes : List Node
        }



{- This is kind of a subtle distinction. I suggested the naive fix, but you can
   often do something a bit nicer. So I would recommend reading more at:
   <https://github.com/elm-lang/elm-compiler/blob/0.18.0/hints/recursive-alias.md>
-}


type alias Model =
    { nodes : List Node }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Checkbox Tree" ]
        , div []
            (List.map viewNode model.nodes)
        ]


viewNode : Node -> Html Msg
viewNode node =
    case node of
        Node node ->
            div []
                [ input
                    [ type_ "checkbox"
                    , checked node.checked
                    , indeterminate node.indeterminate
                    ]
                    []
                , text node.text
                ]


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


initialModel : Model
initialModel =
    { nodes =
        [ Node
            { text = "Test 1"
            , checked = False
            , indeterminate = False
            , nodes = []
            }
        , Node
            { text = "Test 2"
            , checked = True
            , indeterminate = False
            , nodes =
                [ Node
                    { text = "sub node 1"
                    , checked = False
                    , indeterminate = False
                    , nodes = []
                    }
                ]
            }
        , Node
            { text = "Test 3"
            , checked = False
            , indeterminate = True
            , nodes = []
            }
        ]
    }


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
