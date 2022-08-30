def prompt(message)
  puts "=> #{message}"
end

def not_zero?(rate)
  rate >= 0
end

prompt "Welcome to the loan calculator! What type of loan are you interested in?"
loan_type = ''

loop do
  loan_type = gets.chomp

  if loan_type.empty?
    prompt "Make sure to use valid loan type"
  else
    break
  end
end

prompt "Time to calculate #{loan_type}"

loop do
  loan_amount = ''

  loop do
    prompt "How much do you wish to borrow?"
    loan_amount = gets.chomp.to_i

    if not_zero?(loan_amount)
      break
    else
      prompt "Please enter a valid number:"
    end
  end

  loan_rate = ''

  loop do
    prompt "What is your desired annual interest rate? (ex: enter '5' for 5%)"
    loan_rate = gets.chomp.to_f
    loan_rate /= 100
    loan_rate /= 12

    if not_zero?(loan_rate)
      break
    else
      prompt "Please enter a number larger than 0:"
    end
  end

  loan_duration = ''

  loop do
    prompt "What is the duration you wish to payback the loan? (in years)"
    loan_duration = gets.chomp.to_i
    loan_duration *= 12

    if not_zero?(loan_duration)
      break
    else
      prompt "Please input a valid loan duration in years:"
    end
  end

  prompt "Calculating: #{loan_type} loan, for $ #{loan_amount}, converted to #{loan_rate} monthly interest, for a payback period of #{loan_duration} months..."

  monthly_payment = loan_amount.to_f * (loan_rate.to_f / (1 - (1 + loan_rate.to_f)**(-loan_duration)))
  monthly_payment.to_f

  prompt "Your monthly payment is $ #{monthly_payment}"

  prompt "Do you wish to calculate again? ('Y' to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using the loan calculator!"
