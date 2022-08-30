puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, or 'p' to compute the product."
input = gets.chomp.downcase

starting_point = 1

sum = 0

product = 1

if input.start_with?('s')
  until starting_point > integer
    sum += starting_point
    starting_point += 1
  end
  
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
else
  until starting_point > integer
    product *= starting_point
    starting_point += 1
  end
  
  puts "The product of the integers between 1 and #{integer} is #{product}."
end



