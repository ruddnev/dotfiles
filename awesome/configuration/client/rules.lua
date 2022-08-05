local awful = require('awful')
local gears = require('gears')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false
    }
  },
  {
    rule_any = {name = {'QuakeTerminal'}},
    properties = {skip_decoration = true}
  },
  {
    rule_any = {name = {'vlc'}},
    properties = {
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end,
      skip_decoration = true
    }
  },
  {
    rule_any = {name = {'mpv'}},
    properties = {
      skip_decoration = true,
      placement = awful.placement.centered,
      ontop = true,
      -- floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end
    }
  },
  -- Titlebars
  {
    rule_any = {
      -- id = {'0x1800042'},
      type = {'dialog'},
      name = {'VDU Controls', 'ObinsKit', 'Picture in picture'},
      class = {'Wicd-client.py', 'calendar.google.com'}
    },
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end,
      skip_decoration = true
    }
  }
}
