def sum (num)
  result = 0
  digit_arr = num.to_s.chars
  
  digit_arr.each do |digit|
    result = digit.to_i + result
  end
  
  result
end

puts sum(123)
