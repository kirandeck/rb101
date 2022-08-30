def substrings(str)
  result = []
  starting_index = 0
  
  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num chars <= str.length - starting_index)
      subsring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  
  result
end

def is_palindrome?(str)
  return str == str.reverse
end

def palinrome_substrings(str)
  substring_arr = substring(str)
  substring_arr.each do |el|
    result << substring if is_palindrome?(el)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious")
p palindrome_substrings("abcddcbA")
p palindrome_substrings("palindrome")
p palindrome_substrings("")
