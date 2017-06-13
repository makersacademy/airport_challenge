require './docs/plane.rb'
require './docs/weather.rb'

class Airport

attr_reader :planes, :capacity

DEFAULT_CAPACITY = 45

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full!" if full?
    fail "Too stormy to land!" if unsafe_to_fly?
    fail "Plane already at the airport!" if planes.include?(plane)
    planes << plane
  end

  def confirm_land(plane)
    planes.include?(plane)
  end

  def take_off(plane)
    fail "Too stormy to take off!" if unsafe_to_fly?
    fail "Plane not found!" if !planes.include?(plane)
    planes.delete(plane)
  end

  def confirm_take_off(plane)
    !planes.include?(plane)
  end

  def full?
    planes.count >= capacity
  end

  def unsafe_to_fly?
    Weather.new.weather_type == "stormy"
  end

end
