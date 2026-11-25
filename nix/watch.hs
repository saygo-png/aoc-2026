import System.Environment (getArgs)
import System.Process (callProcess)
import Text.Printf (printf)
import Text.Read (readMaybe)

main :: IO ()
main = do
  args <- getArgs
  let dayModule = printf "Day%02d" (readDay args)
  callProcess "ghcid" (ghcidArgs dayModule)

readDay :: [String] -> Int
readDay [day] | Just n <- readMaybe day = n
readDay _ = error "give one day number, e.g. watch 5"

ghcidArgs :: String -> [String]
ghcidArgs dayModule =
  [ "--command=cabal repl lib:aoc26 " <> quietRepl
  , "--warnings"
  , "--reload=inputs"
  , "--test=" <> dayModule <> ".main"
  ]

quietRepl :: String
quietRepl = "--repl-options=-Wno-prepositive-qualified-module --repl-options=-Wno-missing-export-lists"
