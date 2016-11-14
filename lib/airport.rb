require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :plane, :weather, :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
  @planes = []
  @weather = weather
  @capacity = capacity
  end

  def land(plane)
    fail 'plane cannot land in stormy weather' if @weather.stormy?
    fail 'plane has already landed' if plane_has_landed(plane)
    fail 'Airport is full' if full?
    @planes << plane
  end

  def plane_has_landed(plane)
    @planes.include? plane
  end

  def take_off(plane)
    fail 'plane cannot take off in stormy weather' if @weather.stormy?
    fail 'no planes to take off' unless plane_has_landed(plane)
    @planes.pop
  end

  def planecount
    @planes.length
  end

  def full?
    planecount >= @capacity
  end

end
