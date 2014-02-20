UPPER_BOUND = 20

range = 1..UPPER_BOUND

numberToTest = UPPER_BOUND

numberFound = false

while !numberFound do
  numberFound = true
  range.each do |divisor|
    if numberToTest%divisor != 0
      numberFound = false
      break
    end
  end
  if !numberFound
    numberToTest += 1
  end
end

puts numberToTest