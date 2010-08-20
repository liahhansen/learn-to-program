require "#{File.dirname(__FILE__)}/orange_tree"

# height should be an integer
# age should be an integer
# fruit should be an integer
# one_year_passes method ages the tree one year
# height increases each year until maturity
# tree dies after x number of years
# fruit begins to be produced after x number of years
# older trees produce more fruit than younger ones
# should be able to count the number of oranges on the tree

# should be able to pick an orange 
#   reduces the number of oranges on the tree 
#   returns a string telling you how delicious (or yucky) the orange was
#   if there are no more oranges on the tree, you cant pick an orange
# oranges should fall off the tree before the end of the year if they arent picked

#30 - dies
#10 - maturity

describe OrangeTree do
  before do
    @orange_tree = OrangeTree.new 
  end
  
  it "#height should be an integer" do
    @orange_tree.height.should be_kind_of(Integer)
  end
  
  it "#age should be an integer" do
    @orange_tree.age.should be_kind_of(Integer)
  end
  
  it "#fruit should be an integer" do
    @orange_tree.fruit.should be_kind_of(Integer)
  end
  
  it "upon initialization #age should be zero" do
    @orange_tree.age.should == 0
  end
  
  it "upon initialization #fruit should be zero" do
    @orange_tree.fruit.should == 0
  end
  
  it "upon initialization #height should be zero" do
    @orange_tree.height.should == 0
  end
  
  it "#one_year_passes should age the tree one year" do
    @orange_tree.age.should == 0
    @orange_tree.one_year_passes
    @orange_tree.age.should == 1
  end
  
  it "#one_year_passes should increase the height 1 foot in first year" do
    @orange_tree.height.should == 0
    @orange_tree.one_year_passes
    @orange_tree.height.should == 1
  end
  
  it "#height should stop increasing at maturity" do
    10.times { @orange_tree.one_year_passes }
    @orange_tree.height.should == 10
    @orange_tree.one_year_passes
    @orange_tree.height.should == 10
  end
  
  it "should die after 30 years" do
    31.times { @orange_tree.one_year_passes }
    @orange_tree.alive?.should == false
  end
  
  it "#fruit is produced after 5 years" do
    5.times { @orange_tree.one_year_passes }
    @orange_tree.fruit.should == 5
  end
  
  it "orange tree should not respond to fruit_increases" do
    lambda {
      @orange_tree.fruit_increase
    }.should raise_error
  end
  
  it "#fruit produced should increase as tree ages" do
    7.times { @orange_tree.one_year_passes }
    @orange_tree.fruit.should == 15    
  end
  
  it "#pick_orange should reduce the fruit count by one" do
    5.times { @orange_tree.one_year_passes }
    @orange_tree.pick_orange
    @orange_tree.fruit.should == 4
  end
  
  it "#pick_orange should return a string" do
    @orange_tree.pick_orange.should be_kind_of(String)
  end 
  
  it "#pick_orange should tell eater how orange tasted" do
    5.times { @orange_tree.one_year_passes }
    ["Mmmmm...that was delicious", "Tastes like orange", "Pucka...yuck.  There is an ant in my orange"].should include(@orange_tree.pick_orange)
  end
  
  it "#pick_orange should not work if there are no oranges on the tree" do
    @orange_tree.fruit.should == 0
    @orange_tree.pick_orange.should == "No fruit"
  end
end