require_relative "../lib/weather.rb"
require_relative "../lib/plane.rb"

class Airport
  attr_accessor :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    current_weather = Weather.new
    fail "Due to storms, no planes will land today" if current_weather.forecast == 'stormy'
    fail "The airport is full" if @planes.count >= @capacity
    @planes << plane
    @planes.last
  end

  def take_off
    current_weather = Weather.new
    fail "Due to storms, no planes will take off today" if current_weather.forecast == 'stormy'
    fail "There are no planes available" if @planes.empty?
    @planes.pop
  end
end
