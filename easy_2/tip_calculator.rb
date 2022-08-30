puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip = gets.chomp.to_f
tip = tip / 100

tip_amount = (bill * tip).round(2)

total = (tip_amount + bill).round(2)

puts "The tip is $#{tip_amount}"

puts "The total is $#{total}"
