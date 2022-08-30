def count_occurrences(array)
  count = {}
  array.each do |el|
    count[el] = array.count(el)
  end
  count.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
