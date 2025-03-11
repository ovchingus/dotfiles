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

sbar.add("event", "input.changed", "AppleSelectedInputSourcesChangedNotification")

local input = sbar.add("item", {
 icon = { drawing = false },
 label = get_input_source_name(),
 position = "right",
})

input:subscribe("input.changed", function(_)
 input:set({
   label = get_input_source_name()
 })
end)

input:subscribe("mouse.clicked", function(_)
  -- use cmd space to change lang
 sbar.exec("osascript -e 'tell application \"System Events\" to key code 49 using command down'")
end)