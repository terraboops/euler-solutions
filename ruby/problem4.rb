#check if number is palindrome
def is_palindrome? n
  palindrome = false
  
  #compare number and string reversal of number as integer
  if n == n.to_s.reverse.to_i
    palindrome = true
  end

  return palindrome
end

largestPalindrome = 0

#check all 3 digit numbers starting from largest
(999).downto(1) do |i|
  (999).downto(1) do |j|
    #find the product
    product = i * j

    #if product is palindrome and is new largest then store it
    if is_palindrome? (product)
      if(product > largestPalindrome)
        largestPalindrome = product
      end
    end
  end
end

puts largestPalindrome