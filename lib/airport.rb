require_relative 'airplane'

class Airport
  def land(airplane)
    airplane.landed=(true)
    airplane
  end
end
