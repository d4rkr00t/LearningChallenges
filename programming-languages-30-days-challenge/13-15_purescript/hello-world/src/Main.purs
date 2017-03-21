module Main where

import Prelude
import Control.Monad.Eff.Console (logShow)
import Math (sqrt, pi)

diagonal w h = sqrt (w * w + h * h)

circle_area r = pi * (r * r)

main =
    logShow (circle_area 3.0)
