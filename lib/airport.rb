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
    planes.delete(plane)
    "#{plane} has now taken off"
  end

  def count_planes
    planes.size
  end

  def fly_okay?
    return true if Weather.check_weather == "Safe to fly"
    return false if Weather.check_weather == "Stormy"
    fail "Something went wrong, try again"
  end

end
