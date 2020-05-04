-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify { preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors }
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify { preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) }
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
beautiful.init("/home/matte/.config/awesome/theme.lua")

local terminal = os.getenv("TERMINAL") or "alacritty"
local browser = os.getenv("BROWSER") or "chromium"
local modkey = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Wibar
-- Create a textclock widget
local time_formats = {
    normal = "  %d %B %H:%M  ",
    extended = "  %A %d %B %H:%M:%S  "
}
local textclock = wibox.widget.textclock(time_formats.normal)
textclock:connect_signal("button::press", function (self)
    if self.format == time_formats.normal then
        self.format = time_formats.extended
        self.refresh = 1
        return
    end
    self.format = time_formats.normal
    self.refresh = 60
end)

local volumebar = wibox.widget.textbox "VOL  "
volumebar:connect_signal("button::press", function(_, _, _, button)
    local cmd = ({
        [4] = "volup",
        [5] = "voldown",
        [1] = "voltoggle",
        [3] = "volinfos"
    })[button]

    if cmd == nil then return end
    awful.spawn(cmd)
end)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function (t) t:view_only() end),
                    awful.button({ modkey }, 1, function (t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function (t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function (t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function (t) awful.tag.viewprev(t.screen) end)
                )

awful.screen.connect_for_each_screen(function (s)
    -- Each screen has its own tag table
    local l = awful.layout.suit
    awful.tag(
        { "main", "www", "telegram", "spotify", "5", "6", "7", "8", "9" },
        s,
        {
            l.tile.right,
            l.tile.right,
            l.tile.right,
            l.tile.right,
            l.tile.right,
            l.tile.right,
            l.tile.right,
            l.tile.right,
            l.tile.right
        }
    )

    -- Create an imagebox widget which will contain an icon indicating which
    -- layout we're using
    s.layoutbox = awful.widget.layoutbox(s)
    -- Iterate layout: left click or wheel up to increment, right click or
    -- wheel down to decrement
    s.layoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    s.taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    s.wibox = awful.wibar {
        position = "bottom",
        screen = s,
        border_width = 14,
        border_color = beautiful.bg_normal
    }

    s.wibox:setup {
        layout = wibox.layout.align.horizontal,
        -- Left Widgets
        {
            layout = wibox.layout.fixed.horizontal,
            s.taglist,
        },
        -- Center
        nil,
        -- Right
        {
            layout = wibox.layout.fixed.horizontal,
            volumebar,
            wibox.widget.systray(),
            textclock,
            s.layoutbox,
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    -- awful.button({ }, 3, awful.tag.viewnext),
    -- awful.button({ }, 1, awful.tag.viewprev),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
local globalkeys = gears.table.join(
    -- awesome
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
              { description="show help", group="awesome" }),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              { description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
              { description = "quit awesome", group = "awesome"}),

    -- tag
    awful.key({ modkey }, "Left", awful.tag.viewprev,
              { description = "focus previous", group = "tag" }),
    awful.key({ modkey }, "Right", awful.tag.viewnext,
              { description = "focus next", group = "tag" }),
    awful.key({ modkey }, "Escape", awful.tag.history.restore,
              { description = "focus last focused", group = "tag" }),

    -- client
    awful.key({ modkey }, "j",
        function ()
            awful.client.focus.byidx(1)
        end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key({ modkey }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        { description = "focus previous by index", group = "client" }
    ),
    awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx(1) end,
              { description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx(-1) end,
              { description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative(1) end,
              { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey }, "u", awful.client.urgent.jumpto,
              { description = "focus urgent client", group = "client" }),
    awful.key({ modkey }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "focus last focused", group = "client" }
    ),
    awful.key({ modkey, "Control" }, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
              c:emit_signal(
                  "request::activate", "key.unminimize", { raise = true }
              )
            end
        end,
        { description = "restore minimized", group = "client" }
    ),

    -- layout
    awful.key({ modkey, "Shift" }, "Down", function () awful.client.incwfact(0.05) end),
    awful.key({ modkey, "Shift" }, "Up", function () awful.client.incwfact(-0.05) end),
    awful.key({ modkey }, "l", function () awful.tag.incmwfact(0.05) end,
              { description = "increase master width factor", group = "layout" }),
    awful.key({ modkey }, "h", function () awful.tag.incmwfact(-0.05) end,
              { description = "decrease master width factor", group = "layout" }),
    awful.key({ modkey, "Shift" }, "h", function () awful.tag.incnmaster(1, nil, true) end,
              { description = "increase the number of master clients", group = "layout" }),
    awful.key({ modkey, "Shift" }, "l", function () awful.tag.incnmaster(-1, nil, true) end,
              { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol(1, nil, true) end,
              { description = "increase the number of columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end,
              { description = "decrease the number of columns", group = "layout" }),
    -- awful.key({ modkey }, "space", function () awful.layout.inc(1) end,
    --           { description = "select next", group = "layout" }),
    -- awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(-1) end,
    --           { description = "select previous", group = "layout" }),

    -- XF86 keys
    awful.key({ }, "XF86PowerOff",
        function ()
            awful.spawn("sh -c \"prompt 'Shutdown computer?' 'systemctl poweroff'\"")
        end,
        { description = "shutdown pc", group = "launcher" }
    ),
    awful.key({ }, "XF86Calculator",
        function ()
            awful.spawn(terminal .. "-e insect")
        end,
        { description = "open a calculator", group = "launcher" }
    ),
    awful.key({ }, "XF86Sleep",
        function ()
            awful.spawn("sh -c \"prompt 'Suspend computer?' 'systemctl suspend'\"")
        end,
        { description = "suspend pc", group = "launcher" }
    ),
    awful.key({ }, "XF86WWW",
        function ()
            awful.spawn(browser)
        end,
        { description = "open " .. browser, group = "launcher" }
    ),
    awful.key({ }, "XF86DOS",
        function ()
            awful.spawn(terminal)
        end,
        { description = "open " .. terminal, group = "launcher" }
    ),
    awful.key({ }, "XF86ScreenSaver",
        function ()
            awful.spawn("sh -c \"slock; xset dpms force off\"")
        end,
        { description = "open slock", group = "launcher" }
    ),
    awful.key({ }, "XF86TaskPane",
        function ()
            awful.spawn(terminal .. "-e htop")
        end,
        { description = "open htop", group = "launcher" }
    ),
    awful.key({ }, "XF86MonBrightnessDown",
        function ()
            awful.spawn("xbacklight -dec 5")
        end,
        { description = "decrease brightness", group = "launcher" }
    ),
    awful.key({ }, "XF86MonBrightnessUp",
        function ()
            awful.spawn("xbacklight -inc 5")
        end,
        { description = "increse brightness", group = "launcher" }
    ),
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            awful.spawn("volup")
        end,
        { description = "increase volume", group = "launcher" }
    ),
    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            awful.spawn("voldown")
        end,
        { description = "decrease volume", group = "launcher" }
    ),
    awful.key({ }, "XF86AudioMute",
        function ()
            awful.spawn("voltoggle")
        end,
        { description = "toggle volume", group = "launcher" }
    ),
    awful.key({ }, "XF86AudioMicMute",
        function ()
            awful.spawn("mictoggle")
        end,
        { description = "toggle microphone", group = "launcher" }
    ),
    awful.key({ }, "XF86AudioPrev",
        function ()
            awful.spawn("playerctl previous")
        end,
        { description = "previous song", group = "launcher" }
    ),
    awful.key({ }, "XF86AudioPlay",
        function ()
            awful.spawn("playerctl play-pause")
        end,
        { description = "toggle play-pause", group = "launcher" }
    ),
    awful.key({ }, "XF86AudioNext",
        function ()
            awful.spawn("playerctl next")
        end,
        { description = "next song", group = "launcher" }
    ),

    -- launcher
    awful.key({ modkey }, "d", function () awful.spawn("rofi -show run") end,
              { description = "open rofi", group = "launcher" }),
    awful.key({ modkey }, "t", function () awful.spawn("telegram-desktop") end,
              { description = "open telegram", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "s", function () awful.spawn("flameshot gui") end,
              { description = "open flameshot", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "c",
        function ()
            awful.spawn("sh -c \"xcolor | tr -d '\n' | xclip -sel clipboard\"")
        end,
        { description = "open flameshot", group = "launcher" }
    ),
    awful.key({ "Control" }, "Escape",
        function ()
            awful.spawn("/home/matte/.cargo/bin/xcursorlocate")
        end,
        { description = "open xcursorlocate", group = "launcher" }
    ),
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
              { description = "open " .. terminal, group = "launcher"})
)

local layout_popup = awful.popup {
    widget = wibox.widget {
        awful.widget.layoutlist {
            base_layout = wibox.widget {
                spacing = 5,
                forced_num_cols = 5,
                layout = wibox.layout.grid.vertical,
            },
            widget_template = {
                {
                    {
                        id = 'icon_role',
                        forced_height = 44,
                        forced_width = 44,
                        widget = wibox.widget.imagebox,
                    },
                    margins = 4,
                    widget = wibox.container.margin,
                },
                id = 'background_role',
                forced_width = 48,
                forced_height = 48,
                widget = wibox.container.background,
            },
        },
        margins = 4,
        widget = wibox.container.margin,
    },
    border_color = beautiful.fg_normal,
    border_width = beautiful.border_width,
    placement = awful.placement.centered,
    ontop = true,
    visible = false
}

awful.keygrabber {
    start_callback = function() layout_popup.visible = true end,
    stop_callback = function() layout_popup.visible = false end,
    export_keybindings = true,
    release_event = 'release',
    stop_key = {'Escape', 'Super_L', 'Super_R', ' '},
    keybindings = {
        { { modkey } , 'space', function () awful.layout.inc(1) end },
        { { modkey, 'Shift' } , 'space', function () awful.layout.inc(-1) end },
    }
}

local clientkeys = gears.table.join(
    awful.key({ modkey }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }
    ),
    awful.key({ modkey }, "q", function (c) c:kill() end,
              { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
              { description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              { description = "move to master", group = "client" }),
    awful.key({ modkey }, "o", function (c) c:move_to_screen() end,
              { description = "move to screen", group = "client" }),
    awful.key({ modkey }, "t", function (c) c.ontop = not c.ontop end,
              { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        { description = "minimize", group = "client" }
    ),
    awful.key({ modkey }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        { description = "(un)maximize", group = "client" }
    ),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description = "(un)maximize vertically", group = "client" }
    ),
    awful.key({ modkey, "Shift" }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        { description = "(un)maximize horizontally", group = "client" }
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only
        awful.key({ modkey }, "#" .. i + 9,
              function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                       tag:view_only()
                    end
              end,
              { description = "view tag #" .. i, group = "tag" }
        ),
        -- Toggle tag display
        awful.key({ modkey, "Control" }, "#" .. i + 9,
              function ()
                  local screen = awful.screen.focused()
                  local tag = screen.tags[i]
                  if tag then
                     awful.tag.viewtoggle(tag)
                  end
              end,
              { description = "toggle tag #" .. i, group = "tag" }
        ),
        -- Move client to tag
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
              function ()
                  if client.focus then
                      local tag = client.focus.screen.tags[i]
                      if tag then
                          client.focus:move_to_tag(tag)
                      end
                 end
              end,
              { description = "move focused client to tag #" .. i, group = "tag" }
        ),
        -- Toggle tag on focused client
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
              function ()
                  if client.focus then
                      local tag = client.focus.screen.tags[i]
                      if tag then
                          client.focus:toggle_tag(tag)
                      end
                  end
              end,
              { description = "toggle focused client on tag #" .. i, group = "tag" }
        )
    )
end

local clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal)
awful.rules.rules = {
    -- All clients will match this rule
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            maximized_horizontal = false,
            maximized_vertical = false,
            maximized = false,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },
    -- Floating clients
    {
        rule_any = {
            instance = {
                -- Includes session name in class
                "copyq",
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Sxiv",
            },
            -- Note that the name property shown in xprop might be set slightly
            -- after creation of the client and the name shown there might not
            -- match defined rules here
            name = {
                -- xev
                "Event Tester",
            },
            role = {
                -- e.g. Google Chrome's (detached) Developer Tools
                "pop-up",
            }
        },
        properties = { floating = true }
    },
    -- Add titlebars to normal clients and dialogs
    {
        rule_any = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false }
    },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules
client.connect_signal("request::titlebars", function (c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function ()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function ()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        -- Left
        {
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        -- Middle
        {
            -- Title
            {
                align = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        -- Right
        {
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse
client.connect_signal("mouse::enter", function (c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function (c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function (c) c.border_color = beautiful.border_normal end)
-- }}}
