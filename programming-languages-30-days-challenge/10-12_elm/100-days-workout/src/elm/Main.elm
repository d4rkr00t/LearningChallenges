module Main exposing (..)

import Html exposing (Html, div, span, text, button)
import Html.Attributes exposing (..)


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


type alias Exercise =
  { name : String
  , iterations : Int
  }


exercise_column : Exercise -> Html Msg
exercise_column exr =
  div
    [ class "card__col" ]
    [ div
        [ classList
            [ ( "card__col-icon", True )
            , ( exr.name, True )
            ]
        ]
        []
    , div [ class "card__col-label" ] [ text (toString exr.iterations) ]
    ]


badge : String -> String -> String -> Html Msg
badge icon val color_cls =
  span
    [ classList [ ( "card__badge", True ), ( color_cls, True ) ] ]
    [ text (icon ++ " " ++ val) ]


main_view : Model -> Html Msg
main_view model =
  let
    pull_ups =
      model.powerups

    other =
      model.powerups * 2

    next_training =
      [ (Exercise "pull_ups" pull_ups)
      , (Exercise "squats" other)
      , (Exercise "push_ups" other)
      , (Exercise "squats" other)
      ]
  in
    div
      []
      [ div
          [ class "title" ]
          [ text "100 Days Workout" ]
      , div
          [ class "card" ]
          [ div
              [ class "card__completed" ]
              [ badge "✓" (toString model.day) "-purple" ]
          , div
              [ class "card__group" ]
              [ div [ class "card__label" ] [ text "Next traning: " ]
              , div
                  [ class "card__row" ]
                  (List.map exercise_column next_training)
              ]
          , div
              []
              [ badge "∞" (toString model.loops) "-green" ]
          ]
      , button [] [ text "Start Training" ]
      ]


view : Model -> Html Msg
view model =
  main_view model
