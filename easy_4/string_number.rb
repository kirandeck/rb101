DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(number)
  digits = number.chars.map do |char|
            DIGITS[char]
  end
  value = 0
  digits.each do |digit|
    value = value * 10 + digit
  end
  value
end

def string_to_signed_integer(number)
  case number[0]
    when '-' then -string_to_integer(number[1..-1])
    when '+' then string_to_integer(number[1..-1])
    else string_to_integer(number)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
