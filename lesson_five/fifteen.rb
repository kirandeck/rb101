arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

result = arr.select do |hash|
  hash.all? do |_, values|
    values.all? { |number| number.even? }
  end
end

p result
