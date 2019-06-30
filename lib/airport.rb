require_relative 'plane'
require_relative 'weather'

Airport = Class.new

class Airport

  attr_reader :planes_airport
  attr_reader :CAPACITY

  def initialize(name = "Heathrow", capacity = 10)
    @name = name
    @planes_airport = []
    @CAPACITY = capacity
  end

  def land(plane, weather)
    land_plane(plane) if clear_for_landing?(plane, weather)
  end

  def take_off(plane, weather)
    take_off_plane(plane) if clear_for_take_off(plane, weather)
  end

private

  def clear_for_landing?(plane, weather)
    check_storm(weather) && check_space && plane.flying
  end

  def clear_for_take_off(plane, weather)
    check_storm(weather) && plane.airport == @name
  end

  def take_off_plane(plane)
    @planes_airport.delete(plane)
    plane.change_airport("")
    plane.land
    return plane
  end

  def land_plane(plane)
    plane.change_airport(@name)
    plane.land
    @planes_airport << plane
    return plane
  end

  def check_storm(weather)
    weather.stormy == false
  end

  def check_space
    @planes_airport.size < @CAPACITY
  end

end
