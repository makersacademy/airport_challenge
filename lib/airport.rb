class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if @planes.count == DEFAULT_CAPACITY
    @planes << plane
  end

  def take_off(weather)
    fail "Can not take off, weather is stormy" if weather.stormy? == true 
    @planes.pop
  end
end