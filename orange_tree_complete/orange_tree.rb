class OrangeTree < ActiveRecord::Base

  def one_year_passes
    return "the tree is dead" if not alive?
    self.age = self.age + 1
    self.height = self.height + 1 unless mature?
    fruit_increase
  end
  
  def mature?
    self.age > 10
  end
  
  def alive?
    self.age <= 30
  end
  
  def pick_orange
    return "the tree is dead" if not alive?
    if self.fruit != 0
     self.fruit -= 1
      taste = ["Mmmmm...that was delicious", "Tastes like orange", "Pucka...yuck.  There is an ant in my orange"]
      taste[rand(3)]
    else
      "No fruit"
    end
  end
  
  private
  def fruit_increase
    self.fruit = (self.age - 4) * 5 unless self.age < 5
  end
end