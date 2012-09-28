table.includes = function(list, value)
  for i,x in ipairs(list) do
    if (x == value) then
      return(true)
    end
  end
  return(false)
end

table.detect = function(list, func)
  for i,x in ipairs(list) do
    if (func(x, i)) then
      return(x)
    end
  end
  return(nil)
end

table.without = function(list, item)
  return table.reject(list, function (x) 
    return x == item 
  end)
end

table.each = function(list, func)
  for i,v in ipairs(list) do
    func(v, i)
  end
end

table.all = function(list, func)
  for i,v in pairs(list) do
    func(v, i)
  end
end

table.select = function(list, func)
  local results = {}
  for i,x in ipairs(list) do
    if (func(x, i)) then
      table.insert(results, x)
    end
  end
  return(results)
end

table.reject = function(list, func)
  local results = {}
  for i,x in ipairs(list) do
    if (func(x, i) == false) then
      table.insert(results, x)
    end
  end
  return(results)
end

table.partition = function(list, func)
  local matches = {}
  local rejects = {}
  
  for i,x in ipairs(list) do
    if (func(x, i)) then
      table.insert(matches, x)
    else
      table.insert(rejects, x)
    end
  end
  
  return matches, rejects
end

table.merge = function(source, destination)
  for k,v in pairs(destination) do source[k] = v end
  return source
end

table.unshift = function(list, val)
  table.insert(list, 1, val)
end

table.shift = function(list)
  return table.remove(list, 1)
end

table.pop = function(list)
  return table.remove(list)
end

table.push = function(list, item)
  return table.insert(list, item)
end

table.collect = function(source, func) 
  local result = {}
  for i,v in ipairs(source) do table.insert(result, func(v)) end
  return result
end

table.empty = function(source) 
  return source == nil or next(source) == nil
end

table.present = function(source)
  return not(table.empty(source))
end

table.random = function(source)
  return source[math.random(1, #source)]
end

table.times = function(limit, func)
  for i = 1, limit do
    func(i)
  end
end

table.reverse = function(source)
  local result = {}
  for i,v in ipairs(source) do table.unshift(result, v) end
  return result
end

table.dup = function(source)
  local result = {}
  for k,v in pairs(source) do result[k] = v end
  return result
end

-- fisher-yates shuffle
function table.shuffle(t)
  local n = #t
  while n > 2 do
    local k = math.random(n)
    t[n], t[k] = t[k], t[n]
    n = n - 1
  end
  return t
end

table.keys = function(source)
  local result = {}
  for k,v in pairs(source) do
    table.push(result, k)
  end
  return result
end
