range = 1..100

sumSquares = 0
sum = 0

range.each do |num|
  sumSquares += num**2
  sum += num
end

puts (sumSquares - (sum**2)).abs