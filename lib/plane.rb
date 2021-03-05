class Plane
  attr_accessor :origin, :destination

  def initialize
    @origin = Airport.new
    @destination = Airport.new
  end 

  def location
    "location"
  end
end
