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
    raise "The airport is full!" if full?
    landed_plane = landing(plane, weather)
    @planes << landed_plane
  end

  def takeoff(plane, weather)
    flying_plane = taking_off(plane, weather)
    planes.delete(flying_plane)
  end

  def planes_in_airport
    @planes.dup
  end

  def set_capacity(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end


private

  attr_reader :planes, :capacity

  def full?
    @planes.length >= capacity
  end

end
