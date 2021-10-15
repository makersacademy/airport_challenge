require './lib/plane.rb'

class Airport

  def depart_plane(plane)
    raise "Plane has left"
  end

  def land_plane(plane)
    raise "No bays available" if full?
  end

  def full?
    return true
  end

end 