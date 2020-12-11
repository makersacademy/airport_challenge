require 'plane'

class Airport

  def initialize
    @max_capacity = 5
    @airplanes = []
  end

  def load_planes(num)
    num.times { land_plane(Plane.new) }
  end

  def count_planes
    @airplanes.length
  end

  def override_max_capacity(new_max)
    @max_capacity = new_max
  end
  
  def capacity_max?
    return count_planes == @max_capacity
  end

  def in_airport?(search_plane)
    @airplanes.any? { |airplane| airplane.object_id == search_plane.object_id }
    # returns true if any of the airplanes in the array have the same ID as the search plane
  end

  def land_plane(plane)
    @airplanes << plane
  end

  def take_off_plane(search_plane)
    @airplanes.reject! { |airplane| airplane.object_id == search_plane.object_id }
  end

end
