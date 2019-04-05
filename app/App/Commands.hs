module App.Commands where

import App.Commands.SyncToArchive
import Data.Semigroup             ((<>))
import Options.Applicative

commands :: Parser (IO ())
commands = commandsGeneral

commandsGeneral :: Parser (IO ())
commandsGeneral = subparser $ mempty
  <>  commandGroup "Commands:"
  <>  cmdSyncToArchive
