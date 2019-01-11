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
    @flying == true ? airport.land(self)
    : (raise "Plane #{@flight_number} is already grounded at an airport")
  end

  def take_off(airport)
    @flying == false ? airport.take_off(self)
    : (raise "Plane #{@flight_number} is flying and so cannot take off!")
  end

end
