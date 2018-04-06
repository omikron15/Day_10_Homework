require("minitest/autorun")
require("minitest/rg")

require_relative("../song.rb")

class SongTest < Minitest::Test

  def setup()
    @song1 = Song.new("Name", "Artist", "Line from song")
  end #end of setup function

  def test_get_song_name()
      assert_equal("Name", @song1.name())
  end

  def test_get_song_artist()
      assert_equal("Artist", @song1.artist())
  end

  def test_get_song_line()
      assert_equal("Line from song", @song1.song_line())
  end

end #End of SongTest class
