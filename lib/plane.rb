class Plane
  attr_accessor :location
  attr_accessor :last_airport

  def initialize
    @location = "in the air"
    @last_airport = "none"
  end

  def land(airport, weather)
    fail "Can't land if not in the air." if @location != "in the air"
    fail "The hangar is full." if airport.full?
    fail "Can't land in stormy weather." if weather.weather_now? == "stormy"

    airport.add_plane
    @location = airport
  end

  def take_off(airport, weather)
    fail "The plane is not at this airport." if airport != @location
    fail "Can't take off in stormy weather." if weather.weather_now? == "stormy"

    @last_airport = airport
    @location = "in the air"
    location?
  end

  def location?
    "The plane is #{@location}."
  end
end
