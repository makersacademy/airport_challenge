require_relative 'plane'
require_relative 'takeoff_land'

class Airport

  include TakeoffLand

  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
    set_capacity
  end

  def land(plane, weather)
    error_if_full
    landed_plane = landing(plane, weather)
    add_plane(plane)
  end

  def takeoff(plane, weather)
    plane_not_in_airport_error(plane)
    flying_plane = taking_off(plane, weather)
    planes.delete(flying_plane)
  end

  def planes_in_airport
    @planes.dup
  end

  def set_capacity(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def add_plane(plane)
    raise "Plane has already landed!" if planes.include?(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.delete(plane)
  end

private

  attr_reader :planes, :capacity

  def error_if_full
    raise "The airport is full!" if full?
  end

  def full?
    @planes.length >= capacity
  end

  def plane_not_in_airport_error(plane)
    raise 'Plane cannot takeoff if it is not in an airport!' unless planes.include?(plane)
  end

end
