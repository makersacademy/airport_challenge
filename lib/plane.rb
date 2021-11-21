class Plane
  attr_reader :location

  def initialize(location = :airbourne)
    @location = location
  end

  def land(airport)
    @location = airport
  end

  def take_off
    @location = :airbourne
  end
end
