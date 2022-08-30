def reverse_words (string)
  words = []
  
  string.split.each do |element|
    element.reverse! if element.length >= 5
    words << element
  end
 
 words.join(' ')
end

p reverse_words('hello world')

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
