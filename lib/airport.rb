class Airport 
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full: Cannot land' if full?

    fail 'Cannot land: Weather is stormy' if stormy? 

    @planes << plane
  end

  def take_off(plane)
    fail 'Cannot take off: Weather is stormy' if stormy? 

  end

private 
  def full?
    @planes.length >= @capacity
  end
  
  def stormy?
    rand(1..10) > 8
    # return true
  end

end

# class Airport
#   def initialize(capacity)
#     @capacity = capacity
#     @planes =[]
#   end
#   def land(plane)
#     raise 'Cannot land plane: airport full' if full?
#     raise 'Cannot land plane: weather is stormy' if stormy?
#     @planes << plane
#   end

#   def take_off(plane)
#     raise 'Cannot take off plane: weather is stormy' if stormy?
#   end
# end

# private
# def full?
#   @planes.length >= @capacity
# end

# def stormy?
#   rand(1..6) > 4
# end