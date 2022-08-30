VALID_CHOICES = ['rock', 'r', 'paper', 'p', 'scissors', 's', 'spock', 's', 'lizard', 'l', 'sc', 'sp']

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  if (first == 'rock' || first == 'r') && (second == 'lizard' || second == 'l') ||
     (first == 'paper' || first == 'p') && (second == 'rock' || second == 'r') ||
     (first == 'scissors' || first == 's') && (second == 'paper'|| second == 'p') ||
     (first == 'lizard' || first == 'l') && (second == 's' || second == 'spock') ||
     (first == 'spock' || first == 's') && (second == 's' || second == 'scissors') ||
     (first == 'scissors' || first == 's') && (second == 'l' || second == 'lizard') ||
     (first == 'lizard' || first == 'l') && (second == 'p' || second == 'paper') ||
     (first == 'paper' || first == 'p') && ( second == 's' || second == 'spock') ||
     (first == 'spock' || first == 's') && (second == 'r' || second == 'rock') ||
     (first == 'rock' || first == 'r') && ( second == 's' || second == 'scissors')
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "You lose."
  else
    prompt "It's a tie"
  end
end

loop do
  choice = ''

  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice. Check your spelling."
    end
  end
  
  if choice == 's'
    prompt "Input 'sc' for scissors or 'sp' for spock"

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt "Do you want to play again? (Y for yes)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing!"
