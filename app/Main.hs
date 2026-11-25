-- | cabal run aoc26 -- DAY
module Main (main) where

import Day01 qualified
import Day02 qualified
import Day03 qualified
import Day04 qualified
import Day05 qualified
import Day06 qualified
import Day07 qualified
import Day08 qualified
import Day09 qualified
import Day10 qualified
import Day11 qualified
import Day12 qualified
import Relude

main :: IO ()
main = do
  args <- getArgs
  case args >>= toList . readMaybe of
    [day] | Just run <- days !!? (day - 1) -> run
    _ -> die "usage: aoc26 DAY"
  where
    days =
      [ Day01.main
      , Day02.main
      , Day03.main
      , Day04.main
      , Day05.main
      , Day06.main
      , Day07.main
      , Day08.main
      , Day09.main
      , Day10.main
      , Day11.main
      , Day12.main
      ]
