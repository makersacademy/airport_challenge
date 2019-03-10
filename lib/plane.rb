class Plane
  attr_accessor :location

  def initialize(airport)
    @location = airport
  end

  def land(airport)
    @location = airport
  end

  def take_off
    @location = "flying"
  end

end
