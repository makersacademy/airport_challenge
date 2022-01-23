require_relative 'plane'
class Airport
  attr_reader :planes_parking

  def initialize 
    @planes_parking = []
  end

  def release_plane
    my_plane = Plane.new
  end

  def land_plane(plane)
    @planes_parking.push(plane)
    "Plane has Landed"
  end

  def takeoff_plane(plane)
    @planes_parking.delete(plane)
    "Plane is not in the airport"
  end
end

# airport = Airport.new
# my_plane = airport.release_plane
# p airport.land_plane(my_plane)
# p airport.takeoff_plane(my_plane)
# p airport.planes_parking