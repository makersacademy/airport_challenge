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
    fail 'ERROR: it is too stormy to land' if forecast(weather)
    fail 'ERROR: the airport is full' if full?
    fail 'ERROR: plane has already landed' if status?(plane)
    plane.landing
    planes << plane
  end

  def request_takeoff(plane, weather)
    fail 'ERROR: it is too stormy to take off' if forecast(weather)
    fail 'ERROR: plane has already taken off' unless status?(plane)
    #fail 'ERROR: The airport is empty' if empty?
    plane.take_off
    planes.shift
  end

  private
  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def forecast(weather)
    weather.storms?
  end

  def status?(plane)
    plane.status?
  end
end
