module Web.Notification.Direction where

import Prelude
import Data.Maybe (Maybe(..))

data Direction
	= Auto
	| LeftToRight
	| RightToLeft

derive instance eqDirection :: Eq Direction
derive instance ordDirection :: Ord Direction

instance showDirection :: Show Direction where
	show = case _ of
		Auto -> "Auto"
		LeftToRight -> "LeftToRight"
		RightToLeft -> "RightToLeft"

print :: Direction -> String
print = case _ of
	Auto -> "auto"
	LeftToRight -> "ltr"
	RightToLeft -> "rtl"

parse :: String -> Maybe Direction
parse = case _ of
	"auto" -> Just Auto
	"ltr" -> Just LeftToRight
	"rtl" -> Just RightToLeft
	_ -> Nothing
