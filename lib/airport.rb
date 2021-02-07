class Airport

attr_reader :capacity, :planes

def initialize

  @capacity = $def_capacity
  @planes = 10

end

  def full?
    return true if @capacity <= @planes
    return false if @capacity > @planes
  end

  def land(plane)
    return false if Airport.new.full?
    return true if !Airport.new.full?
  end

end
