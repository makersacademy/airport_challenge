require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :grounded_planes, :weather
  # attr_accessor :grounded_planes, :weather

  def initialize
    @grounded_planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Unable to land: bad weather" if is_stormy? == true
    fail "Unable to land: airport full" if full? == true
    @grounded_planes << plane
  end

  def takeoff(plane)
    fail "Unable to takeoff: bad weather" if is_stormy? == true
    @grounded_planes.shift
    p "Plane has taken off"
    #p @grounded_planes should = []
  end

  def is_stormy?
    @weather.is_stormy?
  end

  def full?
    true if @grounded_planes.count >= 20
  end
end
