require_relative "airport"

class Plane

  def initialize
    in_flight = true
  end

  attr_accessor :in_flight
  alias in_flight? in_flight

  def land
    in_flight = false
  end

  def take_off
    in_flight = true
  end
end
