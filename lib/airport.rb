require 'plane'
require 'weather'

class Airport
  attr_reader :planes
  attr_reader :capacity
  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane, weather=Weather.new)
    full?
    is_grounded?(plane)
    is_stormy?(weather)
    planes << plane
  end

  def takeoff(plane, weather=Weather.new)
    in_air?(plane)
    is_stormy?(weather)
    plane.in_air = true
    @planes.delete_at(@planes.index(plane))
  end

  private
  def is_stormy?(weather)
    fail 'Not able to do this action due to the weather' if weather.is_stormy?
  end

  def in_air?(plane)
    fail 'Plane already in the air' if plane.in_air == true
  end

  def is_grounded?(plane)
    fail 'Plane already at an airport' if plane.in_air == false
  end

  def full?
    fail 'The airport is full' if @planes.length == @capacity
  end
end