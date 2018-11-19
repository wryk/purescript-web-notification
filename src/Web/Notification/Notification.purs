module Web.Notification.Notification
	( Notification
	, fromEventTarget
	, toEventTarget
	, create
	, permission
	, requestPermission
	) where

import Prelude

import Data.Maybe (Maybe, fromMaybe)
import Effect (Effect)
import Effect.Uncurried
import Foreign (Foreign)
import Type.Row (class Union)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.EventTarget (EventTarget)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.Notification.Permission (Permission)
import Web.Notification.Permission as Permission

foreign import data Notification :: Type

fromEventTarget :: EventTarget -> Maybe Notification
fromEventTarget = unsafeReadProtoTagged "Notification"

toEventTarget :: Notification -> EventTarget
toEventTarget = unsafeCoerce

type Options =
	( body :: String
	, data :: Foreign
	, dir :: String
	, icon :: String
	, lang :: String
	, tag :: String
	-- -- seems to have bad support
	-- , image :: String
	-- , vibrate :: Array Int
	-- , renotify :: Boolean
	-- , requireInteraction :: Boolean
	-- , actions :: Array NotificationAction
	-- , silent :: Boolean
	-- , noscreen :: Boolean
	-- , sticky :: Boolean
	)

create
	:: ∀ options trash
	. Union options trash Options
	=> String
	-> Record options
	-> Effect Notification
create = runEffectFn2 createImpl

foreign import createImpl
	:: ∀ options
	. EffectFn2
		String
		(Record options)
		Notification

permission :: Effect Permission
permission = map (fromMaybe Permission.Default <<< Permission.fromString) permissionImpl 

foreign import permissionImpl :: Effect String

requestPermission :: (String -> Effect Unit) -> Effect Unit
requestPermission fn = runEffectFn2 requestPermissionImpl unit (mkEffectFn1 fn)

foreign import requestPermissionImpl :: EffectFn2 Unit (EffectFn1 String Unit) Unit


-- body :: Notification -> String
-- body = bodyImpl
--
-- foreign import bodyImpl :: Notification -> String
--
-- -- should be Foreign
-- data_ :: ∀ a. Notification -> a
-- data_ = dataImpl
--
-- foreign import dataImpl :: ∀ a. Notification -> a
--
-- dir :: Notification -> Direction
-- dir = fromMaybe (Direction.Auto) <<< Direction.parse <<< dirImpl
--
-- foreign import dirImpl :: Notification -> String
--
-- icon :: Notification -> String
-- icon = iconImpl
--
-- foreign import iconImpl :: Notification -> String
--
-- lang :: Notification -> String
-- lang = langImpl
--
-- foreign import langImpl :: Notification -> String
--
-- tag :: Notification -> String
-- tag = tagImpl
--
-- foreign import tagImpl :: Notification -> String
--
-- title :: Notification -> String
-- title = titleImpl
--
-- foreign import titleImpl :: Notification -> String
