require './lib/plane'
require './lib/weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new
    @plane = Plane.new
  end

  def landing(plane)
    fail 'Unable to land' if unsafe_weather? || full?
    @hangar << plane
    plane.land
  end

  def takeoff
    fail 'Unable to takeoff' if unsafe_weather? || empty?
    @hangar.pop
    @plane.takeoff
  end

  private

  def full?
    @hangar.count >= capacity
  end

  def empty?
    @hangar.empty?
  end

  def unsafe_weather?
    @weather.stormy?
  end

end
