module Main where

import Prelude
import Data.Path
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Array (concatMap, filter, (:))
import Data.Foldable (foldl)
import Math ((%))

allFiles :: Path -> Array Path
allFiles file = file : concatMap allFiles (ls file)

allFiles' :: Path -> Array Path
allFiles' file = file : do
  child <- ls file
  allFiles' child

onlyFiles :: Path -> Array Path
onlyFiles file = filter (\f -> not isDirectory f) (allFiles' file)

trueIfEven :: Number -> Boolean
trueIfEven int =
  if int % 2.0 == 0.0 then true else false

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "Hello sailor!"

