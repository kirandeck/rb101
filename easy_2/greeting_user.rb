puts "What is your name?"
name = gets.chomp

if name.include?("!")
  name = name.upcase!.chop
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
