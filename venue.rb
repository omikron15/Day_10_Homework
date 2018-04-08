class Venue

  def initialize(name)
      @name = name
      @functions = []
  end

  def name
    return @name
  end

  def functions
    return @functions
  end

  def add_function(function)
      @functions.push(function)
  end

end #End of Venue class
