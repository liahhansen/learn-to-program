require 'tic_tac_toe'
describe "TicTacToe" do
  before do
    start_game
  end
  
  it "has a name" do
    name.should == "Tic Tac Toe"
  end
  
  it "should initially have 9 empty 'squares'" do
    game_status.should == [["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]]
  end
  
  it "#play should allow player to make a mark on the board" do
    play(1,2,'x').should == [["-", "-", "-"], ["-", "-", "x"], ["-", "-", "-"]]
    play(1,0,'o').should == [["-", "-", "-"], ["o", "-", "x"], ["-", "-", "-"]]
  end
  
end