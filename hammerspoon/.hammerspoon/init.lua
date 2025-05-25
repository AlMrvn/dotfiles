-- Hammerspoon Configuration
-- This file contains your Hammerspoon configuration

-- Load the WindowHalfsAndThirds spoon
hs.loadSpoon("WindowHalfsAndThirds")

-- Function to launch WezTerm
local function launchWezTerm()
	hs.application.launchOrFocus("WezTerm")
end

-- Bind Ctrl+Cmd+W to launch WezTerm
hs.hotkey.bind({ "ctrl", "cmd" }, "w", function()
	launchWezTerm()
	-- Show a small alert to confirm the action
	hs.alert.show("Launching WezTerm", 1)
end)

-- Configure WindowHalfsAndThirds with default hotkeys
spoon.WindowHalfsAndThirds:bindHotkeys(spoon.WindowHalfsAndThirds.defaultHotkeys)

-- Print a message when the configuration is loaded
print("Hammerspoon configuration loaded successfully!")
