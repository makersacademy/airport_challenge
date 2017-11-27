require_relative 'airport'
require_relative 'weather'

class Plane

  attr_reader :status

  def initialize
    @status = "In the air"
  end

  def land(airport)
    raise "Plane is already on the ground" if @status != "In the air"
    # If airport called this method, sets status to airport
    # If plane called this method, notifies airport and makes airport call the method
    # This way, both the plane and airport can initiate a landing
    airport.plane_expected?(self) ? @status = airport : airport.land(self)
  end

  def takeoff
    raise "Plane is already in the air" if @status == "In the air"
    @status.on_runway?(self) ? @status = "In the air" : @status.takeoff(self)
  end

end
