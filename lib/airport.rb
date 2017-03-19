require_relative 'airplane'

class Airport

  DEFAULT_CAPACITY = 50

  def initialize
    @landed_planes = []
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

  attr_reader :landed_planes

  def stormy?
    rand(1..20) < 5 ? true : false
  end

  def full?
    landed_planes.count >= DEFAULT_CAPACITY
  end

end
