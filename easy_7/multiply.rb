def multiply_list(arr1, arr2)
  arr = []
  count = 0
  loop do
    break if count == arr1.size
    product = arr1[count] * arr2[count]
    arr << product
    count += 1
  end
  arr
end

p multiply_list([3, 5, 7], [9, 10, 11])
