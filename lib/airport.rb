require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 50

  attr_accessor :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def takeoff
    fail "No planes in airport" if empty?
    fail "Stormy weather" if weather.stormy?
    planes.pop
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Stormy weather" if weather.stormy?
     planes << plane
  end

  def stormy?
   weather.stormy?
  end

  private
  attr_reader :planes


  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end