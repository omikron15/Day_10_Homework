require("minitest/autorun")
require("minitest/rg")

require_relative("../bar.rb")
require_relative("../guest.rb")
require_relative("../drink.rb")
require_relative("../food.rb")
require_relative("../song.rb")

class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new("The White Horse", 100)
    @song1 = Song.new("Name", "Artist", "Line from song")
    @guest1 = Guest.new("Ruaridh", 26 ,50.00, @song1)
    @guest2 = Guest.new("Daniel", 23, 30.00, @song1)
    @guest3 = Guest.new("Connor", 25, 0.00, @song1)
    @guest4 = Guest.new("Child", 14, 1000.00, @song1)
    @drink1 = Drink.new("Whisky", 3.00, 30)
    @drink2 = Drink.new("Beer", 3.50, 10)
    @drink3 = Drink.new("Wine", 4.00, 20)
    @drink4 = Drink.new("Gin", 4.00, 30)
    @food1 = Food.new("Kebab", 4.00, 4)
    @food2 = Food.new("Falafel", 3.00, 2)
    @food3 = Food.new("Pizza", 6.00, 4)
    @food4 = Food.new("Chips", 2.00, 1)
    @bar.add_drink(@drink1)
    @bar.add_drink(@drink2)
    @bar.add_drink(@drink3)
    @bar.add_food(@food1)
    @bar.add_food(@food2)
    @bar.add_food(@food3)
  end

  def test_name()
    assert_equal("The White Horse", @bar.name)
  end

  def test_till_balance
    assert_equal(100, @bar.till_balance)
  end

  def test_get_drinks
    assert_equal([@drink1, @drink2, @drink3], @bar.get_drinks)
  end

  def test_get_food
    assert_equal([@food1, @food2, @food3], @bar.get_food)
  end

  def test_add_drink
    @bar.add_drink(@drink4)
    assert_equal([@drink1, @drink2, @drink3, @drink4], @bar.get_drinks)
  end

  def test_add_food
    @bar.add_food(@food4)
    assert_equal([@food1, @food2, @food3, @food4], @bar.get_food)
  end

  def test_check_id__underage
    assert_equal(false, @bar.check_id(@guest4))
  end

  def test_check_id__of_age
    assert_equal(true, @bar.check_id(@guest3))
  end

  def test_sell_drink
    @bar.sell_drink(@drink1, @guest1)
    assert_equal(103, @bar.till_balance)
  end

  def test_sell_drink__underage
    result = @bar.sell_drink(@drink1, @guest4)
    assert_equal("You can't buy a drink", result)
  end

  def test_sell_drink__No_money
    result = @bar.sell_drink(@drink1, @guest3)
    assert_equal("You can't buy a drink", result)
  end

  def test_sell_drink__Too_drunk
    @bar.sell_drink(@drink1, @guest1)
    @bar.sell_drink(@drink1, @guest1)
    @bar.sell_drink(@drink1, @guest1)
    result = @bar.sell_drink(@drink1, @guest1)
    assert_equal("You can't buy a drink", result)
  end

  def test_sell_food
    @bar.sell_food(@food2, @guest2)
    assert_equal(103, @bar.till_balance)
  end
  
  def test_sell_food__No_money
    result = @bar.sell_food(@food1, @guest3)
    assert_equal("You can't buy food", result)
  end

end #End of class
