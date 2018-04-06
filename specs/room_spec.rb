require("minitest/autorun")
require("minitest/rg")

require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class RoomTest < Minitest::Test

  def setup ()
    @song1 = Song.new("Song 1", "Artist 1", "Line from song 1")
    @song2 = Song.new("Song 2", "Artist 2", "Line from song 2")
    @song3 = Song.new("Song 3", "Artist 3", "Line from song 3")
    @guest1 = Guest.new("Guest 1", @song1, 300)
    @guest2 = Guest.new("Guest 2", @song2, 300)
    @guest3 = Guest.new("Guest 3", @song3, 300)
    @room1 = Room.new("Name", 10, 5)
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_song(@song1)
    @room1.add_song(@song2)
  end

  def test_get_room_name
      assert_equal("Name", @room1.name)
  end

  def test_get_room_size
      assert_equal(10, @room1.size)
  end

  def test_get_room_guests
      assert_equal([@guest1, @guest2], @room1.guests)
  end

  def test_get_room_songs
      assert_equal([@song1, @song2], @room1.songs)
  end

  def test_get_room_price
      assert_equal(5, @room1.price)
  end

end #End of RoomTest class
