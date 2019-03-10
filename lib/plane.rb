class Plane
  attr_reader :location

  def initialize(airport)
    @location = airport
  end

  def land(airport)
    weather_err_msg = "Can't land, weather is stormy"
    raise StandardError.new(weather_err_msg) unless airport.weather == "sunny"

    @location = airport
  end

  def take_off
    weather_err_msg = "Can't take off, weather is stormy"
    raise StandardError.new(weather_err_msg) unless @location.weather == "sunny"

    @location = "flying"
  end

end
