require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_HANGER_CAPACITY = 20

  attr_writer  :capacity

  attr_reader :weather

  def initialize(weather = Weather.new)
    @weather = weather
    @hanger = []
    @capacity = DEFAULT_HANGER_CAPACITY
  end

  def land(plane)
    landing_errors?(plane)
    plane.grounded(self)
    @hanger << plane
  end

  def take_off(plane)
    take_off_errors(plane, self)
    @hanger.delete(plane)
    plane.airborne
  end

private

ERRORS = {
  airborne: "Cannot take off. Plane already airborne",
  on_ground: "Cannot land. Plane already on the ground",
  on_site: "Plane at wrong airport",
  weather_take_off: "The weather is too bad to fly",
  weather_landing: "The weather is too bad to land",
  full_hanger: "The plane can't land because the hanger is full"
}

  def landing_errors?(plane)
    fail ERRORS[:on_ground] if plane_grounded?(plane)
    fail ERRORS[:weather_landing] if weather.storms?
    fail ERRORS[:full_hanger] if hanger_full?
  end

  def plane_grounded?(plane)
    plane.location != "Airborne"
  end

  def hanger_full?
    @hanger.count == @capacity
  end

  def take_off_errors(plane, airport)
    fail ERRORS[:airborne] if plane_airborne?(plane)
    fail ERRORS[:on_site] unless plane_at_airport?(plane, airport)
    fail ERRORS[:weather_take_off] if weather.storms?
  end

  def plane_airborne?(plane)
    plane.location == "Airborne"
  end

  def plane_at_airport?(plane, airport)
    plane_on_site?(plane, airport) || new_plane?(plane)
  end

  def plane_on_site?(plane, airport)
    plane.location == airport
  end

  def new_plane?(plane)
    plane.location == "The Factory"
  end

end
