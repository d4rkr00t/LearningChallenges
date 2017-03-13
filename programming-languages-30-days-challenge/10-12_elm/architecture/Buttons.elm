module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
  Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
  Int


model : Model
model =
  0



-- UPDATE


type Msg
  = Inc
  | Dec


update : Msg -> Model -> Model
update msg model =
  case msg of
    Inc ->
      model + 1

    Dec ->
      model - 1



-- VIEW


view : Model -> Html Msg
view model =
  div
    []
    [ button [ onClick Dec ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Inc ] [ text "+" ]
    ]
