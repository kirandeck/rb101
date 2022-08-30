def reverse_sentence(string)
  words = []
  
  string.split.each do |word|
      word.reverse! if word.size >= 5
      words << word
  end
  
  words.join(" ")
end

p reverse_sentence('Hello John')
p reverse_sentence('reverse these words')


