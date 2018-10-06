require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    raise("Plane has already landed") if @hangar.include?(plane)
    @hangar << plane
    "Plane has landed"
  end

  def takeoff(plane)
    raise("Plane is not at airport") unless @hangar.include?(plane)
    raise("Cannot takeoff in stormy weather") if current_weather == "Stormy"
    @hangar.delete(plane)
  end

  private

  def current_weather
    @weather.current
  end
end
