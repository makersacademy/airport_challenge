require_relative 'weather'

class Airport

  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(weather=Weather.new, capacity=DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport at full capacity' if full?
    fail "Plane cannot land due to stormy weather" if weather.stormy == true
    @planes << plane
    self
  end

  def plane_takeoff
    fail "There are no planes in the airport" if empty?
    fail "Plane cannot take-off due to stormy weather" if weather.stormy == true
    @planes.pop
    self
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.count.empty?
  end
end