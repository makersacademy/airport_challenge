class Airport
  attr_accessor :runway
  def initialize
    @runway = []
  end
end

class Plane
  def land(airport)
    airport.runway << self
  end
end
