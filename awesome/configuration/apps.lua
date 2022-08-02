local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi'
-- -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'" WTF IS THIS

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'alacritty',
    screenshot = 'flameshot screen -p ~/Pictures',
    region_screenshot = 'flameshot gui',
    delayed_screenshot = 'flameshot screen -p ~/Pictures -d 5000',
    browser = 'google-chrome-stable',
    editor = 'subl', -- gui text editor
    social = 'telegram',
    game = rofi_command,
    files = 'nautilus',
    music = rofi_command 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {


    'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    
    'pactl unload-module module-suspend-on-idle', -- stop buzzing by preventing power save on audio output

    'nm-applet --indicator', -- wifi
    -- 'blueberry-tray', -- Bluetooth tray icon
    --'xfce4-power-manager', -- Power manager
    'numlockx on', -- enable numlock

    'pnmixer', -- shows an audiocontrol applet in systray when installed.
    'redshift-gtk -l 59.94:30.25', -- f.lux alternative
    'flameshot', -- screenshots
    'vdu_controls', -- display brightness control

    'nvidia-settings --assign GPULogoBrightness=0', -- disable LED on gpu
    'openrgb -c black', -- disable LED on ram

    -- 'feh --randomize --bg-fill --no-xinerama ~/Wallpapers/Usage/*', -- wallpaper thing
    'sh ~/Wallpapers/thescript.sh', -- wallpaper thing
    -- '/usr/bin/variety', -- wallpaper thing too


    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions


  }
}
