require_relative 'airplane'
require_relative 'weather'

class Airport

  DEFAULT_VALUE = 10
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_VALUE, weather=Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def planes
    @planes.dup
  end

  def allow_landing(plane)
    raise 'Too stormy to land' if stormy?
    raise 'Plane already landed' if plane.landed == true
    raise 'Airport is full' if full?
    plane.land_plane
    @planes << plane
  end

  def allow_takeoff(plane)
    raise 'Plane already taken off' if already_flying?(plane)
    raise 'Plane not at that airport' if not_at_that_airport(plane)
    raise 'Too stormy to take off' if stormy?
    plane.take_off
    @planes.delete(plane)
  end

private

  def full?
    planes.size >= @capacity
  end

  def stormy?
    @weather.stormy
  end

  def already_flying?(plane)
    plane.landed == false
  end

  def not_at_that_airport(plane)
    !planes.include? plane
  end

end
