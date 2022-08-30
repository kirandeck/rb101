puts "Please write a word or multiple words:"
words = gets.chomp

new_string = words.delete(' ')

puts "There are #{new_string.length} characters in '#{words}'."
