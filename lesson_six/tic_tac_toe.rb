require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INTIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg} "
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def display_placement_numbers
  puts "The board is labeled in the following way"
  puts ""
  puts "     |     |"
  puts "  1  |  2  |  3"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  4  |  5  |  6"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  7  |  8  |  9"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INTIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INTIAL_MARKER }
end

def joinor(array, default1 = ', ', default2 = 'or')
  if array.size > 2
    string = array.join(default1)
    string.insert(-2, default2 + ' ')
  elsif array.size > 1
    string = array.join
    string.insert(-2, ' ' + default2 + ' ')
  else
    array.join
  end
end

def computer_defense(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INTIAL_MARKER }.keys.first
  end
end

def computer_offense(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INTIAL_MARKER }.keys.first
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, thats not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = computer_offense(line, brd, COMPUTER_MARKER)
    break if square
  end
  if !square
    WINNING_LINES.each do |line|
      square = computer_defense(line, brd, PLAYER_MARKER)
      break if square
    end
  end
  square = 5 if !square && empty_squares(brd).include?(5)

  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def place_piece!(board, current_player)
  if current_player == 'p'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  case current_player
  when 'p' then 'c'
  else
    'p'
  end
end

def continue_playing?
  answer = nil
  loop do
    prompt "Continue playing? (y or n)"
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt "Invalid response. Input 'y' for yes or 'n' for no."
  end
  answer
end

def another_match?
  response = nil
  loop do
    prompt "Do you want to play another match? (y or n)"
    response = gets.chomp.downcase
    break if response == 'y' || response == 'n'
    prompt "Invalid response. Input 'y' for yes or 'n' for no."
  end
  response
end

loop do
  puts "Let's play tic tac toe!"
  display_placement_numbers
  player_wins = 0
  computer_wins = 0
  computer_choice = ['p', 'c']
  prompt "Who goes first? p = player || c = computer || any other key = random"
  current_player = gets.chomp.downcase
  loop do
    board = intialize_board

    if current_player != 'p' && current_player != 'c'
      current_player = computer_choice.sample
    end

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if detect_winner(board) == 'Player'
      player_wins += 1
      prompt "Player won!"
    elsif detect_winner(board) == "Computer"
      computer_wins += 1
      prompt "Computer won!"
    else
      prompt "It's a tie!"
    end

    prompt "player: #{player_wins}  ||  computer: #{computer_wins}"

    if player_wins >= 5
      prompt "Player wins the match!"
      break
    elsif computer_wins >= 5
      prompt "Computer wins the match!"
      break
    else
      prompt "First to 5 points wins. Continue playing? (y or n)"
      answer = continue_playing?
      break unless answer.downcase.start_with?('y')
    end
  end
  response = another_match?
  break unless response.start_with?('y')
end

prompt "Thanks for playing tic tac toe... Goodbye!"
