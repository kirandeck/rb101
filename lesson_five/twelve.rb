arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

result = arr.each_with_object({}) do |values, hash|
    hash[values[0]] = values[1]
    hash
end

p result
