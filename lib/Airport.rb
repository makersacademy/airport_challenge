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
    @airplanes.any?(search_plane)
  end

  def land_plane(plane)
    @airplanes << plane
  end

  def take_off_plane(search_plane)
    @airplanes.delete(search_plane)
  end

end
