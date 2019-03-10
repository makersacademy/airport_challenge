class Plane
  attr_reader :location

  def initialize(airport)
    @location = airport
    airport.add_plane(self)
  end

  def land(airport)
    weather_err = StandardError.new("Can't land, weather is stormy")
    not_flying_err = StandardError.new("Can't land, already grounded")
    raise not_flying_err unless @location == "flying"
    raise weather_err unless airport.local_weather == "sunny"

    airport.add_plane(self)
    @location = airport
  end

  def take_off
    weather_err = StandardError.new("Can't take off, weather is stormy")
    already_flying_err = StandardError.new("Can't take off, already flying")
    raise already_flying_err unless @location != "flying"
    raise weather_err unless @location.local_weather == "sunny"

    @location.remove_plane(self)
    @location = "flying"
  end

end
