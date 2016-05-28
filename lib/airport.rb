require 'weather'

class Airport

  def initialize(current_weather)
    @current_weather = current_weather
    @planes = []
  end

  def dock(plane)
    fail "Weather is too stormy, cannot land" if current_weather.is_stormy?
    @planes = plane
  end

  def release
    fail "Weather is too stormy, cannot take off" if current_weather.is_stormy?
    @planes
  end

  private

  attr_reader :planes, :current_weather

end
