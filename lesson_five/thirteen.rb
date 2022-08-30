arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

result = arr.sort_by do |array|
  array.select do |number|
    number.odd?
  end
end

p result
