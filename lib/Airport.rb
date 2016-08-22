require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :landed_planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail "You can not land since airport is full" if full?
    fail "Unable to land due to stormy weather" if weather_check == "stormy"
    fail "This plane has already landed" if landed_planes.include?(plane)
    @landed_planes << plane
    plane.landed
  end

  def weather_check
    "stormy" if @weather.stormy?
  end

  def take_off(plane)
    fail "No planes are in the airport" if empty?
    fail "You can not take off in stormy weather" if weather_check == "stormy"
    fail "#{plane} is not airport" if @landed_planes.include?(plane) == false
    @landed_planes.delete(plane)
    plane.left
    "#{plane} took of successfully"
  end

  def full?
    @landed_planes.count >= @capacity
  end

  def empty?
    @landed_planes.empty?
  end
private
attr_reader :weather
end
