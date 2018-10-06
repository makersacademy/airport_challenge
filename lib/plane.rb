class Plane
attr_reader :location

  def initialize
    @location
  end

  def land(airport)
    @location = airport
  end
end
