require './lib/plane.rb'

class Airport

  def land_plane(bike)
    return Plane.new
  end

  def depart_plane(plane)
    raise "Plane has left"
  end

end 