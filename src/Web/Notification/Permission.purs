module Web.Notification.Permission
	( Permission(..)
	, fromString
	, toString
	) where

import Prelude
import Data.Maybe (Maybe(..))

data Permission
	= Default
	| Denied
	| Granted

derive instance eqPermission :: Eq Permission
derive instance ordPermission :: Ord Permission

instance showPermission :: Show Permission where
	show = case _ of
		Default -> "Default"
		Denied -> "Denied"
		Granted -> "Granted"

fromString :: String -> Maybe Permission
fromString = case _ of
	"default" -> Just Default
	"denied" -> Just Denied
	"granted" -> Just Granted
	_ -> Nothing

toString :: Permission -> String
toString = case _ of
	Default -> "default"
	Denied -> "denied"
	Granted -> "granted"
