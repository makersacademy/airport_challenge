require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_reader :planes

  def initialize(capacity = 5)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def full?
    @planes.length >= @capacity
  end

  def land(plane)
    fail "stormy" if @weather.stormy? == "stormy"
    fail "full" if self.full? == true
    @planes << plane
  end

  def take_off(plane)
    fail "stormy" if @weather.stormy? == "stormy"
    @planes.pop
  end
end
