local module = {}

-- grd helper, which slices the screen in 12x12 parts by default
function module.rect(x, w, y, h, s)
  s = s or 12
  w = w or (s+1-x)/s
  y = y or 1
  h = h or (s+1-y)/s

  return hs.geometry.unitrect((x-1)/s, (y-1)/s, w, h)
end

function module.apply(layouts, display)
  local pKey = "p" .. display.primary:currentMode().w
  local lKey = display.left and ("l" .. display.left:currentMode().w) or ""
  local rKey = display.right and ("r" .. display.right:currentMode().w) or ""

  local layout = layouts[pKey .. lKey .. rKey] or layouts[pKey .. lKey] or layouts[pKey .. rKey] or layouts[pKey] or layouts["default"]

  -- local comp = function (windowTitle, searchPattern)
  --   -- print(string.match(windowTitle, searchPattern) ~= nil, windowTitle, searchPattern)
  --   return string.match(windowTitle, searchPattern) ~= nil
  -- end
  if layout ~= nil then hs.layout.apply(layout) end
end

-- Quick Helper to filter
function module.lookupWin(patterns)
  return function (name)
    local result = {}
    local app    = hs.application.find(name)

    if app == nil then
      return result
    end

    for key, pattern in pairs(patterns) do
      local window = app:findWindow(pattern)

      if (type(window) == "table") then
        for k, w in pairs(window) do table.insert(result, w) end
      elseif (type(r) ~= "userdata") then
        table.insert(result, window)
      end
    end

    return result
  end
end

return module