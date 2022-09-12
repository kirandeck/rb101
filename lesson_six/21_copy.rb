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
  prompt "Do you want to continue playing? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def end_output(dealer_cards, dealer_total, player_cards, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
end

def scoreboard(dealer_wins, player_wins)
  prompt "First to 5 points wins. You: #{player_wins} | Dealer: #{dealer_wins}."
  prompt "You won the match!" if player_wins >= 5
  prompt "Dealer won the match." if dealer_wins >= 5
end

loop do
  player_wins = 0
  dealer_wins = 0
  loop do
    prompt "Welcome to 21!"

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
    prompt "You have: #{player_cards[0]} & #{player_cards[1]}, for a total of #{player_total}"

    loop do
      player_turn = nil
      loop do
        prompt "(h)it or (s)tay?"
        player_turn = gets.chomp.downcase
        break if ['h', 's'].include?(player_turn)
        prompt "Invalid choice. Enter 'h' or 's'"
      end
      if player_turn.start_with?('h')
        player_cards << deck.pop
        player_total = total(player_cards)
        prompt "You chose to hit!"
        prompt "Your cards are now #{player_cards}"
        prompt "Your total is now #{player_total}"
      end
      break if busted?(player_total)
      break if player_turn.start_with?('s')
    end

    player_total = total(player_cards)

    if busted?(player_total)
      dealer_wins += 1
      end_output(dealer_cards, dealer_total, player_cards, player_total)
      display_result(dealer_total, player_total)
      scoreboard(dealer_wins, player_wins)
      break if dealer_wins >= 5
      play_again? ? next : break
    else
      prompt "You stayed at #{player_total}."
    end

    prompt "Dealer turn.."

    loop do
      break if dealer_total >= SAFE

      prompt "Dealer hits!"
      dealer_cards << deck.pop
      dealer_total = total(dealer_cards)
      prompt "Dealer cards are now: #{dealer_cards}"
    end

    dealer_total = total(dealer_cards)

    if busted?(dealer_total)
      player_wins += 1
      end_output(dealer_cards, dealer_total, player_cards, player_total)
      display_result(dealer_total, player_total)
      scoreboard(dealer_wins, player_wins)
      break if player_wins >= 5
      play_again? ? next : break
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    end_output(dealer_cards, dealer_total, player_cards, player_total)

    display_result(dealer_total, player_total)

    result = detect_result(dealer_total, player_total)
    case result
    when :player then player_wins += 1
    when :dealer then dealer_wins += 1
    end

    scoreboard(dealer_wins, player_wins)

    break if player_wins >= 5 || dealer_wins >= 5
    break unless play_again?
  end
  prompt "Do you want to play another match? (y or n)"
  response = gets.chomp.downcase
  break unless response.start_with?('y')
end

prompt "Thank you for playing 21!"
