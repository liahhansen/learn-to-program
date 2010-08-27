require 'reverse_iterator'

describe Array do
  before do
    @array = [2,4,6]
  end
  it "should return an array" do
    ["hi", "bye"].reverse_iterate{}.should be_kind_of(Array)
  end
  
  it "should execute a block and return an array" do
    new_array = []
    [].reverse_iterate { |element| new_array << element }
    new_array.should == []
  end
  
  it "should an array of one element" do
    new_array = [1]
    [].reverse_iterate { |element| new_array << element }
    new_array.should == [1]
  end
  
  it "reverse an array of multiple elements" do
    new_array = []
    [2,4,6].reverse_iterate { |element| new_array << element }
    new_array.should == [6,4,2]
  end
end