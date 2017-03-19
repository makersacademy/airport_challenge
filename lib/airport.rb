require_relative 'airplane'

class Airport
  attr_writer :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land_plane(airplane)
    raise "Plane cannot land. The airport is full" if full?
    raise "Plane cannot land due to stormy weather" if stormy?
    landed_planes << airplane
  end

  def take_off
    raise "Plane cannot take off due to stormy weather" if stormy?
    landed_planes.pop
  end


private

  attr_reader :landed_planes, :capacity

  def stormy?
    rand(1..20) < 5 ? true : false
  end

  def full?
    landed_planes.count >= capacity
  end

end
