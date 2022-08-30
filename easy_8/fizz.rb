def fizzbuzz(num1, num2)
  arr = (num1..num2).to_a
  result = arr.map do |num|
    if num % 3 == 0 && num % 5 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num
    end
  end
  result.join(", ")
end

p fizzbuzz(1, 15)
