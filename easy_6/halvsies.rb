def halvsies(array)
  arr1 = []
  arr2 = []
  arr1_size = array.size / 2
  arr1_size += 1 if array.size % 2 != 0
  array.each do |el|
    if arr1_size > arr1.size
      arr1 << el
    else
      arr2 << el
    end
  end
  arr = arr1, arr2
  arr
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
