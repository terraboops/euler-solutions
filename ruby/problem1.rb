sum = 0
#iterate positive integers smaller than 1000
(1...1000).each do |num|
  #sum if divisible by 3 or 5 (3 is tested first because there are more factors -- short circuiting ftw)
  if num%3 == 0 or num%5 == 0
    sum = sum + num
  end
end

puts sum