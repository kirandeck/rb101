def find_fibonacci_index_by_length(size)
  numbers = [1, 1]
  number = 0
  loop do
    number = numbers[-1] + numbers[-2]
    numbers << number
    break if number.to_s.size == size
  end
  numbers.length
end

p find_fibonacci_index_by_length(2)         # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
