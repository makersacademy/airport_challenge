class Plane
  attr_accessor :in_flight
  
  def initialize(in_flight = false)
    @in_flight = in_flight
  end

  def in_flight?
    @in_flight
  end
end
