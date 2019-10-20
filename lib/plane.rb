class Plane
  def initialize
    @location = 'air'
  end

  def land(airport)
    raise "Plane is not in the air" if @location != 'air'

    airport.plane_lands
    @location = airport
  end

  def take_off(airport)
    raise "Plane is not in the airport" if @location != airport

    airport.plane_takes_off
    @location = 'air'
  end
end
