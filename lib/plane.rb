class Plane
  attr_reader :location

  def initialize(airport)
    @location = airport
  end

  def land(airport)
    raise StandardError.new("Can't land, weather is stormy") unless airport.weather == "sunny"
    @location = airport
  end

  def take_off
    raise StandardError.new("Can't take off, weather is stormy") unless @location.weather == "sunny"
    @location = "flying"
  end

end
