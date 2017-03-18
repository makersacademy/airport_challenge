require_relative "plane.rb"
require_relative "weather.rb"


class Airport

  include Weather

  attr_reader :planes

  def initialize()
    @planes = []
  end

  def land_plane(plane)
    planes.push(plane)
    "#{plane} has landed successfully"
  end

  def take_off(plane)
    fail "Flight canceled due stormy weather" if fly_okay? != true
    planes.delete(plane)
    "#{plane} has now taken off"
  end

  def count_planes
    planes.size
  end

  def fly_okay?
    weather = Weather.check_weather
    return false if weather == "Stormy"
    return true if weather == "Safe to fly"
  end

end
