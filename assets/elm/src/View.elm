module View exposing (root)

import Html exposing (Html, div)
import Types exposing (Model, Msg)

root : Model -> Html Msg
root model =
    Html.div [] []
