module Main exposing (..)

import Html exposing (Html, div, text, button)


main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = \_ -> Sub.none
    }



-- MODEL


type alias Model =
  { day : Int
  , powerups : Int
  , loops : Int
  , currentLoop : Int
  , isTrainingStarted : Bool
  , isAfterTrainingStarted : Bool
  }


init : ( Model, Cmd Msg )
init =
  let
    model =
      { day = 1
      , powerups = 1
      , loops = 4
      , currentLoop = 0
      , isTrainingStarted = False
      , isAfterTrainingStarted = False
      }
  in
    ( model, Cmd.none )



-- UPDATE


type Msg
  = StartTraining
  | EndTraining
  | PowerUp
  | PowerDown
  | NextLoop


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    StartTraining ->
      ( { model | isTrainingStarted = True, currentLoop = 1 }, Cmd.none )

    NextLoop ->
      ( { model | currentLoop = model.currentLoop + 1 }, Cmd.none )

    EndTraining ->
      ( { model | isTrainingStarted = False, isAfterTrainingStarted = True, day = model.day + 1 }, Cmd.none )

    PowerUp ->
      ( { model | powerups = model.powerups + 1, isAfterTrainingStarted = False }, Cmd.none )

    PowerDown ->
      ( { model | powerups = model.powerups - 1, isAfterTrainingStarted = False }, Cmd.none )



-- VIEW


main_view : Model -> Html Msg
main_view model =
  let
    pull_ups =
      toString model.powerups

    other =
      toString (model.powerups * 2)
  in
    div
      []
      [ div [] [ text ("Today is " ++ (toString model.day) ++ " day") ]
      , div [] [ text "Next traning plan is: " ]
      , div
          []
          [ text (pull_ups ++ "-" ++ other ++ "-" ++ other ++ "-" ++ other)
          ]
      , button [] [ text "Start Training" ]
      ]


view : Model -> Html Msg
view model =
  main_view model
