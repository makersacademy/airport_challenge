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
    raise "Can't land plane!" if should_not_land?(plane)
    plane.flight_status = :landed
    @landed_planes << plane
  end
  # would be good to have more specific raise messages about why the plane can't land
  # (e.g. already landed, already taken off, stormy weather)

  def takeoff(plane)
    raise "Can't take off plane!" if should_not_take_off?(plane)
    plane.flight_status = :taken_off
    @landed_planes.delete(plane)
  end

  # would be good to have more specific raise messages about why the plane can't takeoff
  # (e.g. already landed, already taken off, stormy weather)
  def present?(plane)
    @landed_planes.include?(plane)
  end

  private

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

end
