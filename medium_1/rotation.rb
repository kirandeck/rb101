require 'pry'

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_rightmost_digits(numbers, n)
  main_array = numbers.to_s.chars
  main_array[-n..-1] = rotate_array(main_array[-n..-1])
  main_array.join.to_i
end

def max_rotation(number)
  size = number.to_s.size
  size.downto(2) do |iteration|
    number = rotate_rightmost_digits(number, iteration)
  end
  number
end
    

p max_rotation(735291)
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

 rotate_rightmost_digits(735291, 1) == 735291

rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
 rotate_rightmost_digits(735291, 4)
 rotate_rightmost_digits(735291, 5) == 752913
 rotate_rightmost_digits(735291, 6) == 352917
