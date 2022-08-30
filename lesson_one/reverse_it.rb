def reverse_words (string)
  result = string.split.each do |word|
    if word.length >= 5
      word.reverse!
    end
  end
  result.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
