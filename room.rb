class Room

    def initialize(name, capacity, price)
        @name = name
        @capacity = capacity
        @price = price
        @guests = []
        @songs = []
    end #End of initialize function

    def name()
      return @name
    end #End of name function

    def capacity()
      return @capacity
    end #End of capacity function

    def price()
      return @price
    end #End of price function

    def guests()
      return @guests
    end #End of guest function

    def songs()
      return @songs
    end #End of song function

    def add_guest(guest)
      @guests.push(guest)
    end #End of add_guest function

    def add_song(song)
      @songs.push(song)
    end #End of add_song function

    def remove_guest(guest)
      @guests.delete(guest)
    end #End of remove_guest function

    def remove_song(song)
      @songs.delete(song)
    end #End of remove_song function

end #End of Room class
