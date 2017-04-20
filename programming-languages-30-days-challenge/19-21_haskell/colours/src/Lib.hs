module Lib
    ( someFunc
    ) where

import Graphics.Image as I
import System.Random

getImageData :: FilePath -> IO (I.Image I.VU I.RGB Double)
getImageData path = I.readImageRGB I.VU path

someFunc :: IO ()
someFunc = do
    img <- getImageData "img/avatar.png"
    case img of
        Just img -> print (cols img)
        _ -> remaining
