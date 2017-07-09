require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :plane, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @weather = weather
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    fail "#{plane} has already landed" if @planes.include?(plane)
    fail 'Storms prevent landing' if weather.stormy?
    plane.flying = false
    plane.landed = true
    @plane = plane
    @planes << plane
  end

  def take_off(plane)
    fail 'No planes currently at the airport' if empty?
    fail 'Storms prevent take off' if weather.stormy?
    fail "Cannot take off. #{plane} is flying" if plane.flying == true
    plane.flying = true
    plane.landed = false
    @planes.delete(plane)
    @plane = nil
    "#{plane} has taken off"
  end

  private
  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
