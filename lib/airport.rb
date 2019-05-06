require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new.weather)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    land_guards(plane)
    plane.landed
    planes << plane
  end

  def take_off(plane)
    take_off_guards(plane)
    planes.delete(plane)
    plane.taken_off
    planes
  end

  def land_guards(plane)
    raise "Abort - Airport full" if full?
    raise "Too stormy to land right now" if stormy?
    raise "Plane already at the airport!" if plane_at_airport?(plane)
    raise "Plane already at another airport" unless airborne?(plane)
  end

  def take_off_guards(plane)
    message = "Specified plane at another airport"
    raise message if !airborne?(plane) && !plane_at_airport?(plane)
    raise "Plane already airborne" if airborne?(plane)
    raise "Too stormy to take off right now" if stormy?
  end

  def full?
    planes.length >= capacity
  end

  def stormy?
    weather == :stormy
  end

  def plane_at_airport?(plane)
    planes.include?(plane)
  end

  def airborne?(plane)
    plane.airborne == true
  end

  private

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100
end
