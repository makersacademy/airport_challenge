class Plane

  def land(airport)
    airport.receive(self)
    @location = airport
  end

  def takeoff
    @location.sendoff(self)
  end

  private

  attr_reader :location

end
