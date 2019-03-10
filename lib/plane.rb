class Plane
  attr_reader :location

  def initialize(airport)
    @location = airport
    airport.fleet << self
  end

  def land(airport)
    weather_err_msg = "Can't land, weather is stormy"
    capacity_err_msg = "Can't land, airport is full"
    raise StandardError.new(weather_err_msg) unless airport.weather == "sunny"

    raise StandardError.new(capacity_err_msg) unless airport.full? == false

    @location = airport
    airport.fleet << self
  end

  def take_off
    weather_err_msg = "Can't take off, weather is stormy"
    raise StandardError.new(weather_err_msg) unless @location.weather == "sunny"

    @location.fleet.delete(self)
    @location = "flying"
  end

end
