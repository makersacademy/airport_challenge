require_relative 'airplane'

class Airport
  attr_reader :airplanes

  def land(airplane)
    airplane.landed=(true)
    @airplanes = airplane
  end

  def takeoff(airplane)
    airplane.landed=(false)
    airplane
  end
end
