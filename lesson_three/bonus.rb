def calculate_bonus (value, boolean)
  if boolean
    value = value / 2
  else
    value = 0
  end
  
  value
end

puts calculate_bonus(1000, true)
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
