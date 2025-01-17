class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  attr_reader :name, :symbol
end

class GameBoard
  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end 

  def display_grid
    puts "\n"
    @grid.each { |row| puts row.join(" | ") }
    puts "\n"
  end 

  def validate_move(row, col)
    if @grid[row][col] == " "
      return true
    else
      return false
    end
  end 

  def update_grid(row, col, symbol)
    @grid[row][col] = symbol
  end 

  def grid
    @grid
  end
end 

class Game
  def initialize(player1, player2, game_board)
    @player1 = player1
    @player2 = player2
    @game_board = game_board
    @current_player = player1
  end

  def play_game
    until game_over
      take_turn
      switch_player
    end
    display_winner
    end_game
  end

  def take_turn
    @game_board.display_grid
    row, col = get_move
    until @game_board.validate_move(row, col)
      puts "Invalid move, try again"
      row, col = get_move
    end
    @game_board.update_grid(row, col, @current_player.symbol)
  end 

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end 

  def game_over
    check_winner || check_draw
  end

  def check_winner
    # Check rows
    @game_board.grid.each do |row|
      return true if row.all? { |cell| cell == @current_player.symbol }
    end

    # Check columns
    (0..2).each do |col|
      return true if @game_board.grid.all? { |row| row[col] == @current_player.symbol }
    end

    # Check diagonals
    if (0..2).all? { |i| @game_board.grid[i][i] == @current_player.symbol }
      return true
    end

    if (0..2).all? { |i| @game_board.grid[i][2 - i] == @current_player.symbol }
      return true
    end

    false
  end 

  def check_draw
    @game_board.grid.all? { |row| row.none? { |cell| cell == " " } }
  end 

  def display_winner
    @game_board.display_grid
    if check_draw
      puts "It's a draw!"
    else
      puts "#{@current_player.name} wins!"
    end
  end 

  def end_game
    puts "Would you like to play again? (y/n)"
    response = gets.chomp
    if response == "y"
      restart
    else
      puts "Thanks for playing!"
    end
  end

  def restart
    @game_board = GameBoard.new
    play_game
  end 

  def get_move
    print "#{@current_player.name}, enter row (0, 1, 2): "
    row = gets.chomp.to_i
    print "Enter column (0, 1, 2): "
    col = gets.chomp.to_i
    return row, col
  end
end

# Example of how to play:
player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")
game_board = GameBoard.new
game = Game.new(player1, player2, game_board)
game.play_game
