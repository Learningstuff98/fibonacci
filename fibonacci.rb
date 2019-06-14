# def iterative_fib(num)
#   return 0 if num.zero?

#   digits = [0, 1]
#   i = 2
#   while i <= num
#     i += 1
#     digits.push(digits[digits.length - 1] + digits[digits.length - 2])
#   end
#   digits.pop
# end

def iterative_fib(num)
  first = 0
  second = 1
  while num > 1
    temp = second
    second = first + second
    first = temp
    num -= 1
  end
  num.zero? ? first : second
end

# def recursive_fib(num, hash = {}) # not working yet. Implement a hash to optomize the code
# # by storing values in the hash and generating new values only if the hash doesn't 
# # already have them.
#   hash[num] if hash.key(num)
#   if num.zero? || num == 1
#     num
#   else
#     value = recursive_fib(num - 1) + recursive_fib(num - 2)
#     hash[num] = value
#     value
#   end
# end
# assert_equals(recursive_fib(0, {0 => 0, 1 => 1}), 0)

@cache = [0,1]
def recursive_fib(n)
  return @cache[n] if @cache[n]
  @cache[n] = recursive_fib(n-1) + recursive_fib(n-2)
end

# def recursive_fib(num)
#   if num.zero? || num == 1
#     num
#   else
#     recursive_fib(num - 1) + recursive_fib(num - 2)
#   end
# end

def assert_equals(actual, expected)
  if actual == expected
    puts 'Passed'
  else
    puts "Failed. Expected #{expected} but got #{actual}."
  end
end

assert_equals(iterative_fib(0), 0)
assert_equals(iterative_fib(1), 1)
assert_equals(iterative_fib(2), 1)
assert_equals(iterative_fib(3), 2)
assert_equals(iterative_fib(4), 3)
assert_equals(iterative_fib(5), 5)
assert_equals(iterative_fib(6), 8)
assert_equals(iterative_fib(7), 13)
assert_equals(iterative_fib(8), 21)
assert_equals(iterative_fib(9), 34)

puts '-----'

assert_equals(recursive_fib(0), 0)
assert_equals(recursive_fib(1), 1)
assert_equals(recursive_fib(2), 1)
assert_equals(recursive_fib(3), 2)
assert_equals(recursive_fib(4), 3)
assert_equals(recursive_fib(5), 5)
assert_equals(recursive_fib(6), 8)
assert_equals(recursive_fib(7), 13)
assert_equals(recursive_fib(8), 21)
assert_equals(recursive_fib(9), 34)

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report('recursive_fib') { recursive_fib(num) }
  x.report('iterative_fib') { iterative_fib(num) }
end
