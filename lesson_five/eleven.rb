arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

result = arr.map do |array|
  array.select do |a|
    a % 3 == 0
  end
end

p result
