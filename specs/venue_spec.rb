require("minitest/autorun")
require("minitest/rg")

require_relative("../venue.rb")
require_relative("../bar.rb")
require_relative("../drink.rb")
require_relative("../food.rb")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")

class VenueTest < Minitest::Test

  def setup
      @venue1 = Venue.new("Venue_Name")

      @room1 = Room.new("Name 1", 10, 5)
      @room2 = Room.new("Name 2", 3, 5)
      @bar = Bar.new("The White Horse", 100)

      @song1 = Song.new("Song 1", "Artist 1", "Line from song 1")
      @song2 = Song.new("Song 2", "Artist 2", "Line from song 2")
      @song3 = Song.new("Song 3", "Artist 3", "Line from song 3")

      @guest1 = Guest.new("Guest 1", 17, 300, @song1)
      @guest2 = Guest.new("Guest 2", 18, 400, @song2)
      @guest3 = Guest.new("Guest 3", 18, 0, @song3)
      @guest4 = Guest.new("Guest 4", 25, 1000, @song1)

      @drink1 = Drink.new("Whisky", 3.00, 30)
      @drink2 = Drink.new("Beer", 3.50, 10)
      @drink3 = Drink.new("Wine", 4.00, 20)
      @drink4 = Drink.new("Gin", 4.00, 30)
      @food1 = Food.new("Kebab", 4.00, 4)
      @food2 = Food.new("Falafel", 3.00, 2)
      @food3 = Food.new("Pizza", 6.00, 4)
      @food4 = Food.new("Chips", 2.00, 1)

      @room1.add_guest(@guest1)
      @room1.add_guest(@guest2)
      @room1.add_song(@song1)
      @room1.add_song(@song2)
      @room2.add_guest(@guest1)
      @room2.add_guest(@guest2)
      @room2.add_guest(@guest3)
      @bar.add_drink(@drink1)
      @bar.add_drink(@drink2)
      @bar.add_drink(@drink3)
      @bar.add_food(@food1)
      @bar.add_food(@food2)
      @bar.add_food(@food3)
  end

  def test_get_name
      assert_equal("Venue_Name" , @venue1.name)
  end

  def test_get_function
      assert_equal([] , @venue1.functions)
  end

  def test_add_function
      @venue1.add_function(@bar)
      @venue1.add_function(@room1)
      @venue1.add_function(@room2)
      assert_equal([@bar, @room1, @room2], @venue1.functions)
  end

end #End of VenueTest class
