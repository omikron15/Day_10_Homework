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

    if room_is_full?()
      return "Room full! No Entry!"
    elsif guest.can_afford?(@price)
      @guests.push(guest)
    else
      return "Guest can't afford entry! No Entry!"
    end
      
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

    def room_is_full?()
        if @guests.count < @capacity
          return false
        else
          return true
        end
    end #End of room_is_full function

end #End of Room class
