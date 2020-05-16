require_relative './weather'
require_relative './airport'

class Plane

  def initialize(in_flight = true)
    @in_flight = in_flight
  end

  def take_off
    flying?
    @in_flight = true
  end

  def flying?
    @in_flight = !@in_flight
  end

end