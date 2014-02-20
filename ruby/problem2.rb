fib = Hash.new do |fibs, num|
  fibs[num] = 
    if num <= 2
      num
    else
      fibs[num-1] + fibs[num-2]
    end
end

sum = 0
index = 0

while (term = fib[index += 1]) < 4000000 do
  if term.even?
    sum += term
  end
end

puts sum