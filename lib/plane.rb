class Plane
  attr_accessor :in_flight

  def initialize(in_flight = true)
    @in_flight = in_flight
  end
end
