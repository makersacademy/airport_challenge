require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity
  attr_reader :planes
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail "Already landed" if landed?(plane)
    fail "Too stormy to land" if stormy_weather?
    fail "Airport full! No space to land" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "Plane already flying" if landed?(plane) == false
    fail "Wrong airport!" if wrong_airport?(plane)
    fail "Too stormy for take off" if stormy_weather?
    plane = @planes.pop
  end

  def wrong_airport?(plane)
    ! @planes.include?(plane)
  end

  private
  def landed?(plane)
    plane.landed
  end

  def stormy_weather?
    @weather.stormy?
  end

  def full?
    @planes.length >= @capacity
  end
end
