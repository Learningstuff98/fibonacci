def iterative_fib1(num)
  return 0 if num.zero?

  digits = [0, 1]
  i = 2
  while i <= num
    i += 1
    digits.push(digits[digits.length - 1] + digits[digits.length - 2])
  end
  digits.pop
end

def iterative_fib2(num)
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

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report('recursive_fib') { recursive_fib(num) }
  x.report('iterative_fib1') { iterative_fib1(num) }
  x.report('iterative_fib2') { iterative_fib2(num) }
end
