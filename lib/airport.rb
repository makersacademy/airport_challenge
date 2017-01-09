require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_accessor :weather

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new.current_weather
  end

  def land(plane)
    raise "Airport is full." if full?
    raise "Plane cannot land due to stormy weather." if self.weather == "stormy"
    @planes << plane
    plane.landed
    plane
  end

  def take_off
    raise "No planes in airport." if empty?
    raise "Plane cannot take off due to stormy weather." if self.weather == "stormy"
    plane = @planes.pop
    plane.departed
  end

private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

end
