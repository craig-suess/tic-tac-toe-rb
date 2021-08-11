WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

def input_to_index(user_input)
    user_input.to_i-1 ; 
end 
 
def move(board, index, character)
    board[index] = character ; 
end 

def position_taken?(board, index)
    if board[index] == "" || board[index] == " " || board[index] == nil 
        return false ; 
    else 
        return true ; 
    end 
end 

def valid_move?(board, index)
    token = "X" || "O"
    if board[index] != token && index.between?(0, 8)
        return true ; 
    else 
        return false ; 
    end  
end 

def turn_count(board) 
    counter = 0 ; 
    board.each do |boards| 
        if boards == "X" || boards == "O" 
            counter += boards.length ; 
        end
    end 
    return counter ;
end 

def current_player(board)
    if turn_count(board).even? 
        return "X"
    elsif turn_count(board).odd? 
        return "O"
    end 
end 

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip ; 
    valid_index = input_to_index(input) ;
    if valid_move?(board, valid_index)
        move(board, valid_index, current_player(board)) ;
        display_board(board) ;
    else 
        turn(board) ; 
    end 
end 

def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
  
      position_1 = board[win_index_1] 
      position_2 = board[win_index_2] 
      position_3 = board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination ; 
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination ; 
      end
    end  
    return false ; 
  end 
  
  def full?(board)
    board.all? do |index|
    index == "X" || index == "O" ;
    end
  end 
  
  def draw?(board)
    if full?(board) && !won?(board) 
      return true ; 
    else 
      return false ; 
    end 
  end 
  
  def over?(board)
    if draw?(board) || won?(board) || full?(board)
      return true ; 
    else 
      return false ; 
    end
  end 
  
  def winner(board)
    win = []
    win = won?(board)
    if !win 
      return nil
    elsif board[win[0]] == "O"
      return "O" 
    else 
      return "X" ; 
    end 
  end 

  def play(board)
    until over?(board)
    turn(board) ;
    end 

    if won?(board) 
        puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
        puts "Cat's Game!"
     end 
  end 
  

  #counter = 0 
  #while counter < 9 do
   # turn(board) ; 
   # counter += 1 ; 
  #end 