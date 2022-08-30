require 'pry'

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  array = []
  0.upto(string.size - 1) do |index|
    array.concat(leading_substrings(string[index..-1]))
  end
  array
end

def palindromes(string)
  arr = substrings(string)
  palindromes = []
  arr.each do |chars|
    if chars.size >= 2 && chars.reverse == chars
      palindromes << chars
    end
  end
  palindromes
end
  
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
