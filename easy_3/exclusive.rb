def xor?(one, two)
  if one == true && two == false
    return true
  elsif one == false && two == true
    return true
  else
    return false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
