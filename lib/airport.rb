
class Airport

  DEFAULT_CAPACITY = 15
    
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'no landing space! airport full' if full?
    fail 'cannot land plane if weather stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    fail 'cannot take off if weather stormy' if stormy?
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..100) > 80
  end

end
