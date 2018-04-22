require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :capacity, :planes, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off
    fail "No planes to take off" if empty?
    fail "Too stormy to take off" if weather.stormy?
    @planes.pop
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail "Too stormy to land" if weather.stormy?
    @planes << plane
  end

private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

end
