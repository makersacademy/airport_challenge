require_relative 'planes'
require_relative 'weather'

class Airport

  attr_reader :apron, :capacity
  def initialize(capacity = 1)
    @apron = []
    @capacity = capacity
  end

  def land(plane)
    fail "A plane can't land, there's no room!" if apron.length == capacity

    fail "Plane cannot land during bad weather!" if weather_report == "stormy"

    apron << plane
  end

  def take_off(plane)
    apron.delete(plane)
  end

  def planes_at_airport
    apron
  end

  def weather_report
    #where every number is sunny except for 6 which is a rare occasion of stormy
    rand(1..9)
  end

end
