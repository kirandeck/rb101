UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def swapcase(string)
  result = string.chars.map do |char|
    if LOWERCASE.include?(char)
      char.capitalize
    elsif UPPERCASE.include?(char)
      char.downcase
    else
      char
    end
  end
  result.join
end
  
p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
