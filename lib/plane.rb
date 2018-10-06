class Plane
attr_reader :location

  def initialize
    @location
  end

  def land(airport)
    @location = airport
  end

  def take_off
    @location = "sky"
  end
end
