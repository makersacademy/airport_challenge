require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :weather
  attr_writer :capacity
  DEFAULT_CAPACITY = 50

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = Weather.new
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
    planes.count >= capacity
  end

  def plane_in_airport?(plane)
    planes.include? plane 
  end

  def release_plane(plane)
    planes.delete(plane)
    plane.status = :flying
  end

  def land_plane(plane)
    planes << plane
    plane.status = :landed
  end

  def check_landing_conditions(plane)
    fail 'Plane already landed' if plane.status == :landed
    fail 'Airport full' if full?
    fail 'Weather stormy' if weather.stormy?
  end

  def can_take_off?(plane)
    fail 'Plane not in airport' unless plane_in_airport?(plane)
    fail 'Weather stormy' if weather.stormy?
  end

end
