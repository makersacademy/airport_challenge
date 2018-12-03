require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_reader :planes
  attr_reader :weather

  def initialize(capacity = 2)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "stormy" if @weather.stormy? == true
    fail "full" if full? == true
    fail "plane already in the hanger" if @planes.include?(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "stormy" if @weather.stormy? == true
    fail "plane not in the hanger" unless @planes.include?(plane)
    index = @planes.index(plane)
    @planes.delete_at(index)
  end

  private
  def full?
    @planes.length >= @capacity
  end
end
