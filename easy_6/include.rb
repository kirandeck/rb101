def include?(arr, arg)
  arr.any? do |el|
    el == arg
  end
end

p include?([1,2,3,4,5], 3)
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
