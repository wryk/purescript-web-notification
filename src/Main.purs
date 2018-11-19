module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Web.Event.EventTarget (addEventListener, eventListener)
import Web.Notification.EventTypes as ET
import Web.Notification.Notification (create, permission, requestPermission, toEventTarget)
import Web.Notification.Permission (Permission(..))

main :: Effect Unit
main = do
	p <- permission
	log $ "Hello, actual permission is " <> (show p) <> "."

	case p of
		Default -> do
			requestPermission \newPermission -> do
				log $ "New permission is " <> (show newPermission) <> "."

		Denied ->
			log "Sadly, I can't send you my good quality notifications."

		Granted -> do
			log "Great, I'm sending you a good quality notification right now !"

			let title = "Good Quality Notification"
			let body = "Do you like my good quality notification ?"
			n <- create title { body }

			logClick <- eventListener $ const $ log "click"
			addEventListener ET.click logClick false (toEventTarget n)

			logClose <- eventListener $ const $ log "close"
			addEventListener ET.close logClose false (toEventTarget n)

			logError <- eventListener $ const $ log "error"
			addEventListener ET.error logError false (toEventTarget n)

			logShow <- eventListener $ const $ log "show"
			addEventListener ET.show logShow false (toEventTarget n)
