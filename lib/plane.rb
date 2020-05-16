class Plane

  attr_reader :location

  def initialize
    @location = "air"
  end

  def land_at(airport)
    @location = airport
  end
end
