module App exposing (main)

import Html
import State
import View
import Types exposing(Model, Msg)

main : Program Never Model Msg
main =
    Html.program
        {
          init = State.init,
          update = State.update,
          subscriptions = State.subscriptions,
          view = View.root
        }
