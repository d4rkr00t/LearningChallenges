module Main exposing (..)

import Html exposing (Html, div, span, text, button, p)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = \_ -> Sub.none
    }



-- MODEL


type alias AfterTrainingQuiz =
  { wasSuccessful : Bool
  , wasSuccessfulAnswered : Bool
  , wasEasy : Bool
  , wasEasyAnswered : Bool
  }


type alias Model =
  { day : Int
  , powerups : Int
  , loops : Int
  , currentLoop : Int
  , isTrainingStarted : Bool
  , isAfterTrainingStarted : Bool
  , afterTrainingQuiz : AfterTrainingQuiz
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
      , afterTrainingQuiz =
          { wasSuccessful = False, wasSuccessfulAnswered = False, wasEasy = False, wasEasyAnswered = False }
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
  | TrainingWasSuccessful
  | TrainingWasUnsuccessful
  | TrainingWasEasy
  | TrainingWasDificult
  | TrainingQuizComplete


power_up : Model -> ( Model, Cmd Msg )
power_up model =
  let
    new_model =
      { model | powerups = model.powerups + 1, isAfterTrainingStarted = False }
  in
    update TrainingQuizComplete new_model


power_down : Model -> ( Model, Cmd Msg )
power_down model =
  let
    new_model =
      { model | powerups = model.powerups - 1, isAfterTrainingStarted = False }
  in
    if new_model.powerups == 0 then
      update TrainingQuizComplete { new_model | powerups = 1 }
    else
      update TrainingQuizComplete new_model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    StartTraining ->
      ( { model | isTrainingStarted = True, currentLoop = 1 }, Cmd.none )

    NextLoop ->
      ( { model | currentLoop = model.currentLoop + 1 }, Cmd.none )

    EndTraining ->
      ( { model | isTrainingStarted = False, isAfterTrainingStarted = True }, Cmd.none )

    PowerUp ->
      power_up model

    PowerDown ->
      power_down model

    TrainingWasSuccessful ->
      ( { model
          | afterTrainingQuiz = { wasSuccessful = True, wasSuccessfulAnswered = True, wasEasy = False, wasEasyAnswered = False }
        }
      , Cmd.none
      )

    TrainingWasUnsuccessful ->
      ( { model
          | afterTrainingQuiz = { wasSuccessful = False, wasSuccessfulAnswered = True, wasEasy = False, wasEasyAnswered = False }
        }
      , Cmd.none
      )

    TrainingWasEasy ->
      ( { model
          | afterTrainingQuiz = { wasSuccessful = True, wasSuccessfulAnswered = True, wasEasy = True, wasEasyAnswered = True }
        }
      , Cmd.none
      )

    TrainingWasDificult ->
      ( { model
          | afterTrainingQuiz = { wasSuccessful = True, wasSuccessfulAnswered = True, wasEasy = False, wasEasyAnswered = True }
        }
      , Cmd.none
      )

    TrainingQuizComplete ->
      ( { model
          | isAfterTrainingStarted = False
          , day = model.day + 1
          , afterTrainingQuiz = { wasSuccessful = False, wasSuccessfulAnswered = False, wasEasy = False, wasEasyAnswered = True }
        }
      , Cmd.none
      )



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
      , div
          [ class "button-wrapper", onClick StartTraining ]
          [ button [ classList [ ( "button", True ), ( "-green", True ) ] ] [ text "Start Training" ] ]
      ]


traning_buttons : Int -> Int -> Html Msg
traning_buttons current_loop total_loops =
  if current_loop == total_loops then
    div
      [ class "button-wrapper", onClick EndTraining ]
      [ button [ classList [ ( "button", True ), ( "-green", True ) ] ] [ text "Finish Training" ] ]
  else
    div
      [ class "button-wrapper", onClick NextLoop ]
      [ button [ classList [ ( "button", True ), ( "-green", True ) ] ] [ text "Next Loop" ] ]


training_view : Model -> Html Msg
training_view model =
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
          [ text "Training" ]
      , div
          [ class "card" ]
          [ div
              [ class "card__completed" ]
              [ badge "✓" (toString model.day) "-purple" ]
          , div
              [ class "card__group" ]
              [ div [ class "card__label" ] [ text "Current traning: " ]
              , div
                  [ class "card__row" ]
                  (List.map exercise_column next_training)
              ]
          , div
              [ class "card__group" ]
              [ div [ class "card__label" ] [ text "Current loop: " ]
              , div
                  [ class "card__hero" ]
                  [ text (toString model.currentLoop) ]
              ]
          ]
      , traning_buttons model.currentLoop model.loops
      ]


after_training_view_step1 : Model -> Html Msg
after_training_view_step1 model =
  div
    []
    [ div
        [ class "card" ]
        [ div
            [ class "card__group" ]
            [ div [ class "card__label" ] [ text "Today's training has been completed!" ]
            , p [ class "card__text" ] [ text "Was it successful?" ]
            ]
        ]
    , div
        [ class "button-group" ]
        [ div
            [ class "button-wrapper", onClick TrainingWasSuccessful ]
            [ button [ classList [ ( "button", True ), ( "-green", True ) ] ] [ text "Yes" ] ]
        , div
            [ class "button-wrapper", onClick TrainingWasUnsuccessful ]
            [ button [ classList [ ( "button", True ), ( "-red", True ) ] ] [ text "No" ] ]
        ]
    ]


after_training_view_step2 : Model -> Html Msg
after_training_view_step2 model =
  div
    []
    [ div
        [ class "card" ]
        [ div
            [ class "card__group" ]
            [ div [ class "card__label" ] [ text "Awesome!" ]
            , p [ class "card__text" ] [ text "Was it easy?" ]
            ]
        ]
    , div
        [ class "button-group" ]
        [ div
            [ class "button-wrapper", onClick TrainingWasEasy ]
            [ button [ classList [ ( "button", True ), ( "-green", True ) ] ] [ text "Yes" ] ]
        , div
            [ class "button-wrapper", onClick TrainingWasDificult ]
            [ button [ classList [ ( "button", True ), ( "-red", True ) ] ] [ text "No" ] ]
        ]
    ]


after_training_view_step3 : Model -> Html Msg
after_training_view_step3 model =
  div
    []
    [ div
        [ class "card" ]
        [ div
            [ class "card__group" ]
            [ div [ class "card__label" ] [ text "Don't worry!" ]
            , p [ class "card__text" ] [ text "Let's continue with current load. We are not recommending to change anything." ]
            ]
        ]
    , div
        [ class "button-wrapper", onClick TrainingQuizComplete ]
        [ button [ classList [ ( "button", True ), ( "-green", True ) ] ] [ text "Continue" ] ]
    ]


after_training_view_step4 : Model -> Html Msg
after_training_view_step4 model =
  div
    []
    [ div
        [ class "card" ]
        [ div
            [ class "card__group" ]
            [ div [ class "card__label" ] [ text "Awesome!" ]
            , p [ class "card__text" ] [ text "We are recommending to increase training load by 1-2-2-2. Do you agree?" ]
            ]
        ]
    , div
        [ class "button-group" ]
        [ div
            [ class "button-wrapper", onClick PowerUp ]
            [ button [ classList [ ( "button", True ), ( "-green", True ) ] ] [ text "Yes" ] ]
        , div
            [ class "button-wrapper", onClick TrainingQuizComplete ]
            [ button [ classList [ ( "button", True ), ( "-red", True ) ] ] [ text "No" ] ]
        ]
    ]


after_training_view_step5 : Model -> Html Msg
after_training_view_step5 model =
  div
    []
    [ div
        [ class "card" ]
        [ div
            [ class "card__group" ]
            [ div [ class "card__label" ] [ text "Don't worry!" ]
            , p [ class "card__text" ] [ text "We are recommending to decrease training load by 1-2-2-2. Do you agree?" ]
            ]
        ]
    , div
        [ class "button-group" ]
        [ div
            [ class "button-wrapper", onClick PowerDown ]
            [ button [ classList [ ( "button", True ), ( "-green", True ) ] ] [ text "Yes" ] ]
        , div
            [ class "button-wrapper", onClick TrainingQuizComplete ]
            [ button [ classList [ ( "button", True ), ( "-red", True ) ] ] [ text "No" ] ]
        ]
    ]


after_training_view_steps : Model -> Html Msg
after_training_view_steps model =
  if model.afterTrainingQuiz.wasSuccessful && model.afterTrainingQuiz.wasSuccessfulAnswered then
    if model.afterTrainingQuiz.wasEasy && model.afterTrainingQuiz.wasEasyAnswered then
      after_training_view_step4 model
    else if not model.afterTrainingQuiz.wasEasy && model.afterTrainingQuiz.wasEasyAnswered then
      after_training_view_step3 model
    else
      after_training_view_step2 model
  else if not model.afterTrainingQuiz.wasSuccessful && model.afterTrainingQuiz.wasSuccessfulAnswered then
    after_training_view_step5 model
  else
    after_training_view_step1 model


after_training_view : Model -> Html Msg
after_training_view model =
  div
    []
    [ div
        [ class "title" ]
        [ text "After Training" ]
    , after_training_view_steps model
    ]


view : Model -> Html Msg
view model =
  if model.isTrainingStarted then
    training_view model
  else if model.isAfterTrainingStarted then
    after_training_view model
  else
    main_view model
