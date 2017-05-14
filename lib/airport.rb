require './lib/plane'
require './lib/weather'

class Airport

  MAX_CAPACITY = 10

  attr_reader :landed_planes

  def initialize(station = WeatherStation.new, capacity = MAX_CAPACITY)
    @landed_planes = []
    @station = station
    @capacity = capacity
  end

  def land(plane)
    raise "Can't land plane!" if should_not_land?(plane)
    plane.flight_status = :landed
    @landed_planes << plane
  end

  def takeoff(plane)
    raise "Can't take off plane!" if should_not_take_off?(plane)
    plane.flight_status = :taken_off
    @landed_planes.delete(plane)
  end

  def should_not_land?(plane)
    plane.landed? || plane.taken_off? || stormy? || at_capacity?
  end

  def should_not_take_off?(plane)
    plane.flying? || plane.taken_off? || stormy?
  end

  def stormy?
    @station.todays_weather == :stormy
  end

  def at_capacity?
    @landed_planes.length >= @capacity
  end

  def present?(plane)
    @landed_planes.include?(plane)
  end

end
