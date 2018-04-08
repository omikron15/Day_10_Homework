class Guest

    def initialize(name, age, money, favourite_song)
        @name = name
        @age = age
        @money = money
        @favorite_song = favourite_song
        @drunk_level = 0
    end #End of initialize function

    def name()
        return @name
    end #End of name function

    def age()
        return @age
    end #End of age function

    def money()
        return @money
    end #End of money function

    def favourite_song()
        return @favorite_song
    end #End of favorite_song function

    def drunk_level()
      return @drunk_level
    end

    def buy_a_drink(drink)
      if can_afford?(drink.price)
        @money -= drink.price
        @drunk_level += drink.alcohol_level
      else
        return "Not enough money!"
      end
    end

    def buy_food(food)
      if can_afford?(food.price)
          @money -= food.price
          @drunk_level -= food.rejuvenation_level
        if @drunk_level < 0
          @drunk_level = 0
        end
      else
        return "Not enough money!"
      end
    end

    def can_afford?(price)
        if price <= @money
          return true
        else
          return false
        end
    end #End of can_afford? function

end #End of Guest class
