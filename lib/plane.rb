require_relative "airport"

class Plane

  def initialize
    in_flight = true
  end

  attr_reader :in_flight

  def land
    in_flight = false
  end
end
