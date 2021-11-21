class Plane
  attr_reader :location

  def initialize(location = :airbourne)
    @location = location
  end

  def land(airport)
    @location = airport
  end
end
