array = []

puts "Enter the 1st number:"
first = gets.chomp.to_i
array << first

puts "Enter the 2nd number:"
second = gets.chomp.to_i
array << second

puts "Enter the 3rd number:"
third = gets.chomp.to_i
array << third

puts "Enter the 4th number:"
fourth = gets.chomp.to_i
array << fourth

puts "Enter the fifth number:"
fifth = gets.chomp.to_i
array << fifth

puts "Enter the sixth number:"
sixth = gets.chomp.to_i

if array.include?(sixth)
  puts "The number #{sixth} appears in #{array}."
else
  puts "The number #{sixth} does not appear in #{array}"
end
