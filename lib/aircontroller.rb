module AirController

  WEATHER = [:sunny, :stormy]

  def landing_plane(plane)
    fail "The Airport is full" if plane_hangar_full?
    fail "Bad weather conditions" if weather_stormy?
    plane_landed(plane)
  end

  def taking_off_plane
    fail "No planes at the airport" if plane_hangar_empty?
    fail "Bad weather conditions" if weather_stormy?
    plane_took_off
  end

  private

  def plane_landed(plane)
    plane.landing
    planes << plane
  end

  def plane_took_off
    planes.shift.take_off
  end

  def weather_forecast
    WEATHER.sample
  end

  def weather_stormy?
    weather_forecast == :stormy
  end

end
