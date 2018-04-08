class Drink

  def initialize(name, price, alcohol_level)
    @name = name
    @price = price
    @alcohol_level = alcohol_level
  end

  def name()
    return @name
  end
  
  def price()
    return @price
  end

  def alcohol_level()
    return @alcohol_level
  end

end
