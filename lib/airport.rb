require './lib/plane'
require './lib/weather'

class Airport

  MAX_CAPACITY = 10

  attr_reader :landed_planes

  def initialize(station = WeatherStation.new)
    @landed_planes = []
    @station = station
    @capacity = MAX_CAPACITY
  end

  def land(plane)
    if plane.landed? || plane.taken_off? || stormy? || at_capacity?
      raise "Can't land plane!"
    else
      plane.flight_status = :landed
      @landed_planes << plane
    end
  end

  def takeoff(plane)
    if plane.flying? || plane.taken_off? || stormy?
      raise "Can't take off plane!"
    else
      plane.flight_status = :taken_off
      @landed_planes.delete(plane)
    end
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
