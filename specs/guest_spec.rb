require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../drink.rb")
require_relative("../food.rb")

class GuestTest < Minitest::Test

  def setup()
    @song1 = Song.new("Name", "Artist", "Line from song")
    @guest1 = Guest.new("Name", 17, 300, @song1)
    @guest2 = Guest.new("Name", 18, 400, @song1)
    @guest3 = Guest.new("Name", 18, 0, @song1)
    @drink1 = Drink.new("Whisky", 3.00, 30)
    @drink2 = Drink.new("Beer", 3.50, 10)
    @drink3 = Drink.new("Wine", 4.00, 20)
    @food1 = Food.new("Kebab", 4.00, 4)
    @food2 = Food.new("Falafel", 3.00, 2)
    @food3 = Food.new("Pizza", 6.00, 4)
    @food4 = Food.new("Chips", 2.00, 1)
  end #End of setup function

  def test_get_guest_name()
      assert_equal("Name", @guest1.name())
  end #End of test_get_guest_name

  def test_get_guest_age()
      assert_equal(17, @guest1.age)
      assert_equal(18, @guest2.age)
  end #End of test_get_guest_age

  def test_get_guest_favourite_song()
      assert_equal(@song1, @guest1.favourite_song())
  end #End of test_get_guest_favourite_song

  def test_get_guest_money()
      assert_equal(300, @guest1.money())
  end #End of test_get_guest_money function

  def test_get_guest_drunk_level__no_drink()
      assert_equal(0, @guest1.drunk_level())
  end #End of test_get_guest_money function

  def test_drunk_level__with_drink
      @guest1.buy_a_drink(@drink2)
      assert_equal(10, @guest1.drunk_level)
  end

  def test_guest_can_afford__enough_money()
      assert_equal(true, @guest1.can_afford?(100))
  end #End of test_guest_can_afford__enough_money function

  def test_guest_can_afford__not_enough_money()
      assert_equal(false, @guest1.can_afford?(500))
  end #End of test_guest_can_afford__not_enough_money function

  def test_buy_a_drink__can_afford
    @guest1.buy_a_drink(@drink1)
    assert_equal(297.00, @guest1.money)
  end

  def test_buy_food__can_afford
    @guest1.buy_food(@food2)
    assert_equal(297.00, @guest1.money)
  end

  def test_buy_a_drink__cant_afford
    result = @guest3.buy_a_drink(@drink1)
    assert_equal("Not enough money!", result)
    assert_equal(0, @guest1.money)
  end

  def test_buy_food__cant_afford
    result @guest3.buy_food(@food2)
    assert_equal("Not enough money!", result)
    assert_equal(0, @guest1.money)
  end

end #End of GuestTest class
