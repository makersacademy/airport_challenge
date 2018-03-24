class Plane
  attr_accessor :plane
  def initialize
    @plane = 'plane'
  end

  def land_plane(airport)
    airport.planes_in_airport << @plane
  end

end
