require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :plane
  attr_accessor :planes
  attr_accessor :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
  @planes = Array.new
  @weather = weather
  @capacity = capacity
  end

  def release_plane
    plane = Plane.new
  end

  def land(plane)
    @plane = plane
    fail 'plane cannot land in stormy weather' if @weather.stormy?
    fail 'plane has already landed' if plane_has_landed
    fail 'Airport is full' if full?
    @planes << @plane
    @planes
  end

  def plane_has_landed
    @planes.include? @plane
  end

  def take_off(plane)
    fail 'plane cannot take off in stormy weather' if @weather.stormy?
    fail 'no planes to take off' unless @planes.include? @plane
    @planes.pop
  end

  def planecount
    @planes.length
  end

  def full?
    planecount >= @capacity
  end

end
