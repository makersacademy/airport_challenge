require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :planes
  attr_reader :capacity
  attr_accessor :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport full, permisson to land denied' if full?
    raise 'Plane cannot land due to bad weather' if weather.stormy?

    planes << plane
    "Cleared to land"
  end

  def take_off
    raise 'Planes are grounded due to bad weather' if weather.stormy?

    planes.pop
    'Cleared for take off'
  end

  def full?
    planes.length == capacity
  end
end
  # For a random number generator but difficult to use with a guard
  # condition in testing???
  # def stormy?
  #  rand(1..100) > 80
  # end
