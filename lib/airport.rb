require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY  = 25

attr_reader :capacity, :weather, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes =[]
    @capacity = capacity
    @weather = Weather.new
  end

#landing

  def land(plane)
    raise "The airport is full, the plane cannot land!!" if full?
    raise "Flight cancelled due to storm weather!" if storm?
    plane.landed
    planes << plane
  end

#taking-off

  def takeoff(plane)
    raise "Plane is not at the airport" if include?(plane)
    raise "Flight cancelled due to storm weather!" if storm?
    plane.taken_off
    planes.delete(plane)
  end

  #private :full?, :include?, :stormy?

  def storm?
    weather.stormy?
  end

  def full?
    planes.count >= capacity
  end

  def include?(plane)
    !planes.include?(plane)
  end

end
