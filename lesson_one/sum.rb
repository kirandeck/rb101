def sum (num)
  result = 0
  array = num.to_s.chars
  array.each do |char|
    result += char.to_i
  end
  result
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

