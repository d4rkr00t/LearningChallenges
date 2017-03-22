module Main where

import Prelude
import Data.Path
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Array (concatMap, filter, (:))

allFiles :: Path -> Array Path
allFiles file = file : concatMap allFiles (ls file)

allFiles' :: Path -> Array Path
allFiles' file = file : do
  child <- ls file
  allFiles' child

onlyFiles :: Path -> Array Path
onlyFiles file = file : do
  child <- filter (\f -> not isDirectory f) (ls file)
  onlyFiles child

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "Hello sailor!"

