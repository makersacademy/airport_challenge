class Plane
  attr_accessor :plane
  def initialize
    @plane = 'plane'
  end

  def land_plane(airport)
    raise "The airport is full" if airport.airport_full?
    airport.planes_in_airport << @plane
  end

end
