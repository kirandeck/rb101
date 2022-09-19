VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
SUITS = %w(Clubs Diamonds Hearts Spades)
WIN = 21
SAFE = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0

  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > WIN
  end

  sum
end

def busted?(total)
  total > WIN
end

def detect_result(dealer_total, player_total)
  if player_total > WIN
    :player_busted
  elsif dealer_total > WIN
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt "You busted! Dealer wins."
  when :dealer_busted
    prompt "Dealer busted! You win."
  when :player
    prompt "You win!"
  when :dealer
    prompt "You lose."
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "------------"
  loop do
    prompt "Do you want to continue playing? (y or n)"
    answer = gets.chomp.downcase
    return true if answer.start_with?('y')
    return false if answer.start_with?('n')
    prompt "Invalid input. Answer must be 'y' for yes or 'n' for no."
  end
end

def another_match?
  loop do
    prompt "Do you want to play another match? (y or n)"
    answer = gets.chomp.downcase
    return true if answer.start_with?('y')
    return false if answer.start_with?('n')
    prompt "Invalid input. Answer must be 'y' for yes or 'n' for no."
  end
end

def end_output(dealer_cards, dealer_total, player_cards, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
end

def scoreboard(dealer_wins, player_wins)
  if player_wins < 5 && dealer_wins < 5
    prompt "First to 5 wins. You: #{player_wins} | Dealer: #{dealer_wins}"
  end
  prompt "You won the match!" if player_wins >= 5
  prompt "Dealer won the match." if dealer_wins >= 5
end

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength
def rules
  loop do
    prompt "Do you want to read the rules? (y or n)"
    answer = gets.chomp.downcase
    break if answer == 'n'
    if answer == 'y'
      puts "---------------------------------------------------------------------"
      puts "The goal of the game is to reach 21 without going over."
      puts "Cards are worth face value.. but jack, king, and queen are worth 10."
      puts "Aces are worth 11, but can be worth 1 if your total is over 21."
      puts "You will be playing against the dealer."
      puts "---------------------------------------------------------------------"
      puts "You'll be dealt 2 cards which you can see."
      puts "The dealer also has two cards, but you only see 1."
      puts "You can choose to be dealt another card (hit) or stay."
      puts "If you go over 21 you automatically lose."
      puts "---------------------------------------------------------------------"
      puts "Once you stay, the dealer shows his cards."
      puts "If the dealers total is below 17, he has to hit."
      puts "But if the dealers total is 17 or more, he has to stay."
      puts "If neither player is above 21, cards are compared."
      puts "Whoever is closest to 21 wins."
      puts "And remember, if a player goes over 21 they lose."
      puts "---------------------------------------------------------------------"
      loop do
        prompt "Enter any key to begin the game:"
        got_it = gets.chomp.downcase
        break if got_it
      end
      break
    end
    prompt "Invalid input. Enter either 'y' for yes or 'n' for no."
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Layout/LineLength

def hit_or_stay?
  loop do
    prompt "(h)it or (s)tay?"
    player_turn = gets.chomp.downcase
    return player_turn if ['h', 's'].include?(player_turn)
    prompt "Invalid choice. Enter 'h' or 's'"
  end
end

def player_hits(player_total, player_cards)
  prompt "You chose to hit!"
  prompt "Your cards are now #{player_cards}"
  prompt "Your total is now #{player_total}"
end

def dealer_hits(dealer_total, dealer_cards)
  prompt "Dealer hits!"
  prompt "Dealer cards are now: #{dealer_cards}"
  prompt "Dealer total is now #{dealer_total}"
  sleep(3)
end

def bust(dealer_total, player_total, dealer_cards, player_cards)
  display_result(dealer_total, player_total)
  sleep(3)
  end_output(dealer_cards, dealer_total, player_cards, player_total)
end

def both_stayed(dealer_total, player_total, dealer_cards, player_cards)
  end_output(dealer_cards, dealer_total, player_cards, player_total)
  sleep(3)
  display_result(dealer_total, player_total)
end

loop do
  player_wins = 0
  dealer_wins = 0
  prompt "Welcome to 21!"
  rules
  loop do
    system 'clear'
    prompt "Shuffling..."
    sleep(2)
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    prompt "Dealer has #{dealer_cards[0]} and ?"
    prompt "You have: #{player_cards}, for a total of #{player_total}"
    loop do
      player_turn = hit_or_stay?
      if player_turn.start_with?('h')
        player_cards << deck.pop
        player_total = total(player_cards)
        player_hits(player_total, player_cards)
      end
      break if busted?(player_total)
      break if player_turn.start_with?('s')
    end

    player_total = total(player_cards)

    if busted?(player_total)
      dealer_wins += 1
      bust(dealer_total, player_total, dealer_cards, player_cards)
      scoreboard(dealer_wins, player_wins)
      break if dealer_wins >= 5
      play_again? ? next : break
    else
      prompt "You stayed at #{player_total}."
    end

    prompt "Dealer turn.."
    sleep(2)

    loop do
      break if dealer_total >= SAFE
      dealer_cards << deck.pop
      dealer_total = total(dealer_cards)
      dealer_hits(dealer_total, dealer_cards)
    end

    dealer_total = total(dealer_cards)

    if busted?(dealer_total)
      player_wins += 1
      bust(dealer_total, player_total, dealer_cards, player_cards)
      scoreboard(dealer_wins, player_wins)
      break if player_wins >= 5
      play_again? ? next : break
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    both_stayed(dealer_total, player_total, dealer_cards, player_cards)
    result = detect_result(dealer_total, player_total)
    case result
    when :player then player_wins += 1
    when :dealer then dealer_wins += 1
    end

    scoreboard(dealer_wins, player_wins)

    break if player_wins >= 5 || dealer_wins >= 5
    break unless play_again?
  end
  break unless another_match?
end

prompt "Thank you for playing 21!"
