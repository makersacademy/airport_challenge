require 'TrafficController'
require 'Plane'

class Airport

  def initialize
    @max_capacity = 5
    @airplanes = []
  end

  def override_max_capacity(new_max)
    @max_capacity = new_max
  end
  
  def capacity_max?
    return @airplanes.length == @max_capacity
  end

  def in_airport?(search_plane)
    return @airplanes.any? {|airplane| airplane.ID == search_plane.ID }
    # returns true if any of the airplanes in the array have
    # the same ID as the search plane
  end

  def land_plane(plane)
    @airplanes << plane
  end

end