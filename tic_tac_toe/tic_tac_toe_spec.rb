require 'tic_tac_toe'
describe TicTacToe do
  before do
    @tic_tac_toe = TicTacToe.new
  end
  
  it "has a name" do
    @tic_tac_toe.name.should == "Tic Tac Toe"
  end
  
  it "should initially have 9 empty 'squares'" do
    @tic_tac_toe.game_status.should == [["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]]
  end
  
  it "#play should allow player to make a mark on the board" do
    @tic_tac_toe.play(1,2,'x').should == [["-", "-", "-"], ["-", "-", "x"], ["-", "-", "-"]]
    @tic_tac_toe.play(1,0,'o').should == [["-", "-", "-"], ["o", "-", "x"], ["-", "-", "-"]]
  end
  
end