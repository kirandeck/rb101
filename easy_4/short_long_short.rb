def short_long_short(one, two)
  if one.length > two.length
    two + one + two
  else
    one + two + one
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
