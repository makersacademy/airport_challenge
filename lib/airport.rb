require_relative 'plane'

class Airport
  attr_reader :capacity
  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
  end

  def clear_for_takeoff
    my_plane = planes.pop
    my_plane.take_off
    my_plane
  end

  def clear_for_landing(plane)
    plane.land
    fail 'Airport full' if full?
    planes << plane
  end

  private
  attr_reader :planes

  def full?
    planes.size >= capacity
  end

end
