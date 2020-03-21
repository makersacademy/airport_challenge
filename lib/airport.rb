require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    check_landing_conditions(plane)
    land_plane(plane)
  end

  def take_off(plane)
    can_take_off?(plane)
    release_plane(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def weather_stormy?
    Weather.new.stormy?
  end

  def plane_in_airport?(plane)
    @planes.include? plane 
  end

  def release_plane(plane)
    @planes.delete(plane)
    plane.left_airport
  end

  def land_plane(plane)
    @planes << plane
    plane.landed
  end

  def check_landing_conditions(plane)
    fail 'Plane already landed' if plane.landed?
    fail 'Airport full' if full?
    fail 'Weather stormy' if weather_stormy?
  end

  def can_take_off?(plane)
    fail 'Plane not in airport' unless plane_in_airport?(plane)
    fail 'Weather stormy' if weather_stormy?
  end

end
