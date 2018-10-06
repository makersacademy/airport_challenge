require 'pry'

class Plane

  def land(airport)
    raise "This plane has already landed" if @location == airport
    airport.receive(self)
    @location = airport
  end

  def takeoff
    raise "This plane is already in the air" if @location == "air"
    @location.sendoff(self)
    @location = "air"
  end

  private

  attr_accessor :location

end
