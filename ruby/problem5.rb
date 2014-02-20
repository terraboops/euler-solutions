UPPER_BOUND = 20

range = 1..UPPER_BOUND

puts range.reduce {|memo, num| memo.lcm(num)}