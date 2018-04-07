class Guest

    def initialize(name, favourite_song, money)
        @name = name
        @favorite_song = favourite_song
        @money = money
    end #End of initialize function

    def name()
        return @name
    end #End of name function

    def favourite_song()
        return @favorite_song
    end #End of favorite_song function

    def money()
        return @money
    end #End of money function

    def can_afford?(price)
        if price <= @money
          return true
        else
          return false
        end
    end #End of can_afford? function

end #End of Guest class
