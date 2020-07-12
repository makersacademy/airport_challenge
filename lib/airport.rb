require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :capacity, :weather, :planes

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather.stormy?
    @planes = []
  end

  def checks_for(plane)
    planes.include?(plane) ? true : false
  end

  def full?
    planes.count >= capacity
  end

  def land(plane)
    fail 'Weather conditions do not permit landing' if weather == true
    fail 'Plane is not flying' if plane.flying? == false
    fail 'Airport is at capacity' if full?

    plane.landed
    planes << plane
  end

  def take_off(plane)
    fail 'Weather conditions do not permit take off' if weather == true
    fail 'Plane is flying' if plane.flying? == true
    fail 'Plane is not at airport' if checks_for(plane) == false

    plane.taken_off
    planes.delete(plane)
  end
end
