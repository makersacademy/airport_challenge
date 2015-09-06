module AirController

  WEATHER = [:sunny, :stormy]

  def permission_to_land(*plane)
    fail "The Airport is full" if plane_hangar_full?
    fail "Bad weather conditions" if weather_stormy?
    plane_landed(*plane)
  end

  def permission_to_take_off(*plane)
    fail "No planes at the airport" if plane_hangar_empty?
    fail "Bad weather conditions" if weather_stormy?
    plane_took_off(*plane)
  end

  private

  def plane_landed(*plane)
    x = plane.each { |plane| plane.landing }
    planes << x.flatten
    planes.flatten!
  end

  def plane_took_off(*plane)
    plane.each { |plane| plane.take_off }
    planes.delete_if { |plane| plane.flying }
  end

  def weather_forecast
    WEATHER.sample
  end

  def weather_stormy?
    weather_forecast == :stormy
  end

end
