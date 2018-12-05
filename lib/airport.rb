require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_reader :planes, :weather

  def initialize(capacity = 2)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "stormy" if stormy?
    fail "full" if full?
    fail "plane already in the hanger" if in_hanger?(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "stormy" if stormy?
    fail "plane not in the hanger" unless in_hanger?(plane)
    index = @planes.index(plane)
    @planes.delete_at(index)
  end

  private
  def stormy?
    weather.stormy?
  end

  def full?
    @planes.length >= @capacity
  end

  def in_hanger?(plane)
    @planes.include?(plane)
  end
end
