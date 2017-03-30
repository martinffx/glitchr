module State exposing (init, update, subscriptions)

import Types exposing (Model, Msg(..))
import Platform.Sub as Sub

init : (Model, Cmd Msg)
init =
    {} ! []

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
    case action of
        None ->
            {} ! []

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
