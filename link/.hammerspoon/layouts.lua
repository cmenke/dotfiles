-- https://github.com/cmsj/hammerspoon-config

-- Define monitor names for layout purposes
display_main = "Color LCD"
display_ext_1 = "DELL U2414H"
display_ext_uw_1 = "DELL U3818DW"

-- Define window layouts
--   Format reminder:
--     {"App name", "Window name", "Display Name", "unitrect", "framerect", "fullframerect"},
internal_display = {
    {"IRC",               nil, display_main, hs.layout.maximized, nil, nil},
    {"PhpStorm",          nil, display_main, hs.layout.maximized, nil, nil},
    {"Google Chrome",     nil, display_main, hs.layout.maximized, nil, nil},
    {"Sublime Text",      nil, display_main, hs.layout.maximized, nil, nil},
    {"Calendar",          nil, display_main, hs.layout.maximized, nil, nil},
}

dual_display = {
    {"Code",              nil, display_main, hs.layout.maximized, nil, nil},
    {"PhpStorm",          nil, display_main, hs.layout.maximized, nil, nil},
    {"Google Chrome",     nil, display_ext_1, hs.geometry.unitrect(0, 0, 2/3, 1), nil, nil},
    {"Paw",               nil, display_ext_1, hs.geometry.unitrect(0, 0, 2/3, 1), nil, nil},
    {"Quiver",            nil, display_ext_1, hs.geometry.unitrect(2/3, 0, 1/3, 1), nil, nil},
    {"Skype",             nil, display_ext_1, hs.geometry.unitrect(2/3, 0, 1/3, 1), nil, nil},
}

webdev_uw = {
    -- 2/6 - left
    {"Google Chrome",     nil, display_ext_uw_1, hs.geometry.unitrect(0, 1/3, 1/3, 2/3), nil, nil},
    {"Paw",               nil, display_ext_uw_1, hs.geometry.unitrect(0, 1/3, 1/3, 2/3), nil, nil},
    {"iTerm2",            nil, display_ext_uw_1, hs.geometry.unitrect(0, 0, 1/3, 1/3), nil, nil},
    -- 3/6 - main
    {"Code",              nil, display_ext_uw_1, hs.geometry.unitrect(1/3, 0, 1/2, 1), nil, nil},
    {"PhpStorm",          nil, display_ext_uw_1, hs.geometry.unitrect(1/3, 0, 1/2, 1), nil, nil},
    -- 1/6 - right
    {"Sublime Text",      nil, display_ext_uw_1, hs.geometry.unitrect(5/6, 0, 1/6, 1), nil, nil},
}

hs.hotkey.bind(hypershift, '1', function() hs.layout.apply(webdev_uw) end)

-- local chrome = hs.application.applicationsForBundleID('com.google.Chrome')[1]
-- if chrome ~= nil then
-- chrome:activate()
-- chrome:selectMenuItem({'People', 'menke.co'})
-- end
