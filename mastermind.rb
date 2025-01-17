class WelcomeMessage
  def self.display
    puts "Welcome to Mastermind!"
    puts "The computer has selected a secret code with 4 colors."
    puts "You have 12 turns to guess the code."
    puts "After each guess, you will receive feedback:"
    puts "- Black Pegs (●) mean the color is correct and in the correct position."
    puts "- White Pegs (○) mean the color is correct but in the wrong position."
    puts "Good luck!"
    puts "R = Red, G = Green, B = Blue, Y = Yellow, O = Orange, P = Purple"
  end
end

class CodeMaker
  COLORS = ["R", "G", "B", "Y", "O", "P"]

  def initialize
    @secret_code = generate_code
  end

  def generate_code
    COLORS.sample(4)
  end

  def secret_code
    @secret_code
  end
end

class CodeBreaker
  def initialize
    @guesses = 0
  end

  def make_guess
    puts "Enter your guess (R, G, B, Y, O, P):"
    guess = gets.chomp.upcase.split("")
    @guesses += 1
    guess
  end

  def guesses
    @guesses
  end
end

class Feedback
  def self.provide_feedback(guess, secret_code)
    black_pegs = 0
    white_pegs = 0
    guess_copy = guess.clone
    secret_code_copy = secret_code.clone

    guess.each_with_index do |color, index|
      if color == secret_code[index]
        black_pegs += 1
        guess_copy[index] = nil
        secret_code_copy[index] = nil
      end
    end

    guess_copy.each_with_index do |color, index|
      if color && secret_code_copy.include?(color)
        white_pegs += 1
        secret_code_copy[secret_code_copy.index(color)] = nil
      end
    end

    { black_pegs: black_pegs, white_pegs: white_pegs }
  end
end

class GameLoop
  def initialize
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
  end

  def start_game
    WelcomeMessage.display
    play_game
  end

  def play_game
    until game_over
      guess = @code_breaker.make_guess
      feedback = Feedback.provide_feedback(guess, @code_maker.secret_code)
      display_feedback(feedback)

      if feedback[:black_pegs] == 4
        puts "You win! The secret code was #{@code_maker.secret_code.join}"
        return
      end
    end

    puts "Game Over! You did not guess the code in 12 attempts. The secret code was #{@code_maker.secret_code.join}"
  end

  def game_over
    @code_breaker.guesses == 12
  end

  def display_feedback(feedback)
    puts "Black Pegs: #{feedback[:black_pegs]}, White Pegs: #{feedback[:white_pegs]}"
  end
end

# Start the game
game = GameLoop.new
game.start_game
