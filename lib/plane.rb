class Plane
  attr_accessor :destination
  def fly_to airport
    @destination = airport
    airport.land self
  end

  def take_off airport
    @destination = nil
    airport.leave self
  end
end
