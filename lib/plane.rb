class Plane
  attr_reader :location

  def initialize(airport)
    @location = airport
    airport.add_plane(self)
  end

  def land(airport)
    weather_err_msg = "Can't land, weather is stormy"
    not_flying_msg = "Can't land, already grounded"
    raise StandardError.new(not_flying_msg) unless @location == "flying"
    raise StandardError.new(weather_err_msg) unless airport.weather == "sunny"

    airport.add_plane(self)
    @location = airport
  end

  def take_off
    weather_err_msg = "Can't take off, weather is stormy"
    already_flying_msg = "Can't take off, already flying"
    raise StandardError.new(already_flying_msg) unless @location != "flying"
    raise StandardError.new(weather_err_msg) unless @location.weather == "sunny"

    @location.remove_plane(self)
    @location = "flying"
  end

end
