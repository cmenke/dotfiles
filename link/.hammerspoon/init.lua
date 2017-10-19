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
    ['Google Chrome']      = 'return',
    ['Sublime Text']       = 's',
    ['Quiver']             = 'q',
    ['PhpStorm']           = 'p',
    ['Visual Studio Code'] = 'v',
    ['Sequel Pro']         = 'l',
    ['Remember The Milk']  = 'r',
    ['Tyme2']              = 'y',
  }
}
for modifiers, apps in pairs(bindings) do
  for name, key in pairs(apps) do
    hs.hotkey.bind(modifiers, key, function()
      hs.application.launchOrFocus(name)
    end)
  end
end
