require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :capacity
  DEFAULT_CAPACITY = 60

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def request_landing(plane, weather)
    fail 'ERROR: it is too stormy to land' if weather.storms?
    fail 'ERROR: the airport is full' if full?
    #fail 'ERROR: plane has already landed' if plane.status?
    plane.landing
    planes << plane
  end

  def request_takeoff(plane, weather)
    fail 'ERROR: it is too stormy to take off' if weather.storms?
    plane.take_off
    planes.shift
  end

  private
  attr_reader :planes

  def full?
    planes.count >= capacity
  end
end
