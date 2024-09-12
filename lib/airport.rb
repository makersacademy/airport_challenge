require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landing(plane)
    weather_check
    capacity_check
    landing_check(plane)
    @planes.push(plane)
  end

  def depart(plane)
    weather_check
    takeoff_check(plane)
    @planes.delete(plane)
    plane_left_notification(plane)
  end

private

  def plane_left_notification(plane)
    puts "#{plane} has left the airport"
    one_plane = "No planes now docked #{self}"
    @planes.empty? ? (puts one_plane) : list_planes_at_airport
  end

  def list_planes_at_airport
    puts "Planes currently docked at #{self}: #{@planes.join(', ')}"
  end

  def full?
    @planes.count >= @capacity
  end

  def capacity_check
    fail "Airport at capacity" if full?
  end

  def the_weather
    Weather.new.forecast
  end

  def weather_check
    fail 'DANGER: Storm Forecast' if the_weather == :stormy
  end

  def takeoff_check(plane)
    fail "Plane not docked at #{self}" if plane.docked_at != self
  end

  def landing_check(plane)
    fail "Plane already docked at another airport" if plane.docked_at != nil
  end

end
