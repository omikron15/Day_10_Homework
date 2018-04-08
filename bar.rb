class Bar

  def initialize(name, till_balance)
    @name = name
    @till_balance = till_balance
    @drinks = []
    @food = []
  end

  def name()
    return @name
  end

  def till_balance()
    return @till_balance
  end

  def get_drinks
    return @drinks
  end

  def get_food
    return @food
  end

  def add_drink(drink)
    @drinks.push(drink)
  end

  def add_food(food)
    @food.push(food)
  end

  def check_id(guest)
    if guest.age >= 18
      return true
    else
      return false
    end
  end

  def sell_drink(drink, guest)
    if (check_id(guest)) && (guest.can_afford?(drink.price)) && (guest.drunk_level <= 80)
      @till_balance += drink.price
      guest.buy_a_drink(drink)
    else
      return "You can't buy a drink"
    end
  end

  def sell_food(food, guest)
    if guest.money >= food.price
      @till_balance += food.price
      guest.buy_food(food)
    else
      return "You can't buy food"
    end
  end

end #End of class
