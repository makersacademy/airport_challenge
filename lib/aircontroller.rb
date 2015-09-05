module AirController

  WEATHER = [:sunny, :stormy]

  def landing_plane(plane)
    fail "The Airport is full" if plane_hangar_full?
    fail "Bad weather conditions" if weather_stormy?
    plane_landed(plane)
  end

  def taking_off_plane(plane = planes[0])
    fail "No planes at the airport" if plane_hangar_empty?
    fail "Bad weather conditions" if weather_stormy?
    plane_took_off(plane)
  end
  
  private

  def plane_landed(plane)
    plane.landing
    planes << plane
  end

  def plane_took_off(plane)
    plane.take_off
    planes.shift
  end

  def weather_forecast
    WEATHER.sample
  end

  def weather_stormy?
    return true if weather_forecast == :stormy
  end

end
