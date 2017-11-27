require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 15
  attr_reader :planes
  attr_accessor :capacity, :weather
    # hashes rather than = as have more than one argument!!!!!
  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @weather = weather
    @capacity = DEFAULT_CAPACITY
  end

  def land(a_plane)
    fail "Bad weather, too dangerous to land" if stormy?
    fail "Airport full" if full?
    @planes.push(a_plane) # undefined method << and .push???
    "The plane has landed"
  end

  def take_off(a_plane)
    fail "No planes" if @planes.empty?
    fail "Bad weather, all planes grounded" if stormy?
    @planes.delete(a_plane)
    "The plane has taken off"
  end

private

  def stormy?
    @weather.the_weather == :stormy
  end

  def full?
    @planes.length == @capacity
  end
end

# done!!!
