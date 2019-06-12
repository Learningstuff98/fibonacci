# def fibonacci(num)
#   return 0 if num.zero?

#   digits = [0, 1]
#   i = 2
#   while i <= num
#     i += 1
#     digits.push(digits[digits.length - 1] + digits[digits.length - 2])
#   end
#   digits[digits.length - 1]
# end

def fibonacci(num)
  # Need a base case and a recursive case.
end

def assert_equals(actual, expected)
  if actual == expected
    puts 'Passed'
  else
    puts "Failed. expected #{expected} but got #{actual}. Moron."
  end
end

assert_equals(fibonacci(0), 0)
assert_equals(fibonacci(1), 1)
assert_equals(fibonacci(2), 1)
assert_equals(fibonacci(3), 2)
assert_equals(fibonacci(4), 3)
assert_equals(fibonacci(5), 5)
assert_equals(fibonacci(6), 8)
assert_equals(fibonacci(7), 13)
assert_equals(fibonacci(8), 21)
assert_equals(fibonacci(9), 34)
