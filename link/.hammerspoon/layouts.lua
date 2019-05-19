-- https://github.com/cmsj/hammerspoon-config

local grd = require("layout_helpers")

-------------------------------
-- Display Configuration
-------------------------------
local display_count = #hs.screen.allScreens()
local display = {
  primary = hs.screen{x=0,y=0},
  left = hs.screen{x=-1,y=0},
  right = hs.screen{x=1,y=0},
}

-- Define window layouts
--   Format: {"App name", "Window name", "Display Name", "unitrect", "framerect", "fullframerect"},
--   unitrect can be set with grd.rect(x, w=12/12, y=1, h=12/12, s=12)
local layouts = {
  base = {
    p3840 = {
      -- [  38  ] (3840x1600)
      {"Code",          nil, display.primary, grd.rect(5, 2/3), nil, nil},
      {"PhpStorm",      nil, display.primary, grd.rect(5, 2/3), nil, nil},

      {"iTerm2",        nil, display.primary, grd.rect(1, 1/3, 1, 4/12), nil, nil},
      {"Google Chrome", grd.lookupWin({"menke.co", "anf"}), display.primary, grd.rect(1, 1/3, 5), nil, nil},
      {"Firefox Developer Edition",nil, display.primary, grd.rect(1, 1/3, 5), nil, nil},
      {"Paw",           nil, display.primary, grd.rect(1, 1/3, 5), nil, nil},
    },

    -- [ 27 ][  38  ][22]
    p3840l2560r1080 = {
      -- [  38  ] (3840x1600)
      {"Code",          nil, display.primary, grd.rect(1, 2/3), nil, nil},
      {"PhpStorm",      nil, display.primary, grd.rect(1, 2/3), nil, nil},
      {"iTerm2",        nil, display.primary, grd.rect(9, nil, 1, 4/12), nil, nil},
      {"Google Chrome", grd.lookupWin({"menke.co", "anf"}), display.primary, grd.rect(9, nil, 5), nil, nil},
      {"Paw",           nil, display.primary, grd.rect(9, nil, 5), nil, nil},
      -- [ 27 ] (2560x1440)
      {"Sublime Merge", nil, display.left, grd.rect(7, 1/2), nil, nil},
      {"Google Chrome", grd.lookupWin({"Privat"}), display.left, grd.rect(4, 1/2), nil, nil},
      -- [22] (1080x1920)
      {"Telegram",      nil, display.right, grd.rect(4, 2/5, 1, 2/5, 5), nil, nil},
      {"Tweetbot",      nil, display.right, grd.rect(1, 3/5, 1, 2/5, 5), nil, nil},
      {"Spotify",       nil, display.right, grd.rect(1, 1, 3, 3/5, 5), nil, nil},
    },
  },
  priv = {
    p3840 = {
      -- [  38  ] (3840x1600)
      {"Spotify",       nil, display.primary, grd.rect(1, 4/12, 5), nil, nil},
      {"Google Chrome", grd.lookupWin({"Privat"}), display.primary, grd.rect(5, 6/12), nil, nil},
      {"Tweetbot",      nil, display.primary, grd.rect(11.5), nil, nil},
      {"Telegram",      nil, display.primary, grd.rect(11.5), nil, nil},
    },
  },
}

hs.hotkey.bind(hypershift, '1', function() grd.apply(layouts.base, display) end)
hs.hotkey.bind(hypershift, '2', function() grd.apply(layouts.priv, display) end)

-- local chrome = hs.application.applicationsForBundleID('com.google.Chrome')[1]
-- if chrome ~= nil then
-- chrome:activate()
-- chrome:selectMenuItem({'People', 'menke.co'})
-- end
