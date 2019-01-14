require_relative 'airport'

class Plane
  attr_reader :location, :flight_number

  def initialize
    @flying = true
    @flight_number = rand(100..999)
  end

  def swap_state
    @flying = !@flying
  end

  def land(airport)
    raise "Plane #{@flight_number} is already grounded!" if @flying != true

    airport.land(self)
  end

  def take_off(airport)
    raise "Plane #{@flight_number} is already flying!" if @flying == true

    airport.take_off(self)
  end

end
