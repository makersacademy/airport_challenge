require_relative 'plane.rb'

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def takeoff_plane(plane)
    fail "We can't take off as it is stormy" if stormy?

    planes_for_takeoff = @planes.select { plane }
    plane_for_takeoff = planes_for_takeoff.pop
    @planes.delete(plane_for_takeoff)
    return plane_for_takeoff
  end

private
  def stormy?
    weather = rand(0..1)
    true if weather.zero?
    false
  end
end
