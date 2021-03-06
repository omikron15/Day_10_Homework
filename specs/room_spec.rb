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
    @guest4 = Guest.new("Guest 3", @song3, 0)
    @room1 = Room.new("Name 1", 10, 5)
    @room2 = Room.new("Name 2", 3, 5)
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    @room2.add_guest(@guest1)
    @room2.add_guest(@guest2)
    @room2.add_guest(@guest3)
  end

  def test_get_room_name
      assert_equal("Name 1", @room1.name)
  end

  def test_get_room_capacity
      assert_equal(10, @room1.capacity)
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

  def test_add_guest_to_room
      @room1.add_guest(@guest3)
      assert_equal([@guest1, @guest2, @guest3], @room1.guests)
  end

  def test_add_song_to_room
      @room1.add_song(@song3)
      assert_equal([@song1, @song2, @song3], @room1.songs)
  end

  def test_remove_guest_from_room
      @room1.remove_guest(@guest2)
      assert_equal([@guest1], @room1.guests)
  end

  def test_remove_song_from_room
      @room1.remove_song(@song2)
      assert_equal([@song1], @room1.songs)
  end

  def test_add_guest_to_room__room_full
      result = @room2.add_guest(@guest3)
      assert_equal([@guest1, @guest2, @guest3], @room2.guests)
      assert_equal("Room full! No Entry!", result)
  end

  def test_add_guest_to_room__guest_cant_afford
      result = @room1.add_guest(@guest4)
      assert_equal([@guest1, @guest2], @room1.guests)
      assert_equal("Guest can't afford entry! No Entry!", result)
  end

  def test_room_is_full?
      result = @room1.room_is_full?()
      result2 = @room2.room_is_full?()
      assert_equal(false, result)
      assert_equal(true, result2)
  end

end #End of RoomTest class
