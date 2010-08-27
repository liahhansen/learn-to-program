class OrangeTree < ActiveRecord::Base  
  def one_year_passes
    return "the tree is dead" if not alive?
    @age = @age + 1
    @height = @height + 1 unless mature?
    fruit_increase
  end
  
  def mature?
    @age > 10
  end
  
  def alive?
    @age <= 30
  end
  
  def pick_orange
    return "the tree is dead" if not alive?
    if @fruit != 0
     @fruit -= 1
      taste = ["Mmmmm...that was delicious", "Tastes like orange", "Pucka...yuck.  There is an ant in my orange"]
      taste[rand(3)]
    else
      "No fruit"
    end
  end
  
  private
  def fruit_increase
    @fruit = (@age - 4) * 5 unless @age < 5
  end
end