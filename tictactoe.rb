def display_board(brd)
    puts " #{brd[0]} | #{brd[1]} | #{brd[2]} "
    puts "-----------"
    puts " #{brd[3]} | #{brd[4]} | #{brd[5]} "
    puts "-----------"
    puts " #{brd[6]} | #{brd[7]} | #{brd[8]} "
end

def sample_board
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 8 "
end

def turn(brd, player)
    position = gets.strip
    token = player
    until brd[position.to_i - 1] == " "
        puts "position taken choose again"
        position = gets.strip
    end
    brd[position.to_i - 1] = token
end

def wincon(brd, c_player)
    if brd[0...3].all? { |x| x == c_player} || brd[3...6].all? { |x| x == c_player} || brd[6...9].all? { |x| x == c_player} 
        return true
    elsif brd[0] == c_player && brd[3]  == c_player && brd[6] == c_player || brd[1] == c_player && brd[4] == c_player && brd[7] == c_player ||  brd[2] == c_player && brd[5] == c_player && brd[8] == c_player || brd[0] == c_player && brd[4] == c_player && brd[8] == c_player || brd[2] == c_player && brd[4] == c_player && brd[6] == c_player
        return true
    end
end

def tie?(brd)
    if brd.all? { |x| x == "O" || x == "X"}
        puts "Tie!"
        return true
    end
end

def play_again
    puts "Restart? (Y/n)"
    answer = gets.strip
    if answer == "y"
        return true
    else
        return false
    end
end

player_1 = "X"
player_2 = "O"
current_player = player_1
board = [" "," "," "," "," "," "," "," "," "]
#choose_turns

sample_board

puts "TURN 1: Where would you like to go? 0-8"
loop do
turn(board, current_player)
display_board(board)
if wincon(board, current_player) == true
p current_player + " " + "wins"
    if play_again == true
    puts "TURN 1: Where would you like to go? 1-8" 
    sample_board
    board = [" "," "," "," "," "," "," "," "," "] 
    else
        break
end
end
if tie?(board) == true
    if play_again == true
        puts "TURN 1: Where would you like to go? 1-8" 
        sample_board
        board = [" "," "," "," "," "," "," "," "," "] 
        else
            break
    end
    end
current_player = player_2
turn(board, current_player)
display_board(board)
if wincon(board, current_player) == true
p current_player + " " + "wins"
    if play_again == true
    puts "TURN 1: Where would you like to go? 1-8" 
    sample_board
    board = [" "," "," "," "," "," "," "," "," "] 
else
    break
end
end
if tie?(board) == true
    if play_again == true
        puts "TURN 1: Where would you like to go? 1-8" 
        sample_board
        board = [" "," "," "," "," "," "," "," "," "] 
        else
            break
    end
    end
current_player = player_1
end
# p current_player + " " + "wins"

=begin
    declare win condition
    win if one player occupies [0,1,2] [3,4,5] [6,7,8]
    win if one player occupies [0,3,6] [1,4,7] [2,5,8]
    win if one player occupies [0,4,8] [2,4,6]
    check if player occupies those indexes
    if player occupies == win condition true
        game ends
=end

=begin
    position_available?
    if player chooses slot thats currently occupied by X or O
        return 'position unavailable choose another one'
        turn restarts
=end

=begin
turn loop
game begins, player one makes move
check for position_available
board changes
switch to player two
turn begins
player two makes move
check for position_available
break if win_condition == true
=end

=begin
def choose_turns
    puts "Heads or tails"
    choice = gets.strip
    puts "You are flipping a coin"
    if rand.round == 0
      coin = "heads"
    else
      coin = "tails"
    end
    puts "It is " + coin
    if choice == coin
        p "You win, you go first"
    else
        p "You lose, you go second"
    end
end
=end

=begin
def tie?
    check that all positions are filled
    if wincon == false
        declare tie
        no one wins
        offer a restart
    end
end
=end
