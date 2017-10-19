-- https://github.com/cmsj/hammerspoon-config

-- Define monitor names for layout purposes
display_main = "Color LCD"
display_ext_1 = "DELL U2414H"

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
    {"Google Chrome",     nil, display_ext_1, hs.geometry.unitrect(0, 0, 2/3, 1), nil, nil},
    {"Paw",               nil, display_ext_1, hs.geometry.unitrect(0, 0, 2/3, 1), nil, nil},
    {"Quiver",            nil, display_ext_1, hs.geometry.unitrect(2/3, 0, 1/3, 1), nil, nil},
    {"Skype",             nil, display_ext_1, hs.geometry.unitrect(2/3, 0, 1/3, 1), nil, nil},
}

-- hs.layout.apply(dual_display)

-- local chrome = hs.application.applicationsForBundleID('com.google.Chrome')[1]
-- if chrome ~= nil then
-- chrome:activate()
-- chrome:selectMenuItem({'People', 'menke.co'})
-- end
