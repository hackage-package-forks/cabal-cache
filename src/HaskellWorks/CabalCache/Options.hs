module HaskellWorks.CabalCache.Options
  ( readOrFromTextOption,
  ) where

import Amazonka.Data.Text    (FromText (..), fromText)
import Options.Applicative   (Parser, Mod, OptionFields)
import Text.Read             (readEither)

import qualified Data.Text            as T
import qualified Options.Applicative  as OA

readOrFromTextOption :: (Read a, FromText a) => Mod OptionFields a -> Parser a
readOrFromTextOption =
  let fromStr s = case readEither s of
        Left _ -> fromText (T.pack s)
        Right x -> x
  in OA.option $ OA.eitherReader fromStr
