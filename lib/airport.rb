require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  attr_writer :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail "Plane cannot land in bad weather" if weather.stormy?
    fail 'No space for landing' if full?
    if plane.flying == true
      plane.land
      planes << plane
    else
      "Not an airborne plane."
    end
  end

  def take_off(plane)
    fail "Plane can't take_off due to bad weather" if weather.stormy?
    if plane.flying == false || planes.include?(plane)
      plane = planes.pop
      plane.take_off
    else
      "Plane not in airport"
    end
  end

  private

  attr_reader :weather

  DEFAULT_CAPACITY = 10

  def full?
    planes.size == @capacity
  end

end