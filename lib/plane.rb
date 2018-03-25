class Plane
  attr_accessor :plane
  attr_accessor :grounded
  def initialize
    @plane 
  end

  def land_plane(airport)
    raise "The airport is full" if airport.airport_full?
    airport.planes << @plane
  end

end
