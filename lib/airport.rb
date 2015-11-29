require_relative 'plane'

class Airport
  attr_reader :planes, :storm_level
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @storm_level = rand(1..10)
    @capacity = capacity
  end

  def tell_plane_to_land(plane)
    fail "Airport full" if full?
    fail "Plane can't land in a storm" if (plane.taken_off? == nil) && storm_level == 10
    plane.land
    planes << plane
  end

  def tell_plane_to_take_off(plane)
    fail "Plane can't take off in a storm" if (plane.landed? == true) && storm_level == 10
    plane.take_off
    planes.delete(plane)
  end


  def storm
    @storm_level = 10
  end

  def clear
    @storm_level = 1
  end

  private

  def full?
    @planes.count >= capacity
  end

end
