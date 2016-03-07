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
    raise 'Airport is full' if full?
    plane.land_plane
    @planes << plane
  end

  def allow_takeoff(plane)
    raise 'Plane not at that airport' if !planes.include? plane
    raise 'Too stormy to take off' if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def full?
    planes.size >= @capacity
  end

  def stormy?
    @weather.stormy
  end

end
