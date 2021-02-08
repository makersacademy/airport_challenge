class Airport

attr_reader :capacity, :planes, :weather

def initialize

  @capacity = $def_capacity
  @planes = 10
  @weather = $def_weather

end

  def full?
    return true if @capacity <= @planes
    return false if @capacity > @planes
  end

  def land(plane)
    return false if Airport.new.full?
    return true if !Airport.new.full?
  end

  def take_off(plane)
    return true if !Weather.new.stormy?
    return false if Weather.new.stormy?
  end

end
