require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY, weather=Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Airport is full" if @planes.count >= capacity
    raise "Weather too stormy to land" if weather.stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Airport is empty' if @planes.empty?
    raise "Weather too stormy to take off" if weather.stormy?
    @planes.pop
  end

  def planes
    @planes
  end

end