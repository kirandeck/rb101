def multiply(numbers, multiplier)
  counter = 0
  multiplied_numbers = []
  
  loop do
    break if counter == numbers.size
    
    multiplied_numbers << numbers[counter] * multiplier
    
    counter += 1
  end
  
  multiplied_numbers
end
