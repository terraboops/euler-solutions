#Memoized fibonacci function - handles bigass numbers
fib = Hash.new do |fibs, num|
  fibs[num] = 
    if num <= 2
      #base case
      num
    else
      #recursive case
      fibs[num-1] + fibs[num-2]
    end
end

sum = 0
index = 0

#Iterate until term is larger than 4,000,000
while (term = fib[index += 1]) < 4000000 do
  #sum if even
  if term.even?
    sum += term
  end
end

puts sum