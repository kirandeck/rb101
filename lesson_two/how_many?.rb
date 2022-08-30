def count_occurrences(arr)
  occurrances = {}
  
  arr.uniq.each do |element|
    occurrances[element] = arr.count(element)
  end
  
  occurrances.each do |element, count|
    puts "#{element} => #{count}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
