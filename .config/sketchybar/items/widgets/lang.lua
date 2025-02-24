local colors = require("colors")
local settings = require("settings")

local function get_input_source_name()
	-- Run defaults command and capture its output
	local handle = io.popen("defaults read com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID")
	local source = handle:read("*a")
	handle:close()

	-- Remove trailing whitespace/newline
	source = source:gsub("^%s*(.-)%s*$", "%1")

	-- Map input sources to labels
	local input_map = {
		["com.apple.keylayout.ABC"] = "en",
		["com.apple.keylayout.Russian"] = "ru",
	}

	return input_map[source] or source
end

sbar.add("event", "system_lang_changed", "AppleSelectedInputSourcesChangedNotification")

local lang = sbar.add("item", "widgets.lang", {
	icon = { drawing = false },
	label = get_input_source_name(),
	position = "right",
})

lang:subscribe("system_lang_changed", function(_)
	lang:set({
		label = get_input_source_name(),
	})
end)

lang:subscribe("mouse.clicked", function(_)
	sbar.exec("osascript -e 'tell application \"System Events\" to key code 49 using command down'")
end)

-- Background around the cpu item
sbar.add("bracket", "widgets.lang.bracket", { lang.name }, {
	background = { color = colors.bg1 },
})

-- Background around the cpu item
sbar.add("item", "widgets.lang.padding", {
	position = "right",
	width = settings.group_paddings,
})
