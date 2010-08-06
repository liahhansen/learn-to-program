class TicTacToe

  def initialize
    @game = [["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]]
  end
  
  def name
    "Tic Tac Toe"
  end
  
  def game_status
    @game
  end

  
  def play(outer_index, inner_index, player)
    @game[outer_index][inner_index] = player
    @game
  end
end