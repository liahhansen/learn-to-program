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
    @game.each do |row|
      puts row.join("|")
    end
    @game
  end
end

ti = TicTacToe.new
my_game_name = ti.name
