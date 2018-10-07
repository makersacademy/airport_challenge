require_relative 'plane'
require_relative 'airport'

# AirportController Class, control landing and take off of planes at airports
class AirportController
  attr_reader :weather

  def initialize(weather)
    @weather = weather
  end

  WEATHER_IS_STORMY = 'The weather is stormy!'
  def instruct_plane_to_land(plane, airport)
    fail Plane::NOT_AIRBORN unless plane.location == Plane::AIRBORN
    fail WEATHER_IS_STORMY if weather.stormy?(airport)
    fail Airport::IS_FULL if airport.full?
    airport.add_plane(plane)
    plane.location = airport
    true
  end

  def instruct_plane_to_take_off(plane, airport)
    fail Plane::IS_AIRBORN if plane.location == Plane::AIRBORN
    fail Airport::NOT_IN_THIS_AIRPORT unless airport.plane?(plane)
    fail WEATHER_IS_STORMY if weather.stormy?(airport)
    airport.remove_plane(plane)
    plane.location = Plane::AIRBORN
    true
  end

end
