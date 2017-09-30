class Plane
  attr_accessor :destination
  def fly_to airport
    @destination = airport
    airport.land self
  end
end
