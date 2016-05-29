require_relative 'plane.rb'
require_relative 'weather.rb'


class Airport

attr_accessor :capacity, :planes

DEFAULT_CAPACITY = 100


def initialize(capacity=DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
end


  def land(plane)
    raise "Airport full" if full?
    raise "Impossible to land" if stormy?
    planes << plane
    landed_plane = planes.last
    landed_plane.arrival
    "Plane #{plane} landed successfully"
  end

  def take_off(plane)
    raise "Airport empty" if empty?
    raise "Impossible to take off" if stormy?
    flying_plane = @planes.delete(plane)
    flying_plane.departure
    "Plane #{plane} took off successfully"
  end

private

  def stormy?
    Weather.new.check_storm
  end

  def full?
    planes.length >= DEFAULT_CAPACITY
  end

  def empty?
    planes.length == 0
  end

end
