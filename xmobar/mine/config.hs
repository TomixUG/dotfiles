-- Xmobar (http://projects.haskell.org/xmobar/)
-- This is one of the xmobar configurations for DTOS.
-- This config is packaged in the DTOS repo as 'dtos-xmobar'
-- Color scheme: Palenight
-- Dependencies:
   -- otf-font-awesome
   -- ttf-mononoki
   -- ttf-ubuntu-font-family
   -- htop
   -- emacs
   -- pacman (Arch Linux)
   -- trayer
   -- 'dtos-local-bin' (from dtos-core-repo)

Config { font            = "Ubuntu Bold 9"
       , additionalFonts = [ "Mononoki 11"
                           , "Font Awesome 6 Free Solid 12"
                           , "Font Awesome 6 Brands 12"
                           ]
       , bgColor      = "#292d3e"
       , fgColor      = "#f07178"
       -- Position TopSize and BottomSize take 3 arguments:
       --   an alignment parameter (L/R/C) for Left, Right or Center.
       --   an integer for the percentage width, so 100 would be 100%.
       --   an integer for the minimum pixel height for xmobar, so 24 would force a height of at least 24 pixels.
       --   NOTE: The height should be the same as the trayer (system tray) height.
       , position       = TopSize L 100 24
       , lowerOnStart = True
       , hideOnStart  = False
       , allDesktops  = True
       , persistent   = True
       , iconRoot     = ".xmonad/xpm/"  -- default: "."
       , commands = [
                        -- Echos a "penguin" icon in front of the kernel output.
                      -- Run Com "echo" ["<fn=3>\xf17c</fn>"] "penguin" 3600
                        -- Get kernel version (script found in .local/bin)
                    -- , Run Com "kernel" [] "kernel" 36000
                        -- Cpu usage in percent
                    Run Cpu ["-t", "<fn=2>\xf108</fn>  <total>%","-H","50","--high","red"] 20
                        -- Ram used percentage
                    , Run Memory ["-t", "<fn=2>\xf538</fn>  <usedratio>%"] 20
                        -- Disk space free
                    -- , Run DiskU [("/", "<fn=2>\xf0c7</fn>  hdd: <free> free")] [] 60
                        -- Echos an "up arrow" icon in front of the uptime output.
                    -- , Run Com "echo" ["<fn=2>\xf0aa</fn>"] "uparrow" 3600
                        -- Uptime
                    -- , Run Uptime ["-t", "uptime: <days>d <hours>h"] 360
                        -- Echos a "bell" icon in front of the pacman updates.
                    -- , Run Com "echo" ["<fn=2>\xf0f3</fn>"] "bell" 3600
                        -- Check for pacman updates (script found in .local/bin)
                    -- , Run Com ".local/bin/pacupdate" [] "pacupdate" 36000
                        -- Echos a "battery" icon in front of the pacman updates.
                    , Run Com "echo" ["<fn=2>\xf242</fn>"] "baticon" 3600
                        -- Battery
                    , Run BatteryP ["BAT0"] ["-t", "<acstatus><watts> (<left>%)"] 360
                        -- Time and date
                    , Run Date "<fn=2>\xf017</fn>  %b %d %Y - (%H:%M) " "date" 50
                        -- Script that dynamically adjusts xmobar padding depending on number of trayer icons.
                    , Run Com ".config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 40

                    -- Echos a "music" icon in front of the pacman updates.
                    , Run Com "echo" ["<fn=2>\xf028</fn>"] "volumeicon" 3600
                    -- get music information
                    , Run Com ".config/xmobar/audio.sh" ["status"] "volume" 10

                    -- Echos a "volume" icon in front of the pacman updates.
                    , Run Com "echo" ["<fn=2>\xf001</fn>"] "musicicon" 3600
                    -- get music information
                    , Run Com ".config/xmobar/music.sh" [] "music" 20


                        -- Prints out the left side items such as workspaces, layout, etc.
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "  %UnsafeStdinReader% }{ <box type=Bottom width=2 mb=2 color=#82aaff><fc=#82aaff><action=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause` button=1><action=`playerctl next` button=3>%musicicon%  %music%</action></action></fc></box>     <box type=Bottom width=2 mb=2 color=#C792EA><fc=#C792EA><action=`~/.config/xmobar/audio.sh up` button=4><action=`~/.config/xmobar/audio.sh down` button=5><action=`~/.config/xmobar/audio.sh mute` button=1>%volumeicon%  %volume%</action></action></action></fc></box>     <box type=Bottom width=2 mb=2 color=#ffcb6b><fc=#ffcb6b><action=`alacritty -e htop`>%cpu%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#f07178><fc=#f07178><action=`alacritty -e htop`>%memory%</action></fc></box>   <box type=Bottom width=2 mb=2 color=#c3e88d><fc=#c3e88d>%baticon%  %battery%</fc></box>    <box type=Bottom width=2 mb=2 color=#a3f7ff><fc=#a3f7ff><action=`emacsclient -c -a 'emacs' --eval '(doom/window-maximize-buffer(dt/year-calendar))'`>%date%</action></fc></box> %trayerpad%"
       }


