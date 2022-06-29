# require "pry"
class TicTacToe
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    play
    # turn
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    num = input.to_i
    num = num - 1
  end

  def move(index, token = "X")
    # mark = input_to_index(index)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(position)
    !position_taken?(position) && (position >= 0 && position <= 8)
  end

  def turn_count
    count = 0
    @board.each { |pos| count += 1 if pos != " " }
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Do it."
    input = gets.strip
    # binding.pry
    try = input_to_index(input)
    valid_move?(try) ? move(try, current_player) : turn
    display_board
  end

  def won?
    there_is_a_win =
      WIN_COMBINATIONS.find do |win|
        player = @board[win[0]]
        player != " " && @board[win[1]] == player && @board[win[2]] == player
      end
  end

  def full?
    @board.all? { |position| position != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      winning_indexes = won?
      @board[winning_indexes[0]]
    else
      nil
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}" : "Cat's Game!"
  end
end

# TicTacToe.new()

t = TicTacToe.new