module Web.Notification.EventTypes where

import Web.Event.Event (EventType(..))

click :: EventType
click = EventType "click"

close :: EventType
close = EventType "close"

error :: EventType
error = EventType "error"

show :: EventType
show = EventType "show"
