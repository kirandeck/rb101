alphabet = ('a'..'z').to_a + ("A".."Z").to_a
statement = "The Flintstones Rock"
hash = {}

alphabet.each_with_object({}) do |letter, frequency|
  letter_frequency = statement.count(letter)
  hash[letter] = letter_frequency if letter_frequency > 0
end

puts hash
