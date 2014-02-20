number = 600851475143

#Find upper limit of haystack for prime search based on size of number
def primeScalingFunction n
  if (scaledNum = Math.sqrt(n).floor) > 2
    return scaledNum
  elsif (n/2) > 2
    return n/2
  else 
    return n-1
  end
end

#Determines primality of number
def is_prime? n
  isPrime = true

  (2..primeScalingFunction(n)).each do |d|
    if (n % d) == 0
      isPrime = false
    end
  end
  
  return isPrime
end

#Find prime factors, starting with biggest
primeScalingFunction(number-1).downto(2) do |term|
  if (number%term) == 0
    if is_prime?(term)
      puts term
      break
    end
  end
end