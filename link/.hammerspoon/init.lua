hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}

require('watcher')
require('position')
require('layouts')

hs.hints.showTitleThresh = 0
hs.hotkey.bind(hypershift, "tab", function() hs.hints.windowHints(nil) end)

-- Applications
local bindings = {
  [hypershift] = {
    ['Finder']             = 'f',
    ['Calendar']           = 'c',
    ['Firefox Developer Edition'] = 'return',
    ['Sublime Text']       = 's',
    ['Sublime Merge']      = 'g',
    ['Quiver']             = 'q',
    ['PhpStorm']           = 'p',
    ['Visual Studio Code'] = 'v',
    ['Querious']           = 'l',
    ['Remember The Milk']  = 'r',
    ['Tyme2']              = 'y',
    ['Tower']              = 'o',
    ['Spotify']            = 'm',
    ['Telegram']           = '=',
  }
}
for modifiers, apps in pairs(bindings) do
  for name, key in pairs(apps) do
    hs.hotkey.bind(modifiers, key, function()
      hs.application.launchOrFocus(name)
    end)
  end
end
