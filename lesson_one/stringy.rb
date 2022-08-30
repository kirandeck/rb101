def stringy (num)
  count = 0
  string = ''
  loop do
    break if count >= num
    count.even? ? string += '1' : string += '0'
    count += 1
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
