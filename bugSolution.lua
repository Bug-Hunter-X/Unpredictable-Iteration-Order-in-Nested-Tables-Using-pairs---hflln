local function foo(t, order)
  local keys = {}
  for k in pairs(t) do
    table.insert(keys, k)
  end

  table.sort(keys, function(a, b)
    return order == "asc" and a < b or a > b
  end)

  for _, k in ipairs(keys) do
    local v = t[k]
    if type(v) == "table" then
      foo(v, order)
    end
  end
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
foo(t, "asc") -- Iterate in ascending order of keys
foo(t, "desc") -- Iterate in descending order of keys