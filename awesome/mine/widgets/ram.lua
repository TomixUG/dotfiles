-------------------------------------------------
-- Ram widget
-------------------------------------------------

local wibox = require("wibox") -- Provides the widgets
local watch = require("awful.widget.watch")

-- Create the text widget
local ram_text = wibox.widget {
    -- font = "JetBrainsMono Nerd Font 9",
    widget = wibox.widget.textbox,
}

-- Create the background widget
local ram_widget = wibox.widget.background()
ram_widget:set_widget(ram_text) -- Put the text inside of it

-- Set the colors and some text
-- ram_widget:set_bg("#008800") -- Green background
ram_widget:set_fg("#ffffff") -- White text

watch('bash -c "echo $(free -h | awk \'/^Mem/ { print $3 }\' | sed s/i//g)"', 2,
    function(widget, stdout, stderr, exitreason, exitcode)
        -- Do something, for example
        ram_text:set_text(" " .. stdout)
    end, ram_widget)

-- Export the widget
return ram_widget
