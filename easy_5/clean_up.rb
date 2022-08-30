LETTERS = ('a'..'z').to_a

def cleanup(string)
  string = string.chars
  result = ' '
  string.map do |char|
    if LETTERS.include?(char)
      result << char
    else
      result << ' ' unless result[-1] == ' '
    end
  end
  result
end

p cleanup("---what's my +*& line?") == ' what s my line '
