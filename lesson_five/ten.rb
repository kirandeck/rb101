result = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  new_hash = {}
  hash.map do |key, value|
    value += 1
    new_hash[key] = value
  end
  new_hash
end
 
 
p result
