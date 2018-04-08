require("minitest/autorun")
require("minitest/rg")

require_relative("../food.rb")

class FoodTest < MiniTest::Test

  def setup
    @food1 = Food.new("Kebab", 4.00, 4)
    @food2 = Food.new("Falafel", 3.00, 2)
    @food3 = Food.new("Pizza", 6.00, 4)
    @food4 = Food.new("Chips", 2.00, 1)
  end

  def test_name
    assert_equal("Falafel", @food2.name)
  end

  def test_price
    assert_equal(2.00, @food4.price)
  end

  def test_rejuvenation_level
    assert_equal(4, @food3.rejuvenation_level)
  end

end
