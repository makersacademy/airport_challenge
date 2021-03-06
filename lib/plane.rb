class Plane
  attr_accessor :origin, :destination, :in_flight

  def initialize
    @origin = Airport.new
    @destination = Airport.new
    @in_flight = false
  end 

  def location
    "location"
  end
end
