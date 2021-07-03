class Plane

  attr_accessor :location

  def initialize
    @location = nil
  end

  def land(airport)
    @location = airport
  end

  def take_off(airport)
    @location = "enroute"
  end
end