require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity
  attr_reader :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end


  def land plane
    fail 'Airport if full' if !@planes.empty? and @planes.size >= @capacity
    fail "Stormy weather, no landing" if @weather.stormy?
    @planes << plane
    "The plane #{plane} has landed"
  end

  def take_off plane
    fail "Stormy weather, no take offs" if @weather.stormy?
    "The plane #{planes.delete plane} has taken off"
  end
end
