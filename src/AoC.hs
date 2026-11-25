module AoC (solve) where

import Control.Exception (try)
import Relude
import System.Directory (doesFileExist)
import Text.Printf (printf)

solve :: (Show a, Show b) => Int -> (Text -> a) -> (Text -> b) -> IO ()
solve day part1 part2 =
  forM_ [("example", printf "inputs/%02d.example.txt" day), ("input", printf "inputs/%02d.txt" day)] $ \(name, path) -> do
    exists <- doesFileExist path
    if not exists
      then putStrLn (name <> ": no " <> path <> " yet")
      else do
        input <- decodeUtf8 <$> readFileBS path
        run (name <> " part 1") (show (part1 input))
        run (name <> " part 2") (show (part2 input))
  where
    run :: String -> String -> IO ()
    run label answer = do
      result <- try (evaluateNF answer)
      putStrLn (label <> ": " <> either (\(e :: SomeException) -> "crashed: " <> takeWhile (/= '\n') (displayException e)) id result)
