def interleave(arr1, arr2)
  size = (arr1.size + arr2.size) / 2
  new_array = []
  count = 0
  loop do
    break if count == size
    new_array << arr1[count]
    new_array << arr2[count]
    count += 1
  end
  new_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
  
