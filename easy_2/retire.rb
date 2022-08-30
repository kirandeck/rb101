puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire = gets.chomp.to_i

retire_length = retire - age

current_year = Time.new.year

retire_year = current_year + retire_length

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You only have #{retire_length} years of work to go!"
