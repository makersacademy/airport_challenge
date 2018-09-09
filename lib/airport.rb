require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :grounded_planes, :weather
  # attr_accessor :grounded_planes, :weather
  DEFAULT_CAPACITY = 20

  def initialize
    @grounded_planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Unable to land: bad weather" if is_stormy?
    fail "Unable to land: airport full" if full?
    @grounded_planes << plane
    #p @grounded_planes
  end

  def takeoff(plane)
    fail "Unable to takeoff: bad weather" if is_stormy?
    fail "Unable to takeoff: no planes in airport" if empty?
    @grounded_planes.shift
    p "Plane has taken off"
    #p @grounded_planes
  end

  def is_stormy?
    @weather.is_stormy?
  end

  def full?
    true if @grounded_planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    true if @grounded_planes.empty?
  end

end
