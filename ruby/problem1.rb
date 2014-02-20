sum = 0
(1...1000).each do |num|
  if num%3 == 0 or num%5 == 0
    sum = sum + num
  end
end

puts sum