class Plane
  attr_reader :location

  def initialize(airport)
    @location = airport
  end

  def land(airport)
    @location = airport
  end

  def take_off
    raise(StandardError("Can't take off, weather is stormy")) unless @location.weather == "sunny"
    @location = "flying"
  end

end
