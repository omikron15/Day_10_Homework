require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")
require_relative("../song.rb")

class GuestTest < Minitest::Test

  def setup()
    @song1 = Song.new("Name", "Artist", "Line from song")
    @guest1 = Guest.new("Name", @song1, 300)
  end #End of setup function

  def test_get_guest_name()
      assert_equal("Name", @guest1.name())
  end #End of test_get_guest_name

  def test_get_guest_favourite_song()
      assert_equal(@song1, @guest1.favourite_song())
  end #End of test_get_guest_favourite_song

  def test_get_guest_money()
      assert_equal(300, @guest1.money())
  end #End of test_get_guest_money function

end #End of GuestTest class
