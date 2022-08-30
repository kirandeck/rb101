loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "Thats correct"
    break
  end
  puts "Wrong answer, try again"
end
