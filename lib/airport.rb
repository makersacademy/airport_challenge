require_relative 'plane'
require_relative 'weather'

class Airport

  MAX_CAPACITY = 10

  attr_reader :landed_planes, :capacity, :station

  def initialize(station = WeatherStation.new, capacity = MAX_CAPACITY)
    @landed_planes = []
    @station = station
    @capacity = capacity
  end

  def land(plane)
    raise "Can't land plane! It's #{plane.flight_status}!" if should_not_land?(plane)
    raise "Can't land plane! Stormy weather!" if stormy?
    raise "Can't land plane! Airport is at capacity!" if at_capacity?
    plane.flight_status = :landed
    @landed_planes << plane
  end

  def takeoff(plane)
    raise "Can't take off plane! It's #{plane.flight_status}!" if should_not_take_off?(plane)
    raise "Can't take off plane! Stormy weather!" if stormy?
    plane.flight_status = :taken_off
    @landed_planes.delete(plane)
  end

  def present?(plane)
    @landed_planes.include?(plane)
  end

  private
  def should_not_land?(plane)
    plane.landed? || plane.taken_off?
  end

  def should_not_take_off?(plane)
    plane.flying? || plane.taken_off?
  end

  def stormy?
    @station.todays_weather == :stormy
  end

  def at_capacity?
    @landed_planes.length >= @capacity
  end

end
