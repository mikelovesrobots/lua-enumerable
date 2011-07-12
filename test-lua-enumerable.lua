require "lunit"
require "lua-enumerable"

module( "test-lua-enumerable", lunit.testcase, package.seeall )

function test_each()
  y = 0
  table.each({1,2,3}, function (x) y = y + x end)
  assert_equal(y, 6)
end

function test_times()
  y = 0
  table.times(3, function (x) y = y + x end)
  assert_equal(y, 6)
end

function test_collect()
  local result = table.collect({1,2,3}, function (x) return x + 1 end)

  assert_equal(2, result[1])
  assert_equal(3, result[2])
  assert_equal(4, result[3])
end

function test_select()
  local result = table.select({1,2,3}, function (x) return x < 3 end)

  assert_equal(2, #result)
  assert_equal(1, result[1])
  assert_equal(2, result[2])
end

function test_reject()
  local result = table.reject({1,2,3}, function (x) return x < 3 end)

  assert_equal(1, #result)
  assert_equal(3, result[1])
end

function test_partition()
  local matches, rejects = table.partition({1,2,3}, function (x) return x < 3 end)

  assert_equal(2, #matches)
  assert_equal(1, matches[1])
  assert_equal(2, matches[2])

  assert_equal(1, #rejects)
  assert_equal(3, rejects[1])
end

function test_includes()
  local a = {1,2,3}

  assert_true(table.includes(a, 3))
  assert_false(table.includes(a, 4))
end

function test_detect()
  local test = {1, 2, 3}

  assert_equal(3, table.detect(test, function (x) return x == 3 end))
  assert_equal(nil, table.detect(test, function (x) return x == 4 end))
end

function test_merge()
  local test = {a=1,b=2}
  table.merge(test, {c=3})

  assert_equal(1, test.a)
  assert_equal(2, test.b)
  assert_equal(3, test.c)
end

function test_pop()
  local test = {1,2}
  local result = table.pop(test)

  assert_equal(2, result)

  assert_equal(1, #test)
  assert_equal(1, test[1])
end

function test_shift()
  local test = {1,2}
  local result = table.shift(test)

  assert_equal(1, result)

  assert_equal(1, #test)
  assert_equal(2, test[1])
end

function test_unshift()
  local test = {1,2}
  table.unshift(test, 3)

  assert_equal(3, #test)
  assert_equal(3, test[1])
  assert_equal(1, test[2])
  assert_equal(2, test[3])
end

function test_push()
  local test = {1,2}
  table.push(test, 3)

  assert_equal(3, #test)
  assert_equal(1, test[1])
  assert_equal(2, test[2])
  assert_equal(3, test[3])
end

function test_empty()
  assert_true(table.empty({}))
  assert_true(table.empty(nil))
  assert_false(table.empty({1}))
end

function test_present()
  assert_false(table.present({}))
  assert_false(table.present(nil))
  assert_true(table.present({1}))
end

function test_reverse()
  local result = table.reverse({1,2,3})
  assert_equal(3, #result)
  assert_equal(3, result[1])
  assert_equal(2, result[2])
  assert_equal(1, result[3])
end

function test_dup()
  local result = table.dup({a=1, b=2, c=3})

  assert_equal(1, result.a)
  assert_equal(2, result.b)
  assert_equal(3, result.c)
end

function test_shuffle()
  math.randomseed(1234567890)
  local result = table.shuffle({1,2,3})
  
  assert_equal(3, result[1])
  assert_equal(2, result[2])
  assert_equal(1, result[3])
end

function test_keys()
  local result = table.keys({a=1, b=2, c=3})
  assert_equal('a', result[1])
  assert_equal('c', result[2])
  assert_equal('b', result[3])
  assert_equal(3, #result)
end