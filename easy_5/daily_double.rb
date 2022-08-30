def crunch(string)
  result = []
  string.chars.each do |char|
    result << char unless result.last == char
  end
  result.join
end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
    
