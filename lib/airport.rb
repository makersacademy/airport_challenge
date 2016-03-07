require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise "Plane cannot land in bad weather" if weather.stormy?
    raise 'No space for landing' if full?
    if plane.flying == true
      plane.land
      planes << plane
    else
      "Not an airborne plane."
    end
  end

  def take_off(plane)
    raise "Plane cannot take off in bad weather" if weather.stormy?
    if plane.flying == false || planes.include?(plane)
      planes.delete(plane)
      plane.take_off
    else
      "Plane not in airport"
    end
  end

  private

  DEFAULT_CAPACITY = 10

  def full?
    planes.size == capacity
  end

end