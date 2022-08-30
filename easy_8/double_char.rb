CONSONANT = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']
def double_consonants(string)
  result = ''
  string.chars.each do |char|
    if CONSONANT.include?(char.downcase)
      result << char * 2
    else
      result << char
    end
  end
  result
end

p double_consonants('String')
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
